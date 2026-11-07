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
/// Mock options must never crash the app.
final firebaseInitProvider = FutureProvider<FirebaseApp>((ref) async {
  try {
    if (!kIsWeb) {
      FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    }

    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e, stack) {
    log(
      'Firebase init failed (non-blocking on web). '
      'App continues with Supabase as primary backend.\n$e',
      name: 'Firebase',
      error: e,
      stackTrace: stack,
    );

    // On web we swallow the error so the Hub can start.
    // On mobile we still rethrow because FCM is required.
    if (kIsWeb) {
      // Return a dummy completed future value is not possible with FirebaseApp,
      // so we rethrow a controlled error that will be caught higher up.
      // The bootstrap already wraps this call in try/catch.
      rethrow;
    }
    rethrow;
  }
});

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

final firebaseDatabaseProvider = Provider<FirebaseDatabase>(
  (ref) => FirebaseDatabase.instance,
);

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final firebaseMessagingProvider = Provider((ref) => FirebaseMessaging.instance);

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

    final emulator = fire.useFirestoreEmulator('10.2.2', 8080);

    return emulator;
  } on FirebaseException catch (e) {
    log('Error emulator settings provider : $e');
    fire.terminate();
  }
});

// <---------------- Stream<User?> Providers --------------------> //
final authStateChangesProvider = StreamProvider(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);

final userChangesProvider = StreamProvider(
  (ref) => ref.watch(firebaseAuthProvider).userChanges(),
);

final authStreamProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges().map((user) {
    if (user != null) {
      return user;
    } else {
      return null;
    }
  });
});

final idTokenStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(firebaseAuthProvider).idTokenChanges().map((event) {
    if (event?.refreshToken != null) {
      return event!.getIdToken(true);
    } else {
      return null;
    }
  });
});

final userStreamProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(firebaseAuthProvider).userChanges().map((event) {
    if (event != null) {
      return event;
    } else {
      return null;
    }
  });
});

// <---------------- FirebaseDatabase Provider --------------------> //
final fireDatabaseProvider = Provider<FirebaseDatabase?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final database = ref.watch(firebaseDatabaseProvider);

  return auth.asData?.value?.uid != null
      ? FirebaseDatabase.instanceFor(
          app: database.app,
          databaseURL: database.databaseURL,
        )
      : null;
});
