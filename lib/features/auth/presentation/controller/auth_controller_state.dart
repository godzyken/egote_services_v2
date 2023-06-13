import 'dart:async';

import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/presentation/states/auth/auth_state.dart'
    as perso;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthControllerStateNotifier extends StateNotifier<perso.AuthState> {
  AuthControllerStateNotifier(this._repository)
      : super(const perso.AuthState.unauthenticated(
            status: perso.AuthStatus.unauthenticated)) {
    lastState = const perso.AuthState.unauthenticated(
        status: perso.AuthStatus.unauthenticated);

    _subscription = _repository.user!.listen((event) {
      _onUserChanged(event);
    });
  }

  StreamController<AuthResponse> controller = StreamController<AuthResponse>();

  late perso.AuthState lastState;

  late final StreamSubscription<AuthUser?> _subscription;

  final AuthRepository _repository;

  perso.AuthStatus? validator(AuthUser? value) {
    if (value!.id.isEmpty) {
      return perso.AuthStatus.authenticated;
    } else {
      return perso.AuthStatus.unauthenticated;
    }
  }

  void _onUserChanged(AuthUser? user) {
    if (user!.id.isEmpty) {
      state = const perso.AuthState.unauthenticated(
          status: perso.AuthStatus.unauthenticated);
    } else {
      state = perso.AuthState.authenticated(
          status: validator(user)!,
          userEntity: UserModel.fromJson(user.toJson()));
    }
  }

  void onSignOut() {
    _repository.signOut();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final authStateProvider =
    StateNotifierProvider<AuthControllerStateNotifier, perso.AuthState>(
        (ref) => AuthControllerStateNotifier(ref.watch(authRepositoryProvider)),
        dependencies: [authRepositoryProvider]);
