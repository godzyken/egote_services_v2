import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers/connectivity/connectivity_providers.dart';
import 'package:egote_services_v2/config/providers/connectivity/dio_providers.dart';
import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/permissions/permissions_providers.dart';
import 'package:egote_services_v2/config/providers/platform/platform_provider.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/config/providers/webrtc/webrtc_provider.dart';
import 'package:egote_services_v2/features/devis/domain/providers/check_out_service_provider.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/product_states/produit_entity_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/routes/routes.dart';
import '../features/auth/data/data_source_providers.dart';
import '../features/auth/domain/providers/auth_repository_provider.dart';
import '../features/auth/presentation/controller/auth_controller_state.dart';
import '../features/auth/presentation/views/screens/auth_screens.dart';
import '../features/avis/domain/providers/feedback/feedback_provider.dart';
import '../features/avis/presentation/view/avis_box_page.dart';
import '../features/chat/application/providers/cube_settings_provider.dart';
import '../features/chat/data/data_sources/local/pref_util.dart';
import '../features/chat/presentation/views/screens/chat_dialog_screen.dart';
import '../features/chat/presentation/views/screens/chat_screen.dart';
import '../features/chat/presentation/views/screens/chat_video_screen.dart';
import '../features/chat/presentation/views/screens/login_on_chat.dart';
import '../features/chat/presentation/views/screens/select_dialog_screen.dart';
import '../features/common/presentation/views/screens/error_screen.dart';
import '../features/devis/domain/entities/products/produit_model_entity.dart';
import '../features/devis/domain/providers/devis_providers.dart';
import '../features/devis/domain/providers/edit_devis_view_model_provider.dart';
import '../features/devis/presentation/views/screens/devis_edit_screen.dart';
import '../features/devis/presentation/views/screens/devis_list_screen.dart';
import '../features/devis/presentation/views/screens/document_view_screen.dart';
import '../features/devis/presentation/views/screens/product_details_screen.dart';
import '../features/devis/presentation/views/screens/product_edit_screen.dart';
import '../features/devis/presentation/views/screens/product_list_screen.dart';
import '../features/home/presentation/view/home_screen.dart';
import '../features/home/presentation/widget/godzylogo.dart';
import '../features/settings/presentation/view/gallery/gallery.dart';
import '../features/settings/presentation/view/settings_ui_page.dart';
import '../features/sketch/presentation/view/drawing_page.dart';

