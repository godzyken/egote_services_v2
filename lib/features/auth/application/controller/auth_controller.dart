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

class AuthController extends AsyncNotifier<UserModel?> {
  late final AuthRepository _repository;

  @override
  Future<UserModel?> build() async {
    _repository = ref.watch(authRepositoryProvider);
    return _initialize();
  }

  Future<UserModel?> _initialize() async {
    try {
      final res = await _repository.client.refreshSession();
      final user = UserModel.fromJson(res.user!.toJson());
      _updateAuthState();

      await Future.delayed(const Duration(seconds: 3));
      await _handleInitialDeepLink(user);

      _repository.authStateChange((userEntity) {
        state = AsyncValue.data(userEntity);
        _updateAuthState();
      });

      return user;
    } on AuthException catch (e) {
      developer.log('AuthException: ${e.message}',
          error: e.statusCode, name: e.message);
      state = AsyncValue.error(e, StackTrace.fromString(e.message));
      return null;
    } catch (e) {
      developer.log('Error during initialisation of authController: $e');
      state = AsyncValue.error(e, StackTrace.fromString(e.toString()));
      return null;
    }
  }

  void _updateAuthState() {
    authStateListenable.value = state.hasValue;
  }

  Future<void> _handleInitialDeepLink(UserModel user) async {
    try {
      state = const AsyncValue.loading();
      final initialLink =
          await getInitialLink(user.authUser.actionLink);
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
      _updateAuthState();
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
    if (state.asData?.value != null) {
      if (state.asData?.value?.authUser.id == res.session?.user.id) {
        return res.session?.accessToken;
      }
      return res.session?.refreshToken;
    }
    return res.session?.providerToken;
  }
}

class AutoAuthController extends AsyncNotifier<UserModel?> {
  late final AuthRepository _repository;
  late final FirebaseFirestore _firestore;

  @override
  Future<UserModel?> build() async {
    _repository = ref.read(authRepositoryProvider);
    _firestore = ref.read(firebaseFirestoreProvider);
    return _initialize();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> get doc =>
      _firestore.doc('auth_users_table').snapshots();

  Future<UserModel?> _initialize() async {
    final res = await _repository.restoreSession();
    final db = _firestore.doc('auth_users_table');
    
    state = res.fold((l) => const AsyncValue.data(null), (r) {
      try {
        db.set(r.toJson(), SetOptions(merge: true));
        developer
            .log("User Data register successfully: ${r.id} in ${db.path}");
      } on FirebaseException catch (e) {
        developer.log("Initialize autoAuthController() error: ${e.message}");
      }
      return AsyncValue.data(r);
    });

    _updateAuthState();

    if (state.asData?.value == null) {
      await Future.delayed(const Duration(seconds: 3));
      await _handleInitialDeepLink();
    }

    _repository.authStateChange((userEntity) {
      state = AsyncValue.data(userEntity);
      _updateAuthState();
    });

    _repository.cubeUserStateChange((cubeUser) {
      final user = UserModel.complete(
          id: UserId(value: cubeUser!.id!),
          userEntityModel: ref.read(userNotifierProvider),
          authUser: state.asData?.value?.authUser ?? _createEmptyAuthUser(),
          cubeUser: cubeUser);
      state = AsyncValue.data(user);
      _updateAuthState();
    });

    return state.asData?.value;
  }

  void _updateAuthState() {
    authStateListenable.value = state.asData?.value != null;
  }

  Future<void> _handleInitialDeepLink() async {
    try {
      final currentUser = state.asData?.value;
      if (currentUser == null) return;

      final initialLink = await getInitialLink(currentUser.authUser.actionLink);
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
      _updateAuthState();
    } on PlatformException catch (e) {
      developer.log('PlatformException: ${e.code}',
          error: e.code, name: e.details);
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }

  Future<String?> getInitialLink(String? refreshToken) async {
    final res = await _repository.client.setSession(refreshToken!);
    return res.session?.refreshToken;
  }

  AuthUser _createEmptyAuthUser() {
    return AuthUser(
        id: 'id',
        appMetadata: {},
        userMetadata: {},
        aud: 'aud',
        email: 'email',
        phone: 'phone',
        createdAt: 'createdAt',
        role: 'role',
        updatedAt: 'updatedAt');
  }
}
