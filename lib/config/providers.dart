// import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
// import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/devis/presentation/views/screens/devis_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as ui;

import '../config/routes/routes.dart';
import '../features/auth/data/data_source_providers.dart';
import '../features/auth/domain/providers/auth_repository_provider.dart';
import '../features/auth/presentation/views/screens/auth_screens.dart';
import '../features/avis/presentation/view/avis_box_page.dart';
import '../features/chat/application/providers/cube_settings_provider.dart';
import '../features/chat/domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import '../features/common/presentation/views/screens/error_screen.dart';
import '../features/devis/presentation/views/screens/devis_list_screen.dart';
import '../features/home/presentation/view/home_screen.dart';
import '../features/home/presentation/widget/godzylogo.dart';
import '../features/settings/presentation/view/gallery/gallery.dart';
import '../features/settings/presentation/view/settings_ui_page.dart';
import '../features/sketch/presentation/view/drawing_page.dart';

Future<void> initializeProvider(ProviderContainer container) async {
  await container.read(firebaseInitProvider.future);
  await container.read(supabaseInitProvider.future);
  await container.read(userFutureProvider.future);
  //await container.read(webrtcInitProvider.future);
  await container.read(datadogProvider.future);
  await container.read(datadogConfigProvider.future);

  // container.read(cubeSettingsInitProvider.future);

  container.read(sharedPreferencesProvider);
  container.read(firebaseDatabaseProvider);
  container.read(firebaseFirestoreProvider);
  container.read(firebaseMessagingProvider);
  container.read(emulatorSettingsProvider);
  container.read(geoFlutterFireProvider);
  container.read(firebaseAuthProvider);
  // container.read(cubeUserControllerProvider);
  // container.read(cubeSessionManagerProvider);
  // container.read(cubeChatConnectionSettingsProvider);
  // container.read(cubeChatConnectionProvider);
  container.read(goRouterProvider);
  // container.read(localizationProvider);
  // container.read(cubeProvider);

  // container.read(authStateChangesProvider);
  // container.read(authStateProvider);
  // container.read(idTokenChangesProvider);
  // container.read(userChangesProvider);

  container.read(fireDatabaseProvider);

  //container.dispose();
}

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
  name: 'Shared preferences future provider',
);