Future<void> initializeProvider(ProviderContainer container) async {
  await Future.wait(
    <Future<dynamic>>[
      container.read(supabaseInitProvider.future),
      container.read(firebaseInitProvider.future),
      container.read(userFutureProvider.future),
      container.read(webrtcInitProvider.future),
      container.read(datadogProvider.future),
      container.read(cubeSettingsInitProvider.future),
      container.read(cubeUserProvider.future),
      container.read(sharedPreferencesProvider.future),
      container.read(produitFutureProvider.future),
      container.read(cubeChatConnectionSettingsProvider.future),
    ],
    eagerError: true,
    cleanUp: (successValue) async {
      await Future.delayed(const Duration(seconds: 2));
      container.read(connectivityStatusProviders);
      container.read(sharedPrefsProvider);
      container.read(firebaseDatabaseProvider);
      container.read(firebaseFirestoreProvider);
      container.read(firebaseMessagingProvider);
      container.read(emulatorSettingsProvider);
      // container.read(geoLocProvider);
      container.read(firebaseAuthProvider);
      container.read(cubeUserControllerProvider);
      container.read(cubeSessionManagerProvider);
      container.read(cubeChatConnectionNotifierProvider);
      container.read(cubeChatConnectionSettingsProvider);
      container.read(cubeChatConnectionProvider);
      container.read(goRouterProvider);
      container.read(localizationProvider);
      container.read(cubeProvider);

      container.read(authStateChangesProvider);
      container.read(authStateProvider);
      // container.read(idTokenChangesProvider);
      container.read(userChangesProvider);
      container.read(userRoleProvider);

      container.read(fireDatabaseProvider);

      container.read(backgroundTaskProvider);
      container.read(editDeviViewModelProvider);
      container.read(produitServiceProvider);
      container.read(editProduitProvider);
      container.read(produitStateNotifierProvider);
      container.read(devisStateNotifierProvider);
      container.read(checkoutServiceProvider);
      container.read(missionsListProvider);
      container.read(travauxListProvider);
      container.read(missionStateNotifierProvider);
      container.read(devisStateNotifierProvider);
      container.read(dioProvider);
      container.read(telemetryProvider);
      container.read(feedbacksProvider);

      return successValue;
    },
  );

  container.dispose();
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (ref) async {
    // Initialisation de SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  },
  name: 'Shared preferences future provider',
);

final sharedPrefsProvider = Provider<SharedPrefs>((ref) {
  return SharedPrefs.instance;
});

// <---------------- GoRouter Provider --------------------> //
final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
          path: HomeRoute.path,
          name: 'home',
          builder: (context, state) => HomeScreen(key: state.pageKey),
          routes: [
            GoRoute(
                path: UserHomeRoute.path,
                name: 'user_home',
                builder: (context, state) => UserHomeScreen(
                      key: state.pageKey,
                      pid: state.pathParameters['userId']!,
                      preload: false,
                    ),
                routes: [
                  GoRoute(
                    path: PersonRoute.path,
                    name: 'profile',
                    builder: (context, state) {
                      return ProfileScreen(
                          key: state.pageKey,
                          uid: ref.watch(authStateChangesProvider).value!.uid,
                          pid: ref
                              .watch(cubeUserControllerProvider)!
                              .id
                              .toString());
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
                path: LoginOnChatRoute.path,
                name: 'login_on_chat',
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
                              CubeDialog? cubeDialog;
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
                builder: (context, state) {
                  final avisId = state.pathParameters['avisId']!;
                  return AvisBoxPage(
                    key: state.pageKey,
                    avisId: avisId,
                  );
                }),
            GoRoute(
                path: DocumentPreviewRoute.path,
                name: 'documents',
                builder: (context, state) => DocumentViewScreen(
                      key: state.pageKey,
                    ),
                routes: [
                  GoRoute(
                    path: DevisEditRoute.path,
                    name: 'devis',
                    builder: (context, state) => DevisEditScreen(
                      key: state.pageKey,
                      devisId: state.pathParameters['devisId']!,
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
                      path: ProduitListRoute.path,
                      name: 'produitList',
                      builder: (context, state) => ProductListScreen(
                            key: state.pageKey,
                          )),
                  GoRoute(
                      path: ProduitEditRoute.path,
                      name: 'produitEdit',
                      builder: (context, state) {
                        final produit = state.extra as Produit;
                        return ProductEditScreen(
                          key: state.pageKey,
                          produit: produit,
                        );
                      }),
                  GoRoute(
                      path: ProduitDetailsRoute.path,
                      name: 'produitDetailsRoute',
                      builder: (context, state) {
                        return ProduitDetails(
                          key: state.pageKey,
                          id: state.pathParameters['prodId']!,
                        );
                      }),
                ]),
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
                child: context.widget,
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
      GoRoute(
          path: ChatRoute.path,
          name: 'chat',
          builder: (context, state) {
            final currentUser = ref.watch(cubeUserControllerProvider);
            final cubeDialogId = state.pathParameters['dialogId'];
            CubeDialog? cubeDialog;
            if (cubeDialogId == null && currentUser != null) {
              return ErrorScreen(
                  key: state.pageKey,
                  error:
                      'What\'s wrong bobby?! CubeDialogId is null && currentUser is not null');
            }
            if (cubeDialogId != null && currentUser != null) {
              return ChatScreen(
                  key: state.pageKey,
                  cubeUser: currentUser,
                  cubeDialog: cubeDialog!);
            } else {
              return LoginOnChat(key: state.pageKey);
            }
          }),
      GoRoute(
        path: ChatVideoScreenRoute.path,
        name: 'chat_room',
        builder: (context, state) {
          return ChatVideoScreen(
            key: state.pageKey,
            uid: state.pathParameters['userId']!,
            pid: state.pathParameters['cubId']!,
          );
        },
      )
    ],
    errorBuilder: (context, state) =>
        ErrorScreen(error: state.error.toString()),
    /*redirect: (context, state) async {
      final supabase = ref.watch(supabaseClientProvider);

      // Autoriser l'accès aux pages d'authentification sans restriction
      if (state.matchedLocation.contains('auth')) {
        return null;
      }

      final session = supabase.auth.currentSession;

      // Si l'utilisateur n'a pas de session ou si elle est expirée, rediriger vers la page d'authentification
      if (session == null || session.isExpired) {
        return AuthRoute.path;
      }

      try {
        // Vérifier le niveau d'assurance MFA de l'utilisateur
        final assuranceLevelData =
            supabase.auth.mfa.getAuthenticatorAssuranceLevel();
        final nextLevel = assuranceLevelData.nextLevel;

        // Si l'utilisateur n'a pas encore configuré MFA, le rediriger vers l'enrôlement MFA
        if (assuranceLevelData.currentLevel ==
            ui.AuthenticatorAssuranceLevels.aal1) {
          await supabase.auth.refreshSession();

          if (nextLevel == ui.AuthenticatorAssuranceLevels.aal2) {
            // Si l'utilisateur a configuré MFA mais n'a pas encore vérifié, rediriger vers la vérification
            return VerificationRoute.path;
          } else {
            // Si l'utilisateur n'a pas configuré MFA, le rediriger vers l'enrôlement
            return MFAEnrollRoute.path;
          }
        }
      } catch (e) {
        // En cas d'erreur lors de la récupération des données MFA
        developer.log('Erreur lors de la récupération du niveau MFA: $e');
        return AuthRoute.path;
      }

      // Si tout est en règle, l'utilisateur peut continuer normalement
      return null;
    },*/
    refreshListenable: authStateListenable,
    debugLogDiagnostics: true,
    observers: [observer]));

// <---------------- RunViewInfo Provider --------------------> //
final observer = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance, viewInfoExtractor: infoExtractor);

RumViewInfo? infoExtractor(Route<dynamic> route) {
  var name = route.settings.name;
  if (name == 'my_named_route') {
    return RumViewInfo(
        name: 'MyDifferentName',
        attributes: {'extra_attribute': 'attribute_value'});
  }

  return defaultViewInfoExtractor(route);
}
