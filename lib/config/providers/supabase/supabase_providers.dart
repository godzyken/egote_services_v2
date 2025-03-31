import 'dart:convert';

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

final supabaseInitProvider = FutureProvider<supabase.Supabase>((ref) async {
  try {
    // Charger la configuration à partir d'un fichier JSON
    final configFile = await rootBundle.loadString(F.envFileName, cache: false);
    final env =
        Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

    // Utiliser Future.any pour initialiser Supabase avec différentes stratégies
    final supabaseInstance = await _initializeSupabaseWithFallback(env);

    return supabaseInstance;
  } on Exception catch (e) {
    throw StateError('Error initializing Supabase: $e');
  }
}, name: 'Initialisation de supabase provider');

// Méthodes pour initialiser Supabase avec des délais différents
Future<supabase.Supabase> _initializeSupabaseWithFallback(
    Environment env) async {
  try {
    final supabaseInstance = await Future.any([
      _slowSupabaseInit(env),
      _delayedSupabaseInit(env),
      _fastSupabaseInit(env),
    ]);
    return supabaseInstance;
  } catch (e) {
    throw StateError('Error during Supabase initialization: $e');
  }
}

// Initialisation lente de Supabase
Future<supabase.Supabase> _slowSupabaseInit(Environment env) async {
  await Future.delayed(const Duration(seconds: 5));
  return await _initializeSupabase(env);
}

// Initialisation avec délai moyen de Supabase
Future<supabase.Supabase> _delayedSupabaseInit(Environment env) async {
  await Future.delayed(const Duration(seconds: 3));
  return await _initializeSupabase(env);
}

// Initialisation rapide de Supabase
Future<supabase.Supabase> _fastSupabaseInit(Environment env) async {
  await Future.delayed(const Duration(seconds: 1));
  return await _initializeSupabase(env);
}

// Fonction centralisée pour initialiser Supabase
Future<supabase.Supabase> _initializeSupabase(Environment env) async {
  // Initialiser un client GoTrue pour l'authentification
  final client = supabase.GoTrueClient(
    url: env.supabaseUrl,
    autoRefreshToken: true,
    headers: {
      "apiKey": env.supabaseAnonKey,
      "Authorization": "Bearer ${env.supabaseAnonKey}",
    },
  );

  // Fonction améliorée pour récupérer un token d'accès
  Future<String> getAccessToken() async {
    await Future.delayed(const Duration(seconds: 2));
    String? accessToken = client.currentSession?.providerRefreshToken;
    return accessToken ?? env.accessToken;
  }

  // Initialisation de Supabase avec les options
  await supabase.Supabase.initialize(
    url: env.supabaseUrl,
    anonKey: env.supabaseAnonKey,
    headers: client.headers,
    accessToken: () => getAccessToken(),
    authOptions: const supabase.FlutterAuthClientOptions(
      authFlowType: supabase
          .AuthFlowType.pkce, // Utilisation de PKCE pour l'authentification
    ),
    realtimeClientOptions: const supabase.RealtimeClientOptions(
      logLevel: supabase.RealtimeLogLevel.info,
      eventsPerSecond: 2, // Limitation des événements en temps réel
    ),
    storageOptions: const supabase.StorageClientOptions(
      retryAttempts: 10,
    ),
    postgrestOptions: const supabase.PostgrestClientOptions(schema: 'public'),
    debug: kDebugMode,
  );

  return supabase.Supabase.instance;
}

final supabaseProvider =
    Provider<supabase.Supabase>((ref) => supabase.Supabase.instance);

final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  try {
    final client = ref.watch(supabaseProvider).client;
    return client;
  } on Exception catch (e) {
    throw StateError('Error initializing Supabase client: $e');
  }
});

// Autres Providers pour Supabase...
final supabaseServiceProvider =
    Provider<SupabaseService>((ref) => SupabaseService());

final userSupabaseProvider = Provider<supabase.User>((ref) {
  final currentUser = ref.watch(supabaseProvider).client.auth.currentUser;
  return supabase.User(
    id: currentUser!.id,
    appMetadata: currentUser.appMetadata,
    userMetadata: currentUser.userMetadata,
    email: currentUser.email,
    emailConfirmedAt: currentUser.emailConfirmedAt,
    phone: currentUser.phone,
    phoneConfirmedAt: currentUser.phoneConfirmedAt,
    invitedAt: currentUser.invitedAt,
    lastSignInAt: currentUser.lastSignInAt,
    role: currentUser.role,
    identities: currentUser.identities,
    aud: currentUser.aud,
    createdAt: 'createdAt',
  );
});

// <---------------- Example of using the Filtered List --------------------> //
final filterConnection = StateProvider<List<int>>((ref) {
  final state1 =
      ref.watch(supabaseInitProvider.future).timeout(const Duration(days: 2));
  final state2 = ref.watch(userSupabaseProvider);
  final state3 = ref.watch(userNotifierProvider);

  final stateList = <int, String>{
    1: state1.toString(),
    2: state2.id,
    3: state3.role
  };

  var list = <int>[];

  stateList.forEach((key, value) {
    var checkList = list.add(key);
    return checkList;
  });

  return list;
});

final countProvider = StateProvider<int>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider).value;
  prefs?.setInt('count', (prefs.getInt('count') ?? 0) + 1);
  return prefs?.getInt('count') ?? 0;
});
