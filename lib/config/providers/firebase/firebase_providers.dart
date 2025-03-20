import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/chat/application/managers/push_notifications_manager.dart';
import '../../../firebase_options.dart';
import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Firebase Instances Providers -------------------> //
final firebaseInitProvider = FutureProvider<FirebaseApp>((ref) async {
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

  final configFile = await rootBundle.loadString(F.envFileName, cache: false);
  final env =
      Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  await Future.delayed(Duration(seconds: 5), () {
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
          criticalAlert: true);
  });

  return await Firebase.initializeApp(
      name: 'EgoteServices', options: DefaultFirebaseOptions.currentPlatform);
});

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseDatabaseProvider =
    Provider<FirebaseDatabase>((ref) => FirebaseDatabase.instance);

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseMessagingProvider =
    Provider<FirebaseMessaging>((ref) => FirebaseMessaging.instance);

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
final authStateChangesProvider =
    StreamProvider((ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final userChangesProvider =
    StreamProvider((ref) => ref.watch(firebaseAuthProvider).userChanges());

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

/*final fusionStreamProvider = StreamProvider.autoDispose<User?>((ref) {
  final userIdAsyncValue = ref.watch(idTokenStreamProvider);
  var userId = userIdAsyncValue.asData?.value;
  if (userId != null) {
    final user = supabase.User(
        id: userId.toString(),
        appMetadata: 'appMetadata',
        userMetadata: 'userMetadata',
        aud: 'aud',
        createdAt: 'createdAt'
    );
    return ;
  }
});*/

// <---------------- FirebaseDatabase Provider --------------------> //
final fireDatabaseProvider = Provider<FirebaseDatabase?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final database = ref.watch(firebaseDatabaseProvider);

  return auth.asData?.value?.uid != null
      ? FirebaseDatabase.instanceFor(
          app: database.app, databaseURL: database.databaseURL)
      : null;
});
