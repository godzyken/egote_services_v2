import 'dart:convert';
import 'dart:developer' as developer;

import 'package:crypto/crypto.dart';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository_interface.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;


class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(
      this.authTokenLocalDataSource,
      this.client,
      this.supabaseClient,
      this.type,
      );

  final AuthTokenLocalDataSource authTokenLocalDataSource;
  final supabase.GoTrueClient client;
  final supabase.SupabaseClient supabaseClient;
  final supabase.GenerateLinkType type;

  static const String _table = 'auth_users_table';
  final cuberUserModel = CubeUser();

  supabase.GoTrueClient get authClient => client;

  @override
  void authStateChange(void Function(UserModel? userEntity) callback) {
    supabaseClient.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        callback(UserModel.fromJson(session.user.toJson()));
      } else {
        callback(null);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> isOnLine() async {
    try {
      final myChannel = supabaseClient.channel('presence_online_channel');

      final status = myChannel.subscribe();
      if (status == supabase.RealtimeSubscribeStatus.subscribed) {
        await myChannel.track({'online_at': DateTime.now().toIso8601String()});
        return right(true);
      } else {
        return left(Failure.unprocessableEntity(
            message: 'Impossible de rejoindre le canal temps réel.'));
      }
    } catch (e) {
      developer.log('isOnLine Error: $e');
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, UserModel>> restoreSession() async {
    try {
      final localTokenResult = authTokenLocalDataSource.get();
      if (localTokenResult.isLeft()) {
        return left(Failure.empty());
      }

      final response = await client.refreshSession();
      final session = response.session;
      final user = response.user;

      if (session == null || user == null) {
        await authTokenLocalDataSource.remove();
        return left(Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(session.providerRefreshToken ?? session.accessToken);
      return right(UserModel.fromJson(user.toJson()));
    } catch (e) {
      developer.log('restoreSession Error: $e');
      return left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, UserModel>> setSession(String token) async {
    try {
      final response = await client.setSession(token);
      final session = response.session;
      final user = response.user;

      if (session == null || user == null) {
        await authTokenLocalDataSource.remove();
        return left(Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(session.providerRefreshToken ?? session.accessToken);
      return right(UserModel.fromJson(user.toJson()));
    } catch (e) {
      developer.log('setSession Error: $e');
      return left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    try {
      final res = await client.signInWithOAuth(
        supabase.OAuthProvider.google,
        authScreenLaunchMode: supabase.LaunchMode.inAppWebView,
        redirectTo: kIsWeb ? null : 'io.supabase.flutter://reset-callback/',
      );

      if (!res) {
        return left(Failure.badRequest());
      }
      return right(true);
    } catch (e) {
      developer.log('signInWithGoogle Error: $e');
      return left(Failure.badRequest());
    }
  }

  @override
  Future<UserModel?> signIn(String email, String password) async {
    final result = await signInWithPassword(email, password);
    return result.fold(
      (failure) => null,
      (user) => UserModel.fromJson(user.toJson()),
    );
  }

  @override
  Future<Either<Failure, supabase.User>> signInWithPassword(
      String? email, String? password) async {
    try {
      if (email == null || password == null) {
        return left(Failure.badRequest());
      }

      final res = await client.signInWithPassword(
        email: email,
        password: password,
      );

      final session = res.session;
      final user = res.user;

      if (session == null || user == null) {
        await authTokenLocalDataSource.remove();
        return left(Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(session.providerRefreshToken ?? session.accessToken);

      return right(user);
    } catch (e) {
      developer.log('signInWithPassword Error: $e');
      return left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await authTokenLocalDataSource.remove();
      await client.signOut();
      return right(true);
    } catch (e) {
      developer.log('signOut Error: $e');
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUp(
      String? email, String? name, String password) async {
    try {
      if (email == null || name == null) {
        return left(Failure.badRequest());
      }

      final response = await client.signUp(
        email: email,
        password: password,
        data: {'name': name},
        emailRedirectTo: kIsWeb
            ? null
            : 'com.godzy.egote-services-v2://callback/enroll',
      );

      final user = response.user;
      final session = response.session;

      if (user == null) {
        return left(Failure.unauthorized());
      }

      if (session != null) {
        await authTokenLocalDataSource
            .store(session.providerRefreshToken ?? session.accessToken);
      }

      final now = DateTime.now();
      final userEntityModel = UserEntityModel.create(
        name,
        user.role ?? 'authenticated',
        false,
        DateTime.tryParse(user.createdAt) ?? now,
        DateTime.tryParse(user.updatedAt ?? '') ?? now,
        DateTime.tryParse(user.emailConfirmedAt ?? '') ?? now,
        DateTime.tryParse(user.phoneConfirmedAt ?? '') ?? now,
        DateTime.tryParse(user.lastSignInAt ?? '') ?? now,
      );

      await supabaseClient.from(_table).insert(userEntityModel.toJson());

      return right(UserModel.fromJson(userEntityModel.toJson()));
    } catch (e) {
      developer.log('signUp Error: $e');
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, supabase.AuthResponse>> verifyCode(
      String email, String code) async {
    try {
      final res = await client.verifyOTP(
        email: email,
        token: code,
        type: supabase.OtpType.signup,
      );

      final session = res.session;
      final user = res.user;

      if (session == null || user == null) {
        return left(Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(session.providerRefreshToken ?? session.accessToken);

      return right(res);
    } catch (e) {
      developer.log('verifyCode Error: $e');
      return left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, UserEntityModel>> createUserEntityModel(
      UserName name) async {
    try {
      final now = DateTime.now();
      final n = name.value.getOrElse((_) => '');

      final entity = UserEntityModel.create(
        n,
        'user',
        false,
        now,
        now,
        now,
        now,
        now,
      );

      final res = await supabaseClient.from(_table).insert(entity.toJson()).select();

      if (res.isEmpty) {
        return left(Failure.badRequest());
      }

      return right(UserEntityModel.fromJson(res.first));
    } on supabase.PostgrestException catch (e) {
      developer.log('PostgrestException: ${e.message}');
      return left(Failure.unauthorized());
    } catch (e) {
      developer.log('createUserEntityModel Error: $e');
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, CubeUser>> cubeUserStateChange(
      void Function(CubeUser? cubeUser) cubeUserCallBack) async {
    try {
      switch (type) {
        case supabase.GenerateLinkType.signup:
          final res = await supabaseClient.auth.admin.generateLink(
            type: type,
            email: cuberUserModel.email ?? '',
            password: cuberUserModel.password,
          );

          final actionLink = res.properties.actionLink;
          final updatedCubeUser = CubeUser(
            avatar: cuberUserModel.avatar ?? actionLink,
            customData: cuberUserModel.customData ?? actionLink,
            customDataClass: cuberUserModel.customDataClass ?? actionLink,
            email: cuberUserModel.email ?? actionLink,
            facebookId: cuberUserModel.facebookId ?? actionLink,
            id: int.tryParse(supabaseClient.auth.currentUser?.id ?? ''),
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
            externalId: int.tryParse(supabaseClient.auth.currentUser?.id ?? ''),
          );

          cubeUserCallBack(updatedCubeUser);
          return right(updatedCubeUser);

        case supabase.GenerateLinkType.emailChangeCurrent:
          if (cuberUserModel.id != null) {
            await supabaseClient.auth.admin.updateUserById(
              cuberUserModel.id.toString(),
              attributes: supabase.AdminUserAttributes(
                email: cuberUserModel.email,
                emailConfirm: true,
              ),
            );
          }

          cubeUserCallBack(cuberUserModel);
          return right(cuberUserModel);

        default:
          return right(CubeUser(email: cuberUserModel.email));
      }
    } catch (e) {
      developer.log('cubeUserStateChange Error: $e');
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithApple() async {
    try {
      final rawNonce = client.generateRawNonce();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        return left(Failure.badRequest());
      }

      final res = await client.signInWithIdToken(
        provider: supabase.OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );

      if (res.session == null) {
        return left(Failure.unauthorized());
      }

      await authTokenLocalDataSource
          .store(res.session?.providerRefreshToken ?? res.session!.accessToken);

      return right(true);
    } catch (e) {
      developer.log('signInWithApple Error: $e');
      return left(Failure.badRequest());
    }
  }

  /// Récupère l'utilisateur actuellement connecté via Supabase Auth
  /// ou bascule sur la base de données locale / cache si la session est présente.
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = client.currentUser;
      if (user != null) {
        return UserModel.fromJson(user.toJson());
      }

      final session = client.currentSession;
      if (session != null) {
        return UserModel.fromJson(session.user.toJson());
      }

      final restoreResult = await restoreSession();
      return restoreResult.fold(
            (failure) => null,
            (userModel) => userModel,
      );
    } catch (e) {
      developer.log('getCurrentUser Error: $e');
      return null;
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({String? email, String? password, String? name}) async {
    try {
      final response = await client.updateUser(
        supabase.UserAttributes(
          email: email,
          password: password,
          data: name != null ? {'name': name} : null,
        ),
      );

      final user = response.user;
      if (user == null) {
        return left(Failure.badRequest());
      }

      return right(UserModel.fromJson(user.toJson()));
    } catch (e) {
      developer.log('updateUser Error: $e');
      return left(Failure.badRequest());
    }
  }
}