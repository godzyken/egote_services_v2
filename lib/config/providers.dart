
import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/routes/routes.dart';
import '../features/auth/data/data_source_providers.dart';
import '../features/auth/domain/providers/auth_repository_provider.dart';
import '../features/auth/presentation/controller/auth_controller_state.dart';
import '../features/auth/presentation/views/screens/auth_screens.dart';
import '../features/avis/presentation/view/avis_box_page.dart';
import '../features/common/presentation/views/screens/error_screen.dart';
import '../features/home/presentation/view/home_screen.dart';
import '../features/home/presentation/widget/godzylogo.dart';
import '../features/settings/presentation/view/gallery/gallery.dart';
import '../features/settings/presentation/view/settings_ui_page.dart';
import '../features/sketch/presentation/view/drawing_page.dart';


Future<void> initializeProvider(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);
  await container.read(firebaseInitProvider.future);
  await container.read(supabaseInitProvider.future);
  await container.read(userFutureProvider.future);

  container.read(firebaseDatabaseProvider);
  container.read(firebaseFirestoreProvider);
  container.read(emulatorSettingsProvider);
  container.read(geoFlutterFireProvider);
  container.read(firebaseAuthProvider);
  container.read(cubeSettingsProvider);
  container.read(cubeSessionManagerProvider);
  container.read(cubeChatConnectionSettingsProvider);
  container.read(cubeChatConnectionProvider);
  container.read(goRouterProvider);
  container.read(cubeProvider);

  container.read(authStateChangesProvider);
  container.read(authStateProvider);
  container.read(idTokenChangesProvider);
  container.read(userChangesProvider);

  // container.read(supabaseProvider);
  // container.read(supabaseClientProvider);
  container.read(fireDatabaseProvider);

  // container.read(authRepositoryProvider);

  //container.dispose();
}

final sharedPreferencesProvider =
    FutureProvider((ref) => SharedPreferences.getInstance());

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
            path: AuthRoute.path,
            name: 'auth',
            builder: (context, state) => const AuthScreen(),
          ),
          GoRoute(
              path: UserHomeRoute.path,
              name: 'UserHome',
              builder: (context, state) {
                final auth = ref.watch(autoAuthControllerProvider);

                return auth!.when(
                    complete: (id, userEntityModel, authUser, cubeUser) {
                      final cUser = ref.watch(cubeEntityProvider);
                      return ProfileScreen(
                          uid: auth.id.toString(),
                          pid: cUser.id.toString()
                      );
                    },
                    unComplete: (id, userEntityModel, authUser) =>
                        UserHomeScreen(pid: auth.id.toString()));
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
                ),
                GoRoute(
                  path: DrawingRoute.path,
                  name: 'drawingRoute',
                  builder: (context, state) => const DrawingPage(),
                )
              ]),
          GoRoute(
            path: GodzyLogoRoute.path,
            name: 'godzyRoute',
            builder: (context, state) => const Godzylogo(),
          ),
          GoRoute(
            path: AvisBoxRoute.path,
            name: 'avisRoute',
            builder: (context, state) => const AvisBoxPage(),
          ),
          GoRoute(
              path: SettingsUiRoute.path,
              name: 'settingsRoute',
              builder: (context, state) => const SettingsUiPage(),
              routes: [
                GoRoute(
                  path: CrossPlatformSettingsRoute.path,
                  name: 'crossPlatformRoute',
                  builder: (context, state) => const CrossPlatformSettingsScreen(),
                ),
                GoRoute(
                  path: WebChromeAddressesRoute.path,
                  name: 'webChromeAddressesRoute',
                  builder: (context, state) => const WebChromeAddressesScreen(),
                ),
                GoRoute(
                  path: AndroidNotificationsRoute.path,
                  name: 'androidNotificationsRoute',
                  builder: (context, state) => const AndroidNotificationsScreen(),
                ),
                GoRoute(
                  path: WebChromeSettingsRoute.path,
                  name: 'webChromeSettingsRoute',
                  builder: (context, state) => const WebChromeSettings(),
                ),
              ]
          ),
        ]),
  ],
  errorBuilder: (context, state) =>
      ErrorScreen(error: state.error.toString()),
  redirect: (context, state) {
    // final loggedIn = authStateListenable.value;
    // final goigToLogin = state.subloc.contains == LoginRoute().location;
    return null;
  },
  refreshListenable: authStateListenable,
  debugLogDiagnostics: true,
));

// <---------------- GeoLocation Provider --------------------> //
final geoFlutterFireProvider = Provider<GeoFlutterFire>((ref) => GeoFlutterFire());



