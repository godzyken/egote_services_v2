import 'dart:developer' as developer;
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/providers/launcherconfig/environment_provider.dart';
import 'package:egote_services_v2/config/services/app_telemetry_service.dart';
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

// <---------------- Firebase Initialization -------------------> //
@Riverpod(keepAlive: true)
final firebaseInitProvider = FutureProvider<FirebaseApp?>((ref) async {
  return await ref.runSafe('firebaseInitProvider', () async {
    // Vérifier si Firebase est déjà initialisé
    if (Firebase.apps.isNotEmpty) {
      return Firebase.apps.first; // Retourne l'instance Firebase existante
    }

    final env = await _loadEnvironmentConfig(ref);

// Utilise Future.any pour initialiser Firebase de manière optimisée
    final instance = await _initializeFirebaseInBackground(env);
    await _initializeFirebaseServices(ref, env, instance);

    return instance;
  });
});

// Méthode pour charger la configuration de l'environnement
Future<Environment> _loadEnvironmentConfig(Ref ref) async {
  final configFile = ref.watch(environmentProvider);
  return configFile;
}

// Initialize Firebase in background isolate
Future<FirebaseApp> _initializeFirebaseInBackground(Environment env) async {
  final receivePort = ReceivePort();
  final token = ui.RootIsolateToken.instance!;

  await Isolate.spawn(
    _initializeFirebaseIsolate,
    FirebaseInitializationParams(env, receivePort.sendPort, token),
  );

  // Wait for the result from the isolate
  final result = await receivePort.first;
  if (result is FirebaseApp) {
    return result;
  } else {
    throw FirebaseInitializationException('Firebase initialization failed 1.');
  }
}

// Isolate function to initialize Firebase
void _initializeFirebaseIsolate(FirebaseInitializationParams params) async {
  try {
    BackgroundIsolateBinaryMessenger.ensureInitialized(params.token);

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
        FirebaseInitializationException('Firebase initialization failed 2.'));
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
    throw FirebaseInitializationException('Firebase initialization failed 3.');
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
    throw FirebaseInitializationException('Firebase initialization failed 4.');
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
    throw FirebaseInitializationException('Firebase initialization failed 5.');
  }
}

// Méthode d'initialisation des services Firebase (Firestore, Auth, etc.)
Future<void> _initializeFirebaseServices(
    Ref ref, Environment env, FirebaseApp firebaseApp) async {
  await ref.runSafe('firebase_firestore_settings', () async {
    ref
        .watch(firebaseFirestoreProvider(firebaseApp))
        .settings
        .persistenceEnabled;
  });

  await ref.runSafe('firebase_auth_persistence', () async {
    await ref
        .watch(firebaseAuthProvider(firebaseApp))
        .setPersistence(Persistence.LOCAL);
  });

  await ref.runSafe('firebase_database_logging', () async {
    ref.watch(firebaseDatabaseProvider(firebaseApp)).setLoggingEnabled(true);
  });

  await ref.runSafe('firebase_messaging_init', () async {
    final messaging = ref.watch(firebaseMessagingProvider);

    await messaging.setAutoInitEnabled(true);
    await messaging.getToken(vapidKey: env.vapidKey);
    await messaging.requestPermission(
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
    Provider.family<FirebaseAuth, FirebaseApp>((ref, firebaseApp) {
  return FirebaseAuth.instanceFor(app: firebaseApp);
});

@Riverpod(keepAlive: true)
final firebaseDatabaseProvider =
    Provider.family<FirebaseDatabase, FirebaseApp>((ref, firebaseApp) {
  return FirebaseDatabase.instanceFor(app: firebaseApp);
});

@Riverpod(keepAlive: true)
final firebaseFirestoreProvider =
    Provider.family<FirebaseFirestore, FirebaseApp>((ref, firebaseApp) {
  return FirebaseFirestore.instanceFor(app: firebaseApp);
});

@Riverpod(keepAlive: true)
final firebaseMessagingProvider = Provider<FirebaseMessaging>((ref) {
  ref.watch(firebaseInitProvider);
  return FirebaseMessaging.instance;
});

final firebaseMessagingServiceProvider =
    Provider<FirebaseMessagingService>((ref) => FirebaseMessagingService());

// <---------------- Emulator Settings --------------------> //
final emulatorSettingsProvider = Provider((ref) {
  final firebaseApp = ref.read(firebaseInitProvider).requireValue!;

  final fire = ref.watch(firebaseFirestoreProvider(firebaseApp));
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
final authStateChangesProvider = StreamProvider((ref) {
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  return ref.watch(firebaseAuthProvider(firebaseApp)).authStateChanges();
});
final userChangesProvider = StreamProvider((ref) {
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  return ref.watch(firebaseAuthProvider(firebaseApp)).userChanges();
});
final authStreamProvider =
    StreamProvider.autoDispose<User?>((ref) => _mapAuthStream(ref));
final idTokenStreamProvider =
    StreamProvider.autoDispose((ref) => _mapIdTokenStream(ref));
final userStreamProvider =
    StreamProvider.autoDispose<User?>((ref) => _mapUserStream(ref));

Stream<User?> _mapAuthStream(Ref ref) {
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  return ref
      .watch(firebaseAuthProvider(firebaseApp))
      .authStateChanges()
      .map((user) {
    if (user != null) {
      return user;
    } else {
      return null;
    }
  });
}

Stream<String?> _mapIdTokenStream(Ref ref) {
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  return ref
      .watch(firebaseAuthProvider(firebaseApp))
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
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  return ref
      .watch(firebaseAuthProvider(firebaseApp))
      .userChanges()
      .map((event) => event);
}

// firebase auth Cube User Stream converter Provider
final authCubeStreamProvider =
    StreamProvider.autoDispose((ref) => _mapAuthCubeStream(ref));

Stream<CubeUser?> _mapAuthCubeStream(Ref ref) {
  final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
  return ref
      .watch(firebaseAuthProvider(firebaseApp))
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

// Helper class for passing data between isolates
class FirebaseInitializationParams {
  final Environment env;
  final SendPort sendPort;
  final RootIsolateToken token;

  FirebaseInitializationParams(this.env, this.sendPort, this.token);
}
