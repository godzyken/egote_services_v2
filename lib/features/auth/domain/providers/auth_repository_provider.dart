import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/list_generate_link_type_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/supabase/supabase_providers.dart';
import '../../infrastructure/repositories/auth_repository.dart';

// --- PROVIDERS ---

// 1. Repository Provider (Sans .autoDispose ni dependencies)
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  final client = ref.watch(supabaseClientProvider).auth;
  final link = ref.watch(generateLinkTypeNotifierProvider);

  try {
    client.startAutoRefresh();
    prefs.reload();
  } on FlutterError catch (e) {
    if (kDebugMode) {
      print('Auth Repository initialization warning: $e');
    }
  }

  // Nettoyage ou actions au dispose de la ressource
  ref.onDispose(() {
    // Logic de cleanup si nécessaire lors du démontage du repository
  });

  return AuthRepository(AuthTokenLocalDataSource(prefs), client, link);
}, name: 'AuthRepositoryProvider');

// 2. ValueNotifier global pour l'état d'écouteur d'authentification (ex: GoRouter)
final authStateListenable = ValueNotifier<bool>(false);

// 3. Notifier pour le contrôle automatique de la session utilisateur
class AutoAuthController extends Notifier<UserModel?> {
  @override
  UserModel? build() {
    // Initialisation de l'état utilisateur (null par défaut)
    return null;
  }

  void setUser(UserModel? user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}

final autoAuthControllerProvider =
NotifierProvider<AutoAuthController, UserModel?>(
  AutoAuthController.new,
  name: 'AutoAuthControllerProvider',
);

// 4. AsyncNotifier pour la gestion réactive et asynchrone de la connexion utilisateur
class AuthController extends AsyncNotifier<UserModel?> {
  late final AuthRepository _repository;

  @override
  Future<UserModel?> build() async {
    _repository = ref.watch(authRepositoryProvider);
    // Initialise en récupérant l'utilisateur actuellement connecté si présent
    return _repository.getCurrentUser();
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _repository.signIn(email, password);
    });
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.signOut();
      return null;
    });
  }
}

final authControllerProvider =
AsyncNotifierProvider<AuthController, UserModel?>(
  AuthController.new,
  name: 'AuthControllerProvider',
);