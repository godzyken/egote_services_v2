import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  AuthController(this._repository) : super(const AsyncValue.loading()) {
    _initialize();
  }

  final AuthRepository _repository;

  Future<void> _initialize() async {
    state = const AsyncValue.loading();

    try {
      final res = await _repository.client.refreshSession();
      state = AsyncValue.data(UserModel.fromJson(res.user!.toJson()));
      _updateAuthState();

      if (state.hasValue) {
        await Future.delayed(const Duration(seconds: 3));

        await _handleInitialDeepLink();
      }

      _repository.authStateChange((userEntity) {
        state = AsyncValue.data(userEntity);
        _updateAuthState();
      });
    } on AuthException catch (e) {
      developer.log('AuthException: ${e.message}',
          error: e.statusCode, name: e.message);
      state = AsyncValue.error(e, StackTrace.fromString(e.message));
    } catch (e) {
      developer.log('Error during initialisation of authController: $e');
      state = AsyncValue.error(e, StackTrace.fromString(e.toString()));
    }
  }

  void _updateAuthState() {
    authStateListenable.value = state.hasValue;
  }

  Future<void> _handleInitialDeepLink() async {
    try {
      state = const AsyncValue.loading();
      final initialLink =
          await getInitialLink(state.requireValue?.authUser.actionLink);
      if (state.isRefreshing) {
        if (!(initialLink?.contains('refresh_token') ?? false)) {
          return;
        }
        final refreshTokenQueryParams = initialLink
            ?.split('&')
            .firstWhere((element) => element.contains('refresh_token'));

        final refreshToken = refreshTokenQueryParams
            ?.substring(refreshTokenQueryParams.indexOf('=') + 1);

        if (refreshToken == null) return;

        final res = await _repository.client.setSession(refreshToken);
        state = AsyncValue.data(UserModel.fromJson(res.user!.toJson()));
        res.session?.refreshToken;
        _updateAuthState();
      }
    } on PlatformException catch (e) {
      developer.log('PlatformException: ${e.code}',
          error: e.code, name: e.details);
      state = AsyncValue.error(UserModel.fromJson(e.details),
          StackTrace.fromString(e.message.toString()));
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<void> handle(UserName name) async {
    state = const AsyncValue.loading();
    final res = await _repository.createUserEntityModel(name);
    state = res.fold(
      (l) => AsyncValue.error(l.error, StackTrace.fromString(l.toString())),
      (r) => AsyncValue.data(UserModel.fromJson(r.toJson())),
    );
  }

  Future<String?> getInitialLink(String? refreshToken) async {
    final res = await _repository.client.setSession(refreshToken!);
    if (res.session!.isExpired) return res.session?.providerRefreshToken;
    if (state.isRefreshing || state.asData!.hasValue) {
      if (state.asData?.value?.authUser.id == res.session?.user.id) {
        return res.session?.accessToken;
      }
      return res.session?.refreshToken;
    }
    return res.session?.providerToken;
  }
}

class AutoAuthController extends StateNotifier<UserModel?> {
  AutoAuthController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  AuthRepository get _repository => _ref.read(authRepositoryProvider);

  Stream<DocumentSnapshot<Map<String, dynamic>>> get doc =>
      _ref.watch(firebaseFirestoreProvider).doc('auth_users_table').snapshots();

  Future<void> _initialize() async {
    final res = await _repository.restoreSession();
    final db = _ref.watch(firebaseFirestoreProvider).doc('auth_users_table');
    while (doc.isBroadcast) {
      state = res.fold((l) => null, (r) {
        try {
          db.set(r.toJson(), SetOptions(merge: true));
          return r;
        } on FirebaseException catch (e) {
          developer.log("Initialize autoauthcontroller() error: ${e.message}");
        }
      });

      _updateAuthState();
    }

    if (state == null) {
      await Future.delayed(const Duration(seconds: 3));

      await _handleInitialDeepLink();
    }

    _repository.authStateChange((userEntity) {
      state = userEntity;
      _updateAuthState();
    });

    _repository.cubeUserStateChange((cubeUser) {
      state = UserModel.complete(
          id: UserId(value: cubeUser!.id!),
          userEntityModel: _ref.watch(userNotifierProvider),
          authUser: _ref.watch(autoAuthControllerProvider)!.authUser,
          cubeUser: cubeUser);
    });
  }

  void _updateAuthState() {
    authStateListenable.value = state != null;
  }

  Future<void> _handleInitialDeepLink() async {
    state = UserModel.unComplete(
        id: const UserId(value: 0),
        userEntityModel: UserEntityModel.empty(),
        authUser: AuthUser(
            id: 'id',
            appMetadata: {},
            userMetadata: {},
            aud: 'aud',
            email: 'email',
            phone: 'phone',
            createdAt: 'createdAt',
            role: 'role',
            updatedAt: 'updatedAt'));
    try {
      final initialLink = await getInitialLink(state?.authUser.actionLink);
      if (!(initialLink?.contains('refresh_token') ?? false)) {
        return;
      }

      final refreshTokenQueryParams = initialLink
          ?.split('&')
          .firstWhere((element) => element.contains('refresh_token'));

      final refreshToken = refreshTokenQueryParams
          ?.substring(refreshTokenQueryParams.indexOf('=') + 1);

      if (refreshToken == null) return;

      final res = await _repository.client.setSession(refreshToken);
      state = UserModel.fromJson(res.user!.toJson());
      _updateAuthState();
    } on PlatformException catch (e) {
      developer.log('PlatformException: ${e.code}',
          error: e.code, name: e.details);
      state = UserModel.fromJson(e.details);
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<String?> getInitialLink(String? refreshToken) async {
    final res = await _repository.client.setSession(refreshToken!);
    return res.session?.refreshToken;
  }
}
