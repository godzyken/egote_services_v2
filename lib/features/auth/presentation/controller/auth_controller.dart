import 'dart:async';
import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';

class AuthController extends StateNotifier<UserEntityModel?> {
  AuthController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  AuthRepository get _repository => _ref.read(authRepositoryProvider);

  Future<void> _initialize() async {
    final res = await _repository.restoreSession();
    state = res.fold((l) => null, (r) => r);
    _updateAuthState();

    if (state == null) {
      await Future.delayed(const Duration(seconds: 3));

      await _handleInitialDeepLink();
    }

    _repository.authStateChange((userEntity) {
      state = userEntity;
      _updateAuthState();
    });
  }

  void _updateAuthState() {
    authStateListenable.value = state != null;
  }

  Future<void> _handleInitialDeepLink() async {
    try {
      final initialLink = await getInitialLink();
      if (!(initialLink?.contains('refresh_token') ?? false)) {
        return;
      }

      final refreshTokenQueryParams = initialLink
          ?.split('&')
          .firstWhere((element) => element.contains('refresh_token'));

      final refreshToken = refreshTokenQueryParams
          ?.substring(refreshTokenQueryParams.indexOf('=') + 1);

      if (refreshToken == null) return;

      final res = await _repository.setSession(refreshToken);
      state = res.fold((l) => null, (r) => r);
      _updateAuthState();
    } on PlatformException catch (e) {
      developer.log('PlatformException: ${e.code}',
          error: e.code, name: e.details);
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }
}
