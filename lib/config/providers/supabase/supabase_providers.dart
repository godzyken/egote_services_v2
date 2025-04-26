import 'dart:convert';
import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_service.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Supabase Instances Providers -------------------> //

// Provider pour initialiser Supabase de manière asynchrone.
final supabaseInitProvider = FutureProvider<supabase.Supabase>((ref) async {
  try {
    await Future.delayed(const Duration(seconds: 2));
    final env = await _loadEnvironmentConfig();
    final supabaseInstance = await _initializeSupabase(env);
    return supabaseInstance;
  } catch (e, st) {
    developer.log("Supabase initialization failed: $e", stackTrace: st);
    throw StateError('Error initializing Supabase: $e');
  }
}, name: 'Supabase Initializer');

// Charger la configuration de l'environnement à partir du fichier JSON.
Future<Environment> _loadEnvironmentConfig() async {
  try {
    await Future.delayed(const Duration(seconds: 2));
    developer.log("Loading config file..."); // Log avant de charger le fichier
    final name = F.appFlavor.name;
    final configFile = await rootBundle
        .loadString('assets/json/$name.config.json', cache: false);
    // developer.log("Config file loaded: $configFile"); // Log le contenu du fichier
    return Environment.fromJson(
        json.decode(configFile) as Map<String, dynamic>);
  } catch (e) {
    developer
        .log("Error loading config: $e"); // Log de l'erreur si elle survient
    rethrow;
  }
}

// Initialiser Supabase avec les paramètres de l'environnement.
Future<supabase.Supabase> _initializeSupabase(Environment env) async {
  final client = supabase.GoTrueClient(
    url: env.supabaseUrl,
    autoRefreshToken: true,
    headers: {
      "apiKey": env.supabaseAnonKey,
      "Authorization": "Bearer ${env.supabaseAnonKey}",
    },
  );

  Future<String> getAccessToken() async {
    await Future.delayed(const Duration(seconds: 2));
    return client.currentSession?.providerRefreshToken ?? env.accessToken;
  }

  return await supabase.Supabase.initialize(
    url: env.supabaseUrl,
    anonKey: env.supabaseAnonKey,
    headers: client.headers,
    accessToken: () => getAccessToken(),
    authOptions: const supabase.FlutterAuthClientOptions(
      authFlowType: supabase.AuthFlowType.pkce,
    ),
    realtimeClientOptions: const supabase.RealtimeClientOptions(
      logLevel: supabase.RealtimeLogLevel.info,
      eventsPerSecond: 2,
    ),
    storageOptions: const supabase.StorageClientOptions(
      retryAttempts: 10,
    ),
    postgrestOptions: const supabase.PostgrestClientOptions(schema: 'public'),
    debug: kDebugMode,
  );
}

// <---------------- Providers pour l'accès à Supabase -------------------> //

// Fournisseur pour l'accès à l'instance de Supabase.
final supabaseProvider = Provider<supabase.Supabase>((ref) {
  final supabaseInstance = ref.watch(supabaseInitProvider);

  return supabaseInstance.when(
    data: (data) => data,
    error: (error, stackTrace) {
      developer.log('Error initializing Supabase: $error',
          stackTrace: stackTrace);
      throw StateError('Failed to initialize Supabase: $error');
    },
    loading: () {
      throw StateError('Supabase is still initializing...');
    },
  );
});

// Fournisseur pour l'accès au client Supabase.
final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  final client = ref.watch(supabaseProvider).client;
  return client;
});

// Service Supabase centralisé pour l'usage à travers l'application.
final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return SupabaseService(supabaseClient);
});

// Fournisseur pour récupérer l'utilisateur actuellement authentifié.
final userSupabaseProvider = Provider<supabase.User>((ref) {
  final supabaseInstance = ref.watch(supabaseInitProvider);
  final currentUser = supabaseInstance.when(
    data: (supabase) => supabase.client.auth.currentUser,
    loading: () => null,
    error: (_, __) => null,
  );

  if (currentUser == null) {
    throw StateError('No authenticated user found');
  }

  return currentUser;
});

class SupabaseClientNotifier extends StateNotifier<supabase.SupabaseClient?> {
  SupabaseClientNotifier() : super(null);

  void setClient(supabase.SupabaseClient client) {
    state = client;
  }
}

final supabaseClientNotifierProvider =
    StateNotifierProvider<SupabaseClientNotifier, supabase.SupabaseClient?>(
        (ref) {
  return SupabaseClientNotifier();
});

// <---------------- Example: Filtered List --------------------> //

final filterConnection = StateProvider<List<int>>((ref) {
  final supabaseState = ref.watch(supabaseInitProvider);
  final userState = ref.watch(userSupabaseProvider);
  final userNotifierState = ref.watch(userNotifierProvider);

  final stateList = <int, String>{
    1: supabaseState.toString(),
    2: userState.id,
    3: userNotifierState.role,
  };

  return stateList.keys.toList();
});

final countProvider = StateProvider<int>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  prefs?.setInt('count', (prefs.getInt('count') ?? 0) + 1);
  return prefs?.getInt('count') ?? 0;
});
