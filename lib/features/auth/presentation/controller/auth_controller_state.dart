import 'dart:async';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/presentation/states/auth/auth_state.dart'
    as perso;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

//todo: remove authUser

class AuthControllerStateNotifier extends StateNotifier<perso.AuthState> {
  AuthControllerStateNotifier(this._repository)
      : super(const perso.AuthState.unauthenticated(
            status: perso.AuthStatus.unauthenticated)) {
    lastState = const perso.AuthState.unauthenticated(
        status: perso.AuthStatus.unauthenticated);

    _subscription =
        _repository.authClient.auth.onAuthStateChange.listen((event) {
      _onUserChanged(event);
    });
  }

  StreamController<supabase.AuthResponse> controller =
      StreamController<supabase.AuthResponse>();

  late perso.AuthState lastState;

  late final StreamSubscription<supabase.AuthState> _subscription;

  final AuthRepository _repository;

  supabase.User? _user;

  perso.AuthStatus? validator(supabase.User? value) {
    if (value!.id.isEmpty) {
      return perso.AuthStatus.authenticated;
    } else {
      return perso.AuthStatus.unauthenticated;
    }
  }

  void _onUserChanged(supabase.AuthState authState) {
    final supabase.AuthChangeEvent event = authState.event;
    final supabase.Session? session = authState.session;

    state = const perso.AuthState.unauthenticated(
        status: perso.AuthStatus.unauthenticated);

    switch (event) {
      case supabase.AuthChangeEvent.passwordRecovery:
      // TODO: Handle this case.
      case supabase.AuthChangeEvent.signedIn:
        _user = session?.user;
        state = perso.AuthState.authenticated(
            status: validator(_user)!,
            userEntity: UserModel.complete(
                id: UserId(value: int.tryParse(_user!.id)!),
                userEntityModel: UserEntityModel.fromJson(_user!.toJson()),
                cubeUser: CubeUser()));
      case supabase.AuthChangeEvent.signedOut:
        session?.user;
        onSignOut();
        state = const perso.AuthState.unauthenticated(
            status: perso.AuthStatus.unauthenticated);
      case supabase.AuthChangeEvent.tokenRefreshed:
        session?.providerRefreshToken;
        _user = session?.user;
        state = perso.AuthState.authenticated(
            status: validator(_user)!,
            userEntity: UserModel.complete(
                id: UserId(value: int.parse(_user!.id)),
                userEntityModel: UserEntityModel.fromJson(_user!.toJson()),
                cubeUser: CubeUser()));
      case supabase.AuthChangeEvent.userUpdated:
        _user = session?.user;
        state = perso.AuthState.authenticated(
            status: validator(_user)!,
            userEntity: UserModel.complete(
                id: UserId(value: int.parse(_user!.id)),
                userEntityModel: UserEntityModel.fromJson(_user!.toJson()),
                cubeUser: CubeUser()));
      case supabase.AuthChangeEvent.userDeleted:
      case supabase.AuthChangeEvent.mfaChallengeVerified:
      // TODO: Handle this case.
      case supabase.AuthChangeEvent.initialSession:
      // TODO: Handle this case.
    }
  }

  Future<perso.AuthState?> onSignInWithPassword(
      String email, String password) async {
    final userModel = await _repository.signInWithPassword(email, password);
    do {
      state = perso.AuthState.authenticated(
          status: validator(userModel.toNullable())!,
          userEntity: UserModel.complete(
              id: UserId(value: int.parse(userModel.toNullable()!.id)),
              userEntityModel:
                  UserEntityModel.fromJson(userModel.toNullable()!.toJson()),
              cubeUser: CubeUser()));
    } while (userModel.exists((r) => r.id.isNotEmpty));

    state = const perso.AuthState.unauthenticated(
        status: perso.AuthStatus.unauthenticated);

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
},
    dependencies: [authRepositoryProvider],
    name: 'auth controller state notifier');
