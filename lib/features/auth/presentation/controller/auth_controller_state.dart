import 'dart:async';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/presentation/states/auth/auth_state.dart'
    as perso;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthControllerNotifier extends Notifier<perso.AuthState> {
  late final AuthRepository _repository;
  StreamSubscription<supabase.AuthState>? _subscription;

  final StreamController<supabase.AuthResponse> controller =
      StreamController<supabase.AuthResponse>();

  perso.AuthState lastState = const perso.AuthState.unauthenticated();

  supabase.User? _user;

  @override
  perso.AuthState build() {
    _repository = ref.watch(authRepositoryProvider);

    // Écoute des changements d'état d'authentification
    _subscription = _repository.authClient.onAuthStateChange.listen((event) {
      _onUserChanged(event);
    });

    // Nettoyage des ressources à la destruction du Notifier
    ref.onDispose(() {
      _subscription?.cancel();
      controller.close();
    });

    return const perso.AuthState.unauthenticated();
  }

  perso.AuthStatus validator(supabase.User? value) {
    if (value != null && value.id.isNotEmpty) {
      return perso.AuthStatus.authenticated;
    } else {
      return perso.AuthStatus.unauthenticated;
    }
  }

  void _onUserChanged(supabase.AuthState authState) {
    final supabase.AuthChangeEvent event = authState.event;
    final supabase.Session? session = authState.session;

    switch (event) {
      case supabase.AuthChangeEvent.signedIn:
      case supabase.AuthChangeEvent.tokenRefreshed:
      case supabase.AuthChangeEvent.userUpdated:
        _user = session?.user;
        final currentUser = _user;
        if (currentUser != null) {
          final newState = perso.AuthState.authenticated(
            userEntity: _buildUserModel(currentUser),
          );
          lastState = newState;
          state = newState;
        } else {
          _setUnauthenticated();
        }
        break;

      case supabase.AuthChangeEvent.signedOut:
        _user = null;
        onSignOut();
        _setUnauthenticated();
        break;

      case supabase.AuthChangeEvent.passwordRecovery:
      case supabase.AuthChangeEvent.mfaChallengeVerified:
      case supabase.AuthChangeEvent.initialSession:
        // Traitements spécifiques optionnels selon vos besoins
        break;
      default:
        break;
    }
  }

  Future<perso.AuthState> onSignInWithPassword(
    String email,
    String password,
  ) async {
    final result = await _repository.signInWithPassword(email, password);

    return result.fold(
      (failure) {
        _setUnauthenticated();
        return state;
      },
      (supabaseUser) {
        _user = supabaseUser;
        final computedStatus = validator(_user);
        final currentUser = _user;

        if (computedStatus == perso.AuthStatus.authenticated &&
            currentUser != null) {
          final newState = perso.AuthState.authenticated(
            userEntity: _buildUserModel(currentUser),
          );
          lastState = newState;
          state = newState;
        } else {
          _setUnauthenticated();
        }
        return state;
      },
    );
  }

  void onSignOut() {
    _repository.signOut();
    _setUnauthenticated();
  }

  void _setUnauthenticated() {
    const unauth = perso.AuthState.unauthenticated();
    lastState = unauth;
    state = unauth;
  }

  /// Fabrique l'objet UserModel en convertissant l'ID Supabase (String/UUID) de manière sécurisée
  UserModel _buildUserModel(supabase.User user) {
    final int parsedId = int.tryParse(user.id) ?? user.id.hashCode;

    // Mapping manuel sûr (pas de fromJson sur le JSON Supabase)
    final entity = UserEntityModel(
      id: UserId(value: parsedId),
      name:
          user.userMetadata?['name'] as String? ??
          user.email?.split('@').first ??
          '',
      role: user.userMetadata?['role'] as String? ?? '',
      isComplete: user.emailConfirmedAt != null,
      createdAt: DateTime.tryParse(user.createdAt) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(user.updatedAt ?? '') ?? DateTime.now(),
      emailConfirmedAt: user.emailConfirmedAt != null
          ? DateTime.tryParse(user.emailConfirmedAt!)
          : null,
      phoneConfirmedAt: user.phoneConfirmedAt != null
          ? DateTime.tryParse(user.phoneConfirmedAt!)
          : null,
      lastSignInAt: user.lastSignInAt != null
          ? DateTime.tryParse(user.lastSignInAt!)
          : null,
    );

    return UserModel.complete(
      id: UserId(value: parsedId),
      userEntityModel: entity,
      authUser: user,
      cubeUser: CubeUser(),
    );
  }
}

// --- PROVIDER ---

final authStateProvider =
    NotifierProvider<AuthControllerNotifier, perso.AuthState>(
      AuthControllerNotifier.new,
      name: 'AuthControllerNotifierProvider',
    );
