import 'dart:async';

import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/presentation/states/auth/auth_state.dart'
    as perso;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthControllerStateNotifier extends StateNotifier<perso.AuthState> {
  AuthControllerStateNotifier(this._repository)
      : super(const perso.AuthState.unauthenticated(
            status: perso.AuthStatus.unauthenticated)) {
    _subscription =
        _repository.authClient.auth.onAuthStateChange.listen((event) {
      _onUserChanged(event);
    });
  }

  late final StreamSubscription<supabase.AuthState> _subscription;

  final AuthRepository _repository;

  perso.AuthState _getAuthStateFromUser(supabase.User? user) {
    if (user == null || user.id.isEmpty) {
      return const perso.AuthState.unauthenticated(
          status: perso.AuthStatus.unauthenticated);
    } else {
      return perso.AuthState.authenticated(
        status: perso.AuthStatus.authenticated,
        userEntity: UserModel.complete(
          id: UserId(value: int.parse(user.id)),
          userEntityModel: UserEntityModel.fromJson(user.toJson()),
        ),
      );
    }
  }

  void _onUserChanged(supabase.AuthState authState) {
    final supabase.AuthChangeEvent event = authState.event;
    final supabase.Session? session = authState.session;
    final supabase.User? user = session?.user;

    switch (event) {
      case supabase.AuthChangeEvent.signedIn:
      case supabase.AuthChangeEvent.tokenRefreshed:
      case supabase.AuthChangeEvent.userUpdated:
        state = _getAuthStateFromUser(user);
        break;
      case supabase.AuthChangeEvent.signedOut:
        onSignOut();
        state = const perso.AuthState.unauthenticated(
            status: perso.AuthStatus.unauthenticated);
        break;
      case supabase.AuthChangeEvent.passwordRecovery:
      case supabase.AuthChangeEvent.userDeleted:
      case supabase.AuthChangeEvent.mfaChallengeVerified:
        // When MFA challenge is verified, the user is now fully authenticated.
        state =
            _getAuthStateFromUser(user); // Update the state with the user data
        break;
      case supabase.AuthChangeEvent.initialSession:
        // Handle these events if needed
        break;
    }
  }

  Future<perso.AuthState?> onSignInWithPassword(
      String email, String password) async {
    final userModel = await _repository.signInWithPassword(email, password);
    if (userModel.exists((r) => r.id.isNotEmpty)) {
      final user = userModel.toNullable();
      if (user != null) {
        state = perso.AuthState.authenticated(
            status: perso.AuthStatus.authenticated,
            userEntity: UserModel.complete(
                id: UserId(value: int.parse(user.id)),
                userEntityModel: UserEntityModel.fromJson(user.toJson())));
      }
    } else {
      state = const perso.AuthState.unauthenticated(
          status: perso.AuthStatus.unauthenticated);
    }
    return state;
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

final authStateProvider = StateNotifierProvider.autoDispose<
    AuthControllerStateNotifier, perso.AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthControllerStateNotifier(repo);
}, name: 'auth controller state notifier');
