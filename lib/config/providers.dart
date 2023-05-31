import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/profile_screen.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/user_home_screen.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:egote_services_v2/features/home/presentation/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../features/home/presentation/widget/godzylogo.dart';
import '../firebase_options.dart';
import 'environements/environment.dart';
import 'environements/flavors.dart';

Future<void> initializeProvider(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);
  await container.read(firebaseInitProvider.future);
  await container.read(supabaseInitProvider.future);

  container.read(firebaseDatabaseProvider);
  container.read(firebaseFirestoreProvider);
  container.read(geoFlutterFireProvider);
  container.read(firebaseAuthProvider);
  container.read(cubeSettingsProvider);
  container.read(cubeSessionManagerProvider);
  container.read(cubeChatConnectionSettingsProvider);
  container.read(cubeChatConnectionProvider);
  container.read(goRouterProvider);
  container.read(cubeProvider);

  container.read(authStateChangesProvider);
  container.read(idTokenChangesProvider);
  container.read(userChangesProvider);

  container.read(supabaseProvider);
  container.read(supabaseClientProvider);
  container.read(fireDatabaseProvider);

  //container.dispose();
}

final sharedPreferencesProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());

// <---------------- Supabase Instances Providers -------------------> //
final supabaseInitProvider = FutureProvider<supabase.Supabase>((ref) async {
  final configFile = await rootBundle.loadString(F.envFileName);
  final env =
      Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  return supabase.Supabase.initialize(
    url: env.supabaseUrl,
    anonKey: env.supabaseAnonKey,
    debug: kDebugMode,
    authCallbackUrlHostname: env.supabaseAuthCallbackUrlHostname,
  );
});

final supabaseProvider =
    Provider<supabase.Supabase>((ref) => supabase.Supabase.instance);

final supabaseClientProvider = Provider<supabase.SupabaseClient>((ref) {
  final provider = ref.read(supabaseInitProvider);
  if (provider.hasValue) {
    final value = provider.value;
    if (value?.client != null) {
      final supabase.SupabaseClient client = value!.client;
      client.getChannels();
      return client;
    }
  }
  return provider.value!.client;
},
    dependencies: [supabaseProvider, supabaseInitProvider],
    name: 'Supabase Client Provider');

// <---------------- Firebase Instances Providers -------------------> //
final firebaseInitProvider = FutureProvider<FirebaseApp>((ref) async {
  return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
});

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseDatabaseProvider =
    Provider<FirebaseDatabase>((ref) => FirebaseDatabase.instance);

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);

// <---------------- Cube Instances Providers -------------------> //
final cubeSettingsProvider =
    Provider<CubeSettings>((ref) => CubeSettings.instance);

final cubeChatConnectionProvider =
    Provider<CubeChatConnection>((ref) => CubeChatConnection.instance);

final cubeSessionManagerProvider =
    Provider<CubeSessionManager>((ref) => CubeSessionManager.instance);

final cubeChatConnectionSettingsProvider = Provider<CubeChatConnectionSettings>(
    (ref) => CubeChatConnectionSettings.instance);

// <---------------- Stream<User?> Providers --------------------> //
final authStateChangesProvider =
    StreamProvider((ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final idTokenChangesProvider =
    StreamProvider((ref) => ref.watch(firebaseAuthProvider).idTokenChanges());

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

// <---------------- GoRouter Provider --------------------> //
final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: HomeRoute.path,
            name: 'home',
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                  path: UserHomeRoute.path,
                  name: 'UserHome',
                  builder: (context, state) {
                    final auth = ref.watch(authControllerProvider);

                    return auth!.when((id, name) => UserHomeScreen(pid: id),
                        complete: (id, name, authUser, cubeUser) {
                            final cUser = ref.watch(cubeEntityProvider);
                            return ProfileScreen(
                                uid: auth.id,
                                pid: cUser.id.toString()
                            );
                          },
                        unComplete: (id, name, authUser) =>
                            UserHomeScreen(pid: auth.id));
                  },
                  routes: [
                    GoRoute(
                      path: PersonRoute.path,
                      name: 'profile',
                      builder: (context, state) {
                        return ProfileScreen(
                            uid: ref.watch(authStateChangesProvider).value!.uid,
                            pid: ref.watch(cubeEntityProvider).id.toString());
                      },
                    )
                  ]),
              GoRoute(
                path: GodzyLogoRoute.path,
                name: 'godzyRoute',
                builder: (context, state) => const Godzylogo(),
              ),
            ]),

      ],
      errorBuilder: (context, state) =>
          ErrorScreen(error: state.error.toString()),
      redirect: (context, state) {},
    ));

// <---------------- Cube Provider --------------------> //
final cubeProvider = Provider<CubeProvider>((_) => CubeProvider());

final cubeEntityProvider = Provider<CubeEntity>((ref) => CubeEntity());

// <---------------- GeoLocation Provider --------------------> //
final geoFlutterFireProvider =
    Provider<GeoFlutterFire>((ref) => GeoFlutterFire());

// <---------------- FirebaseDatabase Provider --------------------> //
final fireDatabaseProvider = Provider<FirebaseDatabase?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  final database = ref.watch(firebaseDatabaseProvider);

  return auth.asData?.value?.uid != null
      ? FirebaseDatabase.instanceFor(
          app: database.app, databaseURL: database.databaseURL)
      : null;
});
