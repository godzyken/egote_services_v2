import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:isolate';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/chat/application/services/firebase_messaging_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../firebase_options.dart';
import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Firebase Initialization -------------------> //
@Riverpod(keepAlive: true)
final firebaseInitProvider = FutureProvider<FirebaseApp>((ref) async {
  // Vérifier si Firebase est déjà initialisé
  if (Firebase.apps.isNotEmpty) {
    return Firebase.apps.first; // Retourne l'instance Firebase existante
  }

  final env = await _loadEnvironmentConfig();

  await _initializeFirebaseServices(ref, env);

  // Utilise Future.any pour initialiser Firebase de manière optimisée
  final instance = await _initializeFirebaseInBackground(env);

  return instance;
});

// Méthode pour charger la configuration de l'environnement
Future<Environment> _loadEnvironmentConfig() async {
  final configFile = await rootBundle.loadString(F.envFileName, cache: false);
  return Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);
}

// Initialize Firebase in background isolate
Future<FirebaseApp> _initializeFirebaseInBackground(Environment env) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(
    _initializeFirebaseIsolate,
    FirebaseInitializationParams(env, receivePort.sendPort),
  );

  // Wait for the result from the isolate
  final result = await receivePort.first;
  if (result is FirebaseApp) {
    return result;
  } else {
    throw FirebaseInitializationException('Firebase initialization failed.');
  }
}

// Isolate function to initialize Firebase
void _initializeFirebaseIsolate(FirebaseInitializationParams params) async {
  try {
    final firebaseApp = await Future.any([
      _slowFirebaseInit(params.env),
      _delayedFirebaseInit(params.env),
      _fastFirebaseInit(params.env),
    ]);

    // Send back the result to the main isolate
    params.sendPort.send(firebaseApp);
  } catch (e) {
    developer.log('Error during Firebase initialization in isolate: $e');
    params.sendPort.send(
        FirebaseInitializationException('Firebase initialization failed.'));
  }
}

