import 'dart:convert';
import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:cryptography/cryptography.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository_interface.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/presentation/extensions/date_time_extension.dart';

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this.authTokenLocalDataSource, this.client, this.type);

  final AuthTokenLocalDataSource authTokenLocalDataSource;
  final supabase.GoTrueClient client;

  static const String _table = 'auth_users_table';
  supabase.SupabaseClient get authClient => throw UnimplementedError();
  FirebaseAuth get firebaseAuth => throw UnimplementedError();
  final supabase.GenerateLinkType type;

  final CubeUser cuberUserModel = CubeUser();

  final realTimeChanelConfig = const supabase.RealtimeChannelConfig(
    key: '',
    self: true,
    ack: true,
  );

  static final _aesGcm256 = AesGcm.with256bits();

  @override
  void authStateChange(void Function(UserModel? userEntity) callback) {
    final myChannel = authClient.channel('base_de_test');

    myChannel
        .onPresenceSync((payload) {})
        .onPresenceJoin((payload) {})
        .onPresenceLeave((payload) {})
        .subscribe(
      (status, error) async {
        if (status == supabase.RealtimeSubscribeStatus.subscribed) {
          await myChannel
              .track({'online_at': DateTime.now().toIso8601String()});
        } else {
          _logError('authStateChange() error: $error');
        }
      },
    );
  }

  @override
  Future<Either<Failure, bool>> isOnLine() async {
    final myChannel = authClient
        .channel('base_de_test', opts: realTimeChanelConfig)
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'chat',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'room_id',
              value: 200,
            ),
            callback: (payload, [ref]) {
              final newRecord = payload.newRecord;
              final oldRecord = payload.oldRecord;
              _logInfo(
                  'Postgres old record: $oldRecord & Change received: $newRecord');
            })
        .subscribe((status, [_]) async {
      switch (status) {
        case RealtimeSubscribeStatus.subscribed:
        // TODO: Handle this case.
        case RealtimeSubscribeStatus.channelError:
        case RealtimeSubscribeStatus.closed:
        case RealtimeSubscribeStatus.timedOut:
        // Handle cases appropriately
      }
    });

    if (!myChannel.presence.inPendingSyncState()) {
      myChannel.onPostgresChanges(
          event: PostgresChangeEvent.delete,
          schema: 'public',
          callback: (payload) {
            _logInfo('channel delete payload: ${payload.toString()}');
          });

      myChannel.onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          callback: (payload) {
            _logInfo('channel insert payload: ${payload.toString()}');
          });

      return await myChannel
          .track({'online_at': DateTime.now().toIso8601String()}).then(
        (res) async {
          switch (res) {
            case ChannelResponse.ok:
              return right(true);
            case ChannelResponse.timedOut:
              return left(Failure.unprocessableEntity(
                  message: 'Channel connection timed out: $res'));
            case ChannelResponse.rateLimited:
            case ChannelResponse.error:
              return left(Failure.badRequest());
          }
        },
        onError: (error) => left(Failure.badRequest()),
      );
    }

    return right(true);
  }

  @override
  Future<Either<Failure, UserModel>> restoreSession() async {
    final res = authTokenLocalDataSource.get();
    if (res.isLeft()) {
      return left(Failure.empty());
    }

    final response = await authClient.auth.refreshSession();
    final data = response.session;

    if (data == null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }
    await authTokenLocalDataSource.store(data.providerRefreshToken ?? '');
    return right(UserModel.fromJson(data.user.toJson()));
  }

  @override
  Future<Either<Failure, UserModel>> setSession(String token) async {
    final response = await client.setSession(token);
    await authTokenLocalDataSource
        .store(response.session?.providerRefreshToken ?? '');

    final data = response.session;
    final user = response.user;

    if (data == null || user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(UserModel.fromJson(data.user.toJson()));
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    try {
      // Tentative de connexion via Google OAuth avec Supabase
      final res = await client.signInWithOAuth(
        supabase.OAuthProvider.google,
        authScreenLaunchMode: LaunchMode.inAppWebView,
        redirectTo: 'io.supabase.flutter://reset-callback/',
      );

      // Vérification du résultat de l'authentification
      if (!res) {
        _logError('signInWithGoogle() error: $res');
        return left(Failure.badRequest());
      }

      // Si l'authentification réussit
      _logInfo('signInWithGoogle() success: $res');
      return right(true); // Retourne un succès avec un résultat booléen
    } catch (e) {
      // Gestion des erreurs inattendues lors de l'authentification
      _logError('signInWithGoogle() exception: $e');
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, supabase.User>> signInWithPassword(
      String? email, String? password) async {
    try {
      _logInfo('signInWithPassword()');

      final res = await client.signInWithPassword(
        email: email,
        password: password!,
      );
      _logInfo('signInWithPassword response : ${res.session!.toJson()}');

      await authTokenLocalDataSource
          .store(res.session?.providerRefreshToken ?? '');

      final supabase.Session? session = res.session;
      final supabase.User? user = res.user;

      if (session == null || user == null) {
        await authTokenLocalDataSource.remove();
        return left(Failure.unauthorized());
      }

      return right(session.user);
    } catch (e) {
      _logError('signInWithPassword exception: $e');
      return left(Failure.unprocessableEntity(
          message: 'Erreur lors de l\'authentification: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    await authTokenLocalDataSource.remove();

    final res = await client.signOut().then(
          (value) => true,
          onError: left(Failure.badRequest()).call,
        );
    if (!res) {
      return left(Failure.badRequest());
    }
    return right(true);
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      String? email, String? name, String password) async {
    try {
      final response = await client.signUp(
        email: email,
        password: password,
        data: {'name': name},
        emailRedirectTo:
            kIsWeb ? null : 'com.godzy.egote-services-v2://callback/enroll',
      );

      _logInfo('response api signup: ${response.user}');

      if (response.user != null) {
        await authTokenLocalDataSource
            .store(response.session?.providerRefreshToken ?? '');
      }

      final supabase.Session? data = response.session;
      final supabase.User? user = response.user;

      if (user == null) {
        return left(Failure.unauthorized());
      }

      final UserEntityModel userEntityModel = UserEntityModel.create(
        name!,
        user.email!,
        user.role!,
        user.id,
        user.phone!,
        user.actionLink!,
        !user.isAnonymous,
        DateTime.parse(user.createdAt),
        DateTime.parse(user.updatedAt!),
        DateTime.parse(user.emailConfirmedAt!),
        DateTime.parse(user.phoneConfirmedAt!),
        DateTime.parse(user.lastSignInAt!),
      );

      await authClient.from('auth_users_table').insert(userEntityModel);

      if (data != null) {
        await setSession(data.accessToken);
        await authTokenLocalDataSource.remove();
        await authClient
            .from('auth_users_table')
            .delete()
            .match({'id': userEntityModel.id});
      } else {
        return left(Failure.unauthorized());
      }

      return right(UserModel.fromJson(userEntityModel.toJson()));
    } catch (e) {
      _logError('signUp exception: $e');
      return left(Failure.unprocessableEntity(
          message: 'Erreur lors de l\'inscription.'));
    }
  }

  @override
  Future<Either<Failure, supabase.AuthResponse>> verifyCode(
      String email, String code) async {
    final res = await client.verifyOTP(
        email: email, token: code, type: supabase.OtpType.signup);
    _logInfo('response api verify code: $res');

    if (res.user != null) {
      await authTokenLocalDataSource.store(res.session?.tokenType ?? '');
    }

    final supabase.Session? session = res.session;
    final supabase.User? user = res.user;

    await client.signInWithOtp(email: res.user!.email, shouldCreateUser: true);

    if (session == null || user == null) {
      await authTokenLocalDataSource.remove();
      await authClient
          .from('auth_users_table')
          .delete()
          .match({'id': user!.id});
      return left(Failure.unauthorized());
    }
    return right(supabase.AuthResponse(session: session, user: user));
  }

  // Helper method to log information
  void _logInfo(String message) {
    if (kDebugMode) {
      developer.log(message);
    }
  }

  // Helper method to log errors
  void _logError(String message) {
    if (kDebugMode) {
      developer.log(message, level: 1000);
    }
  }

  @override
  Future<Either<Failure, UserEntityModel>> createUserEntityModel(
      UserName name) async {
    try {
      final now = DateTimeX.current.toIso8601String();

      final n = name.value.getOrElse((l) => '');

      final entity = UserEntityModel.create(
          n,
          n,
          'role',
          'externalId',
          'phone',
          'externalLink',
          false,
          DateTime.parse(now),
          DateTime.parse(now),
          DateTime.parse(now),
          DateTime.parse(now),
          DateTime.parse(now));

      final res =
          await authClient.from(_table).insert(entity.toJson()).select();

      return right(UserEntityModel.fromJson(convertChangeData(res, {})));
    } on supabase.PostgrestException catch (e) {
      int? statusCode = int.tryParse(e.code!);

      developer.ServiceExtensionResponse.error(statusCode!, e.message);
      PostgrestException(
        code: e.code,
        details: e.details,
        hint: e.hint,
        message: e.message,
      );
      return left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, CubeUser>> cubeUserStateChange(
      GenerateLinkType type,
      CubeUser cuberUserModel,
      void Function(CubeUser? cubeUser) cubeUserCallBack) async {
    try {
      switch (type) {
        case GenerateLinkType.signup:
          return await _handleSignup(cuberUserModel, cubeUserCallBack);
        case GenerateLinkType.invite:
          return await _handleInvite(cuberUserModel, cubeUserCallBack);
        case GenerateLinkType.magiclink:
          // TODO: Handle magiclink case
          return left(Failure.unprocessableEntity(
              message: "Magiclink not implemented"));

        case GenerateLinkType.recovery:
          // TODO: Handle recovery case
          return left(
              Failure.unprocessableEntity(message: "Recovery not implemented"));

        case GenerateLinkType.emailChangeCurrent:
          return await _handleEmailChangeCurrent(
              cuberUserModel, cubeUserCallBack);

        case GenerateLinkType.emailChangeNew:
          // TODO: Handle new email change case
          return left(Failure.unprocessableEntity(
              message: "New email change not implemented"));

        case GenerateLinkType.unknown:
          return left(
              Failure.unprocessableEntity(message: "Unknown link type"));
      }
    } on developer.ServiceExtensionResponse catch (e) {
      developer.ServiceExtensionResponse.error(e.errorCode!, e.errorDetail!);
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> signInWithApple() async {
    try {
      final rawNonce = authClient.auth.generateRawNonce();
      final encode = utf8.encode(rawNonce);
      final hashedNonce = _aesGcm256.newSecretKeyFromBytes(encode).toString();

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        throw const AuthException(
          'Could not find ID Token from generated credential.',
        );
      }
      final response = await authClient.auth.signInWithIdToken(
        provider: supabase.OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );
      return right(response);
    } catch (e) {
      // Logging des erreurs spécifiques
      return logErrorSwitchException(e);
    }
  }

/*  Future<Either<Failure, AuthResponse>> signInWithPhoneNumber(
      String phoneNumber) async {
    try {
      final response = await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) =>
            firebaseAuth.signInWithCredential(credential),
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      return right(response);
    } catch (e) {
      // Logging des erreurs spécifiques
      return logErrorSwitchException(e);
    }
  }*/

  Either<Failure, supabase.AuthResponse> logErrorSwitchException(Object e) {
    if (e is AuthException) {
      _logError('AuthException: ${e.message}');
      return left(Failure.unprocessableEntity(message: e.message));
    } else if (e is PostgrestException) {
      int? statusCode = int.tryParse(e.code!);
      developer.ServiceExtensionResponse.error(statusCode!, e.message);
      PostgrestException(
        code: e.code,
        details: e.details,
        hint: e.hint,
        message: e.message,
      );
      return left(Failure.unprocessableEntity(
          message: 'PostgrestException issue during sign in with Apple.'));
    } else if (e is FirebaseException) {
      int? statusCode = int.tryParse(e.code);
      developer.ServiceExtensionResponse.error(statusCode!,
          'Erreur Firebase : ${e.message} du plugin : ${e.plugin}');
      return left(Failure.unprocessableEntity(message: e.message!));
    } else {
      _logError('Unknown error: ${e.toString()}');
      return left(Failure.empty());
    }
  }

  Future<Either<Failure, CubeUser>> _handleSignup(CubeUser cuberUserModel,
      void Function(CubeUser? cubeUser) cubeUserCallBack) async {
    try {
      final res = await authClient.auth.admin.generateLink(
          type: GenerateLinkType.signup,
          email: cuberUserModel.email!,
          password: cuberUserModel.password);

      final actionLink = res.properties.actionLink;

      final cubeUser = CubeUser(
        avatar: cuberUserModel.avatar ?? actionLink,
        customData: cuberUserModel.customData ?? actionLink,
        customDataClass: cuberUserModel.customDataClass ?? actionLink,
        email: cuberUserModel.email ?? actionLink,
        facebookId: cuberUserModel.facebookId ?? actionLink,
        id: int.tryParse(authClient.auth.currentUser!.id),
        fullName: cuberUserModel.fullName ?? actionLink,
        isGuest: cuberUserModel.isGuest,
        login: cuberUserModel.login ?? actionLink,
        oldPassword: cuberUserModel.oldPassword ?? actionLink,
        password: cuberUserModel.password ?? actionLink,
        phone: cuberUserModel.phone ?? actionLink,
        tags: cuberUserModel.tags,
        timeZone: cuberUserModel.timeZone,
        website: cuberUserModel.website ?? actionLink,
        twitterId: cuberUserModel.twitterId ?? actionLink,
        externalId: int.tryParse(authClient.auth.currentUser!.id),
      );

      cubeUserCallBack(cubeUser);
      return right(cubeUser); // Return the created CubeUser
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  // Handle Invite case
  Future<Either<Failure, CubeUser>> _handleInvite(CubeUser cuberUserModel,
      void Function(CubeUser? cubeUser) cubeUserCallBack) async {
    try {
      final res =
          await authClient.auth.admin.inviteUserByEmail(cuberUserModel.email!);
      if (res.user?.actionLink != null) {
        final cubeUser = CubeUser(isGuest: true);

        cubeUserCallBack(cubeUser);
        return right(cubeUser);
      } else {
        return left(Failure.unprocessableEntity(message: "User not found"));
      }
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  Future<Either<Failure, CubeUser>> _handleEmailChangeCurrent(
      CubeUser cuberUserModel,
      void Function(CubeUser? cubeUser) cubeUserCallBack) async {
    try {
      final res = await authClient.auth.admin.updateUserById(
          cuberUserModel.id.toString(),
          attributes: AdminUserAttributes(
              email: cuberUserModel.email, emailConfirm: true));

      final userStream =
          authClient.from('auth_users_table').stream(primaryKey: ['id']);

      await for (var event in userStream) {
        final data = event.first;
        // Assuming some kind of comparison happens here
        if (data != res.user?.toJson()) {
          return left(
              Failure.unprocessableEntity(message: "User data mismatch"));
        }
      }

      cubeUserCallBack(cuberUserModel);
      return right(cuberUserModel);
    } catch (e) {
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }
}
