import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers/supabase/supabase_service.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../environements/environment.dart';
import '../customer/shared_prefs_provider.dart';
import '../launcherconfig/environment_provider.dart';

// <---------------- Supabase Instances Providers -------------------> //

final supabaseWrapperProvider = FutureProvider<supabase.Supabase>((ref) async {
  final env = await loadEnvironmentConfig(ref);
  return _initializeSupabase(env);
});

// Provider pour initialiser Supabase de manière asynchrone.
final supabaseInitProvider =
    FutureProvider<supabase.SupabaseClient>((ref) async {
  final supabase = await ref.watch(supabaseWrapperProvider.future);
  return supabase.client;
}, name: 'Supabase Initializer');

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
  final supabaseInstance = ref.watch(supabaseWrapperProvider);

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
  final asyncValue = ref.watch(supabaseInitProvider);
  return asyncValue.when(
    data: (client) => client,
    loading: () => throw StateError('Supabase is still initializing...'),
    error: (err, stack) => throw StateError('Supabase failed: $err'),
  );
});

// Service Supabase centralisé pour l'usage à travers l'application.
final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return SupabaseService(supabaseClient);
});

// Fournisseur pour récupérer l'utilisateur actuellement authentifié.
final userSupabaseProvider = Provider<supabase.User>((ref) {
  final supabaseInstance = ref.watch(supabaseWrapperProvider);
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
  final prefsAsync = ref.watch(sharedPrefsProvider);
  final prefs = prefsAsync.maybeWhen(
    data: (data) => data?.prefs,
    orElse: () => null,
  );

  if (prefs == null) return 0;
  prefs.setInt('count', (prefs.getInt('count') ?? 0) + 1);
  return prefs.getInt('count') ?? 0;
});
