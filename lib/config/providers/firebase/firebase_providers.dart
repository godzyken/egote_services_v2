import 'dart:developer' as developer;

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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../firebase_options.dart';
import '../../environements/environment.dart';

part 'firebase_providers.g.dart';

// <---------------- Firebase Initialization -------------------> //
@Riverpod(keepAlive: true)
Future<FirebaseApp> firebaseInitProvider(Ref ref) async {
  return await ref.runSafe('firebaseInitProvider', () async {
    FirebaseApp app;

    if (Firebase.apps.isNotEmpty) {
      app = Firebase.apps.first;
    } else {
      final env = await loadEnvironmentConfig(ref);
      app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await _initializeFirebaseServices(ref, env, app);
    }

    return app;
  });
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

/*// Exception personnalisée pour l'initialisation Firebase
class FirebaseInitializationException implements Exception {
  final String message;
  FirebaseInitializationException(this.message);

  @override
  String toString() => message;
}*/

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
  return FirebaseMessaging.instance;
});

final firebaseMessagingServiceProvider =
    Provider<FirebaseMessagingService>((ref) => FirebaseMessagingService());

// <---------------- Emulator Settings --------------------> //
final emulatorSettingsProvider = FutureProvider<void>((ref) async {
  final firebaseApp = await ref.watch(firebaseInitProviderProvider.future);

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
  final firebaseApp = ref.watch(firebaseInitProviderProvider).requireValue;
  return ref.watch(firebaseAuthProvider(firebaseApp)).authStateChanges();
});
final userChangesProvider = StreamProvider((ref) {
  final firebaseApp = ref.watch(firebaseInitProviderProvider).requireValue;
  return ref.watch(firebaseAuthProvider(firebaseApp)).userChanges();
});
final authStreamProvider =
    StreamProvider.autoDispose<User?>((ref) => _mapAuthStream(ref));
final idTokenStreamProvider =
    StreamProvider.autoDispose((ref) => _mapIdTokenStream(ref));
final userStreamProvider =
    StreamProvider.autoDispose<User?>((ref) => _mapUserStream(ref));

Stream<User?> _mapAuthStream(Ref ref) {
  final firebaseApp = ref.watch(firebaseInitProviderProvider).requireValue;
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
  final firebaseApp = ref.watch(firebaseInitProviderProvider).requireValue;
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
  final firebaseApp = ref.watch(firebaseInitProviderProvider).requireValue;
  return ref
      .watch(firebaseAuthProvider(firebaseApp))
      .userChanges()
      .map((event) => event);
}

// firebase auth Cube User Stream converter Provider
final authCubeStreamProvider =
    StreamProvider.autoDispose((ref) => _mapAuthCubeStream(ref));

Stream<CubeUser?> _mapAuthCubeStream(Ref ref) {
  final firebaseApp = ref.watch(firebaseInitProviderProvider).requireValue;
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
