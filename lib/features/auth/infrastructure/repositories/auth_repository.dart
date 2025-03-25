import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository_interface.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/presentation/extensions/date_time_extension.dart';
import '../../domain/entities/auth_exeptions/error_handler.dart';

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this.authTokenLocalDataSource, this.client, this.type);

  final AuthTokenLocalDataSource authTokenLocalDataSource;
  final GoTrueClient client;
  final GenerateLinkType type;

  static const String _table = 'auth_users_table';
  final CubeUser cuberUserModel = CubeUser();

  final realTimeChanelConfig = const RealtimeChannelConfig(
    key: '',
    self: true,
    ack: true,
  );

  // Helper method to log information
  void _logInfo(String message) {
    if (kDebugMode) {
      developer.log(message);
    }
  }

  SupabaseClient get authClient => throw UnimplementedError();

  @override
  void authStateChange(void Function(UserModel? userEntity) callback) {
    final myChannel = authClient.channel('base_de_test');

    myChannel
        .onPresenceSync((payload) {})
        .onPresenceJoin((payload) {})
        .onPresenceLeave((payload) {})
        .subscribe(
      (status, error) async {
        if (status == RealtimeSubscribeStatus.subscribed) {
          await myChannel
              .track({'online_at': DateTime.now().toIso8601String()});
        } else {
          logErrorSwitchException('authStateChange() error: $error');
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
              _logInfo('Channel connection successful: $res');

              return right(true);
            case ChannelResponse.timedOut:
              return left(Failure.unprocessableEntity(
                  message: 'Channel connection timed out: $res'));
            case ChannelResponse.rateLimited:
            case ChannelResponse.error:
              return left(Failure.badRequest());
          }
        },
        onError: (error) => logErrorSwitchException(error),
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
  Future<Either<Failure, bool>> signInWithApple() async {
    try {
      final provider = OAuthProvider.apple;
      // Tentative de connexion via Google OAuth avec Supabase
      final res = await client.signInWithOAuth(
        provider,
        authScreenLaunchMode: LaunchMode.inAppWebView,
        redirectTo: 'io.supabase.flutter://reset-callback/',
      );

      // Vérification du résultat de l'authentification
      if (!res) {
        _logInfo('signInWithGoogle() error: $res');
        return left(Failure.badRequest());
      }

      await linkAccount(provider);

      // Si l'authentification réussit
      _logInfo('signInWithGoogle() success: $res');
      return right(true); // Retourne un succès avec un résultat booléen
    } catch (e) {
      // Gestion des erreurs inattendues lors de l'authentification
      logErrorSwitchException('signInWithGoogle() exception: $e');
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    try {
      final provider = OAuthProvider.google;
      // Tentative de connexion via Google OAuth avec Supabase
      final res = await client.signInWithOAuth(
        provider,
        authScreenLaunchMode: LaunchMode.inAppWebView,
        redirectTo: 'io.supabase.flutter://reset-callback/',
      );

      // Vérification du résultat de l'authentification
      if (!res) {
        _logInfo('signInWithGoogle() error: $res');
        return left(Failure.badRequest());
      }

      await linkAccount(provider);

      // Si l'authentification réussit
      _logInfo('signInWithGoogle() success: $res');
      return right(true); // Retourne un succès avec un résultat booléen
    } catch (e) {
      // Gestion des erreurs inattendues lors de l'authentification
      logErrorSwitchException('signInWithGoogle() exception: $e');
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithPassword(
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

      final Session? session = res.session;
      final User? user = res.user;

      if (session == null || user == null) {
        await authTokenLocalDataSource.remove();
        return left(Failure.unauthorized());
      }

      return right(session.user);
    } catch (e) {
      logErrorSwitchException('signInWithPassword exception: $e');
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

      final Session? data = response.session;
      final User? user = response.user;

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
      logErrorSwitchException('signUp exception: $e');
      return left(Failure.unprocessableEntity(
          message: 'Erreur lors de l\'inscription.'));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyCode(
      String email, String code) async {
    final res =
        await client.verifyOTP(email: email, token: code, type: OtpType.signup);
    _logInfo('response api verify code: $res');

    if (res.user != null) {
      await authTokenLocalDataSource.store(res.session?.tokenType ?? '');
    }

    final Session? session = res.session;
    final User? user = res.user;

    await client.signInWithOtp(email: res.user!.email, shouldCreateUser: true);

    if (session == null || user == null) {
      await authTokenLocalDataSource.remove();
      await authClient
          .from('auth_users_table')
          .delete()
          .match({'id': user!.id});
      return left(Failure.unauthorized());
    }
    return right(AuthResponse(session: session, user: user));
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
    } on PostgrestException catch (e) {
      logErrorSwitchException(e);
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
  Either<Failure, AuthResponse> logErrorSwitchException(Object e) =>
      AuthErrorHandler.handleError(e);

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

  Future<Either<Failure, bool>> linkAccount(OAuthProvider provider) async {
    try {
      final isLinked = await authClient.auth.linkIdentity(provider);

      // Vérifiez si la liaison a réussi
      if (!isLinked) {
        throw Exception(
            'Erreur lors de la liaison du compte avec ${provider.toString()}');
      }

      // Si l'utilisateur a été lié avec succès, vous pouvez obtenir le nouvel utilisateur
      final user = authClient.auth.currentUser;
      if (user != null) {
        developer.debugger(
            when: kDebugMode,
            message: 'Compte lié avec succès à ${user.email}');
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      // Gestion d'erreurs générales (celles qui viennent de Supabase ou du processus en général)
      logErrorSwitchException(e);
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  // retrouver toutes les identités liées à un utilisateur
  Future<void> unlinkGoogleIdentity() async {
    try {
      // Retrieve all identities linked to the user
      final List<UserIdentity> identities =
          await authClient.auth.getUserIdentities();

      // Find the Google identity linked to the user
      final UserIdentity googleIdentity = identities.singleWhere(
        (identity) => identity.provider == 'google',
        orElse: () => identities.removeLast(),
      );

      // Unlink the Google identity from the user
      await authClient.auth.unlinkIdentity(googleIdentity);

      _logInfo('Google identity successfully unlinked.');
    } catch (e) {
      logErrorSwitchException('Error unlinking Google identity: $e');
    }
  }
}