// <---------------- GoRouter Provider --------------------> //
final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: HomeRoute.path,
          name: 'home',
          builder: (context, state) => HomeScreen(
                key: state.pageKey,
              ),
          routes: [
            GoRoute(
                path: UserHomeRoute.path,
                name: 'user_home',
                builder: (context, state) => UserHomeScreen(
                    key: state.pageKey,
                    pid: state.pathParameters['userId'] ?? ''),
                routes: [
                  GoRoute(
                    path: PersonRoute.path,
                    name: 'profile',
                    builder: (context, state) {
                      return ProfileScreen(
                          key: state.pageKey,
                          uid: ref.watch(authStateChangesProvider).value!.uid,
                          pid:
                              '1335' //ref.watch(cubeUserControllerProvider)!.id.toString()
                          );
                    },
                  ),
                  GoRoute(
                    path: DrawingRoute.path,
                    name: 'drawingRoute',
                    builder: (context, state) => DrawingPage(
                      key: state.pageKey,
                    ),
                  ),
                  GoRoute(
                    path: UserListRoute.path,
                    name: 'userList',
                    builder: (context, state) => UserListScreen(
                      key: state.pageKey,
                    ),
                  ),
                ]),
            GoRoute(
              path: GodzyLogoRoute.path,
              name: 'godzyRoute',
              builder: (context, state) => Godzylogo(key: state.pageKey),
            ),
            GoRoute(
                path: ChatRoute.path,
                name: 'chat',
                builder: (context, state) => LoginOnChat(key: state.pageKey),
                routes: [
                  GoRoute(
                      path: SelectDialogRoute.path,
                      name: 'select_dialog',
                      builder: (context, state) => SelectDialogScreen(
                          currentUser: ref.watch(cubeUserControllerProvider
                              .select((value) => value!))),
                      routes: [
                        GoRoute(
                            path: ChatDialogRoute.path,
                            name: 'chat_dialog',
                            builder: (context, state) {
                              CubeDialogMig? cubeDialog;
                              return ChatDialogScreen(
                                  cubeUser: ref.watch(cubeUserControllerProvider
                                      .select((value) => value!)),
                                  cubeDialog: cubeDialog!);
                            })
                      ])
                ]),
            GoRoute(
              path: AvisBoxRoute.path,
              name: 'avisRoute',
              builder: (context, state) => AvisBoxPage(key: state.pageKey),
            ),
            GoRoute(
              path: DevisEditRoute.path,
              name: 'devis',
              builder: (context, state) => DevisEditScreen(
                key: state.pageKey,
                devisId: state.pathParameters['devisId'] as String,
              ),
            ),
            GoRoute(
              path: DevisListRoute.path,
              name: 'devisList',
              builder: (context, state) => DevisListScreen(
                key: state.pageKey,
              ),
            ),
            GoRoute(
                path: SettingsUiRoute.path,
                name: 'settingsRoute',
                builder: (context, state) => SettingsUiPage(key: state.pageKey),
                routes: [
                  GoRoute(
                    path: CrossPlatformSettingsRoute.path,
                    name: 'crossPlatformRoute',
                    builder: (context, state) =>
                        CrossPlatformSettingsScreen(key: state.pageKey),
                  ),
                  GoRoute(
                    path: WebChromeAddressesRoute.path,
                    name: 'webChromeAddressesRoute',
                    builder: (context, state) =>
                        WebChromeAddressesScreen(key: state.pageKey),
                  ),
                  GoRoute(
                    path: AndroidNotificationsRoute.path,
                    name: 'androidNotificationsRoute',
                    builder: (context, state) =>
                        AndroidNotificationsScreen(key: state.pageKey),
                  ),
                  GoRoute(
                    path: WebChromeSettingsRoute.path,
                    name: 'webChromeSettingsRoute',
                    builder: (context, state) =>
                        WebChromeSettings(key: state.pageKey),
                  ),
                ]),
          ]),
      GoRoute(
          path: AuthRoute.path,
          name: 'authRoute',
          builder: (context, state) => AuthScreen(
                key: state.pageKey,
              ),
          routes: [
            GoRoute(
                path: LoginRoute.path,
                name: 'login',
                builder: (context, state) => LoginScreen(
                      key: state.pageKey,
                    ),
                routes: [
                  GoRoute(
                    path: VerificationRoute.path,
                    name: 'verify',
                    builder: (context, state) {
                      VerificationScreenParams params =
                          state.extra as VerificationScreenParams;
                      return VerificationScreen(params: params);
                    },
                  )
                ]),
            GoRoute(
                path: SignUpRoute.path,
                name: 'sign_up',
                builder: (context, state) => SignUpScreen(
                      key: state.pageKey,
                    ),
                routes: [
                  GoRoute(
                    path: MFAEnrollRoute.path,
                    name: 'enroll',
                    builder: (context, state) {
                      VerificationScreenParams params =
                          state.extra as VerificationScreenParams;
                      // var params = const VerificationScreenParams(
                      //     name: 'karl',
                      //     email: 'isgodzy@msn.com',
                      //     password: 'bondamanmanw');

                      return MFAEnrollScreen(params: params);
                    },
                  ),
                ]),
            GoRoute(
              path: ListMfaRoute.path,
              name: 'mfaList',
              builder: (context, state) => ListMfaScreen(
                key: state.pageKey,
              ),
            ),
          ]),
    ],
    errorBuilder: (context, state) =>
        ErrorScreen(error: state.error.toString()),
    redirect: (context, state) async {
      final supabase = ref.watch(supabaseClientProvider);
      // Any users can visit the /auth route
      if (state.matchedLocation.contains('auth') == true) {
        return null;
      }

      final session = supabase.auth.currentSession;
      // A user without a session should be redirected to the sign_up screen
      if (session == null || session.isExpired == true) {
        return AuthRoute.path;
      }

      final assuranceLevelData =
          supabase.auth.mfa.getAuthenticatorAssuranceLevel();

      final nextLevel =
          supabase.auth.mfa.getAuthenticatorAssuranceLevel().nextLevel;
      // The user has not setup MFA yet, so send them to enroll MFA page.
      if (assuranceLevelData.currentLevel ==
          ui.AuthenticatorAssuranceLevels.aal1) {
        await supabase.auth.refreshSession();
        if (nextLevel == ui.AuthenticatorAssuranceLevels.aal2) {
          // The user has already setup MFA, but haven't login via MFA
          // Redirect them to the verify screen
          return VerificationRoute.path;
        } else {
          // The user has not yet setup MFA
          // Redirect them to the enrollment screen
          return MFAEnrollRoute.path;
        }
      }

      return null;
    },
    refreshListenable: authStateListenable,
    debugLogDiagnostics: true,
    observers: [observer]));

// <---------------- GeoLocation Provider --------------------> //
final geoFlutterFireProvider =
    Provider<GeoFlutterFire>((ref) => GeoFlutterFire());

// <---------------- RunViewInfo Provider --------------------> //
final observer = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance, viewInfoExtractor: infoExtractor);

RumViewInfo? infoExtractor(Route<dynamic> route) {
  var name = route.settings.name;
  if (name == 'my_named_route') {
    return RumViewInfo(
        name: 'MyDifferentName',
        attributes: {'extra_attribue': 'attribute_value'});
  }

  return defaultViewInfoExtractor(route);
}