// Initialisation lente
Future<FirebaseApp> _slowFirebaseInit(Environment env) async {
  try {
    await Future.delayed(Duration(seconds: 5));
    return await Firebase.initializeApp(
      name: 'SlowFirebase',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    developer.log('Error during SlowFirebase initialization: $e');
    throw FirebaseInitializationException('Firebase initialization failed.');
  }
}

// Initialisation avec délai moyen
Future<FirebaseApp> _delayedFirebaseInit(Environment env) async {
  try {
    await Future.delayed(Duration(seconds: 3));
    return await Firebase.initializeApp(
      name: 'DelayedFirebase',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    developer.log('Error during DelayedFirebase initialization: $e');
    throw FirebaseInitializationException('Firebase initialization failed.');
  }
}

// Initialisation rapide
Future<FirebaseApp> _fastFirebaseInit(Environment env) async {
  try {
    await Future.delayed(Duration(seconds: 1));
    return await Firebase.initializeApp(
      name: '[DEFAULT]',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    developer.log('Error during FastFirebase initialization: $e');
    throw FirebaseInitializationException('Firebase initialization failed.');
  }
}

// Méthode d'initialisation des services Firebase (Firestore, Auth, etc.)
Future<void> _initializeFirebaseServices(Ref ref, Environment env) async {
  await Future.delayed(Duration(seconds: 2), () {
    ref.watch(firebaseFirestoreProvider).settings.persistenceEnabled;
    ref.watch(firebaseAuthProvider).setPersistence(Persistence.LOCAL);
    ref.watch(firebaseDatabaseProvider).setLoggingEnabled(true);
    ref.watch(firebaseMessagingProvider)
      ..setAutoInitEnabled(true)
      ..getToken(vapidKey: env.vapidKey)
      ..requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: true,
        providesAppNotificationSettings: true,
        announcement: true,
        criticalAlert: true,
      );
  });
}

// Exception personnalisée pour l'initialisation Firebase
class FirebaseInitializationException implements Exception {
  final String message;
  FirebaseInitializationException(this.message);

  @override
  String toString() => message;
}

// <---------------- Firebase Auth Provider -----------------> //
@Riverpod(keepAlive: true)
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
@Riverpod(keepAlive: true)
final firebaseDatabaseProvider =
    Provider<FirebaseDatabase>((ref) => FirebaseDatabase.instance);

@Riverpod(keepAlive: true)
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

@Riverpod(keepAlive: true)
final firebaseMessagingProvider =
    Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);
final firebaseMessagingServiceProvider =
    Provider<FirebaseMessagingService>((ref) => FirebaseMessagingService());

// <---------------- Emulator Settings --------------------> //
final emulatorSettingsProvider = Provider((ref) {
  final fire = ref.watch(firebaseFirestoreProvider);
  try {
    fire.settings = const Settings(
      host: kIsWeb ? 'localhost' : '10.2.2',
      sslEnabled: true,
      ignoreUndefinedProperties: false,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );

    fire.enableNetwork();
    fire.waitForPendingWrites();
    fire.snapshotsInSync();
    fire.useFirestoreEmulator('10.2.2', 8080);
  } on FirebaseException catch (e) {
    developer.log('Error emulator settings provider : $e');
    fire.terminate();
  }
});

// <---------------- Authentication State Providers --------------------> //
final authStateChangesProvider =
    StreamProvider((ref) => ref.watch(firebaseAuthProvider).authStateChanges());
final userChangesProvider =
    StreamProvider((ref) => ref.watch(firebaseAuthProvider).userChanges());
final authStreamProvider =
    StreamProvider.autoDispose<User?>((ref) => _mapAuthStream(ref));
final idTokenStreamProvider =
    StreamProvider.autoDispose((ref) => _mapIdTokenStream(ref));
final userStreamProvider =
    StreamProvider.autoDispose<User?>((ref) => _mapUserStream(ref));

Stream<User?> _mapAuthStream(Ref ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges().map((user) => user);
}

Stream<String?> _mapIdTokenStream(Ref ref) {
  return ref
      .watch(firebaseAuthProvider)
      .idTokenChanges()
      .asyncMap((event) async {
    if (event?.refreshToken != null) {
      return await event!.getIdToken(true);
    } else {
      return null;
    }
  });
}

Stream<User?> _mapUserStream(Ref ref) {
  return ref.watch(firebaseAuthProvider).userChanges().map((event) => event);
}

// firebase auth Cube User Stream converter Provider
final authCubeStreamProvider =
    StreamProvider.autoDispose((ref) => _mapAuthCubeStream(ref));

Stream<CubeUser?> _mapAuthCubeStream(Ref ref) {
  return ref
      .watch(firebaseAuthProvider)
      .authStateChanges()
      .map((user) => user != null ? _convertToCubeUser(ref, user) : null);
}

CubeUser _convertToCubeUser(Ref ref, User? user) {
  if (user != null) {
    int? id = int.tryParse(user.uid);
    return CubeUser(
      id: id ?? -1,
      email: user.email ?? '',
      fullName: user.displayName ?? '',
      avatar: user.photoURL ?? '',
      phone: user.phoneNumber ?? '',
      isGuest: false,
    );
  } else {
    return CubeUser(
      id: -1,
      email: '',
      fullName: 'Guest',
      avatar: '',
      phone: '',
      isGuest: true,
    );
  }
}

// <---------------- Firebase Realtime Database Provider -----------------> //
final fireDatabaseProvider = Provider<FirebaseDatabase?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final database = ref.watch(firebaseDatabaseProvider);

  if (auth.asData?.value?.uid != null) {
    try {
      return FirebaseDatabase.instanceFor(
          app: database.app, databaseURL: database.databaseURL);
    } catch (e) {
      developer.log('Error initializing Firebase Database: $e');
      return null;
    }
  }
  return null;
});

// Helper class for passing data between isolates
class FirebaseInitializationParams {
  final Environment env;
  final SendPort sendPort;

  FirebaseInitializationParams(this.env, this.sendPort);
}
