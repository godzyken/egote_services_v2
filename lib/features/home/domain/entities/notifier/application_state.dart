import 'dart:async';
import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/domain/entities/auth_exeptions/error_handler.dart';
import 'package:egote_services_v2/features/common/domain/entities/states/state.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/firebase/firebase_providers.dart';
import '../../../../../firebase_options.dart';

abstract class FirebaseService {
  Future<void> init();
  Future<void> configureFirebase();
  Future<auth.UserCredential> signInAnonymously();
  Future<void> signOut();
}

class FirebaseServiceImpl implements FirebaseService {
  final Ref ref;
  FirebaseServiceImpl(this.ref);

  @override
  Future<void> init() async {
    try {
      developer.log('FirebaseUIAuth start init');
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await configureFirebase();
      developer.log('Firebase initialized');
    } on Exception catch (error) {
      developer.log('Firebase initialization failed: $error');
      AuthErrorHandler.handleError(error);
      rethrow;
    }
  }

  @override
  Future<void> configureFirebase() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      developer.log('FirebaseUIAuth configured');
      final app = ref.watch(firebaseInitProvider).value;
      developer.log('Firebase app initialized: $app');
    } on Exception catch (error) {
      developer.log('Firebase configuration failed: $error');
      AuthErrorHandler.handleError(error);
      rethrow;
    }
  }

  @override
  Future<auth.UserCredential> signInAnonymously() async {
    try {
      developer.log('Signing in anonymously...');
      final auth = ref.watch(firebaseAuthProvider);
      return await auth.signInAnonymously();
    } catch (error) {
      AuthErrorHandler.handleError(error);
      developer.log('Error signing in anonymously: $error');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final auth = ref.watch(firebaseAuthProvider);
      await auth.signOut();
      developer.log('User signed out');
    } catch (error) {
      AuthErrorHandler.handleError(error);
      developer.log('Error signing out: $error');
      rethrow;
    }
  }
}

/// StateNotifier pour gérer l'état de connexion de l'utilisateur.
class AppStateNotifier extends StateNotifier<State> {
  final FirebaseService firebaseService;
  AppStateNotifier(this.firebaseService) : super(State.init()) {
    init();
  }

  void logError(Object error) => AuthErrorHandler.handleError(error);

  Future<void> updateUserState() async {
    state = State.loading();
    try {
      await Future.delayed(Duration(seconds: 2));
      await firebaseService.signInAnonymously();
      state = State.success(true);
    } on Exception catch (error) {
      logError(error);
      developer.log('Firebase configuration failed: $error');
      state = State.error(error);
      rethrow;
    }
  }

  /// Méthode pour se déconnecter
  Future<void> signOut() async {
    await firebaseService.signOut();
    state = State.init();
    developer.log('User signed out');
  }
}

// Fournisseur pour obtenir l'état de connexion
final appStateProvider = StateNotifierProvider<AppStateNotifier, State>((ref) {
  final firebaseService = FirebaseServiceImpl(ref);

  return AppStateNotifier(firebaseService);
});

final errorHandlerProvider = Provider<void Function(Object error)>((ref) {
  return (error) => developer.log("Error: $error");
});

/// Classe de gestion de l'état d'authentification.
class AuthStateNotifier extends StateNotifier<auth.User?> {
  AuthStateNotifier(this.ref) : super(null) {
    _initListener();
  }

  final Ref ref;
  late final StreamSubscription<auth.User?> _userSubscription;

  // Log des erreurs
  void _logError(Object error) => AuthErrorHandler.handleError(error);

  void _initListener() {
    _userSubscription =
        auth.FirebaseAuth.instance.authStateChanges().listen((user) {
      state = user;

      if (user != null) {
        developer.log('Utilisateur connecté : ${user.uid}');
      } else {
        developer.log('Utilisateur déconnecté');
      }
    }, onError: (error) {
      _logError(error);
      developer.log('Erreur lors de la connexion : $error');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userSubscription.cancel();
  }

  // Écoute des changements d'utilisateur
  Stream<auth.User?> get listenToUserChanges {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  }

  // Connexion anonyme
  Future<auth.UserCredential> signInAnonymously() async {
    try {
      developer.log('Connexion anonyme...');
      final authInstance = ref.watch(firebaseAuthProvider);
      final userCredential = await authInstance.signInAnonymously();
      state = userCredential.user;
      developer.log('Utilisateur connecté anonymement : ${state?.uid}');
      return userCredential;
    } catch (error) {
      _logError(error);
      developer.log('Erreur lors de la connexion anonyme : $error');
      rethrow;
    }
  }

  // Déconnexion
  Future<void> signOut() async {
    try {
      final authInstance = ref.watch(firebaseAuthProvider);
      await authInstance.signOut();
      developer.log('Utilisateur déconnecté');
      state = null;
    } catch (error) {
      _logError(error);
      developer.log('Erreur lors de la déconnexion : $error');
    }
  }
}

// Fournisseur pour gérer l'état de l'authentification
final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, auth.User?>((ref) {
  return AuthStateNotifier(ref);
});

final userStateStreamProvider = StreamProvider.autoDispose<auth.User?>((ref) {
  final authState = ref.watch(firebaseAuthProvider);

  return authState.authStateChanges();
});

final appStreamProvider = StreamProvider.autoDispose<int>((ref) async* {
  int i = 0;
  while (true) {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield i++;
  }
});
