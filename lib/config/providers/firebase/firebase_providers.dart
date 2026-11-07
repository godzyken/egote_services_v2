import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/chat/application/managers/push_notifications_manager.dart';
import '../../../firebase_options.dart';

// <---------------- Firebase Instances Providers -------------------> //

/// Firebase is optional on web (DEC-002: kept only for mobile push).
/// Mock options or missing config must never crash the app.
final firebaseInitProvider = FutureProvider<FirebaseApp?>((ref) async {
  try {
    // Background message handler is mobile-only
    if (!kIsWeb) {
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    }

    final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return app;
  } catch (e, stack) {
    log(
      'Firebase init failed (non-blocking). '
      'App continues with Supabase as primary backend.\n$e',
      name: 'Firebase',
      error: e,
      stackTrace: stack,
    );
    // Return null so dependent code can handle the absence of Firebase
    return null;
  }
});

final firebaseAuthProvider = Provider<FirebaseAuth?>((ref) {
  final app = ref.watch(firebaseInitProvider).valueOrNull;
  if (app == null) return null;
  return FirebaseAuth.instance;
});

final firebaseDatabaseProvider = Provider<FirebaseDatabase?>((ref) {
  final app = ref.watch(firebaseInitProvider).valueOrNull;
  if (app == null) return null;
  return FirebaseDatabase.instance;
});

final firebaseFirestoreProvider = Provider<FirebaseFirestore?>((ref) {
  final app = ref.watch(firebaseInitProvider).valueOrNull;
  if (app == null) return null;
  return FirebaseFirestore.instance;
});

final firebaseMessagingProvider = Provider<FirebaseMessaging?>((ref) {
  final app = ref.watch(firebaseInitProvider).valueOrNull;
  if (app == null) return null;
  return FirebaseMessaging.instance;
});

final emulatorSettingsProvider = Provider((ref) {
  final fire = ref.watch(firebaseFirestoreProvider);
  if (fire == null) return null;

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

    final emulator = fire.useFirestoreEmulator('10.2.2', 8080);
    return emulator;
  } on FirebaseException catch (e) {
    log('Error emulator settings provider : $e');
    fire.terminate();
  }
  return null;
});

// <---------------- Stream<User?> Providers --------------------> //
final authStateChangesProvider = StreamProvider<User?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  if (auth == null) return Stream.value(null);
  return auth.authStateChanges();
});

final userChangesProvider = StreamProvider<User?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  if (auth == null) return Stream.value(null);
  return auth.userChanges();
});

final authStreamProvider = StreamProvider.autoDispose<User?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  if (auth == null) return Stream.value(null);
  return auth.authStateChanges();
});

final idTokenStreamProvider = StreamProvider.autoDispose((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  if (auth == null) return Stream.value(null);
  return auth.idTokenChanges().map((event) {
    if (event?.refreshToken != null) {
      return event!.getIdToken(true);
    }
    return null;
  });
});

final userStreamProvider = StreamProvider.autoDispose<User?>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  if (auth == null) return Stream.value(null);
  return auth.userChanges();
});

// <---------------- FirebaseDatabase Provider --------------------> //
final fireDatabaseProvider = Provider<FirebaseDatabase?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final database = ref.watch(firebaseDatabaseProvider);

  if (database == null) return null;

  return auth.asData?.value?.uid != null
      ? FirebaseDatabase.instanceFor(
          app: database.app,
          databaseURL: database.databaseURL,
        )
      : null;
});
