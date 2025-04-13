import 'dart:developer' as developer;
import 'dart:isolate';

import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers/connectivity/connectivity_providers.dart';
import 'package:egote_services_v2/config/providers/connectivity/dio_providers.dart';
import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/permissions/device_permissions_providers.dart';
import 'package:egote_services_v2/config/providers/permissions/permissions_providers.dart';
import 'package:egote_services_v2/config/providers/platform/platform_provider.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_service.dart';
import 'package:egote_services_v2/config/providers/webrtc/webrtc_provider.dart';
import 'package:egote_services_v2/features/avis/domain/providers/feedback/feedback_provider.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/routes/routes.dart';
import '../features/auth/data/data_source_providers.dart';
import '../features/auth/domain/providers/auth_repository_provider.dart';
import '../features/auth/presentation/controller/auth_controller_state.dart';
import '../features/auth/presentation/views/screens/auth_screens.dart';
import '../features/avis/presentation/view/avis_box_page.dart';
import '../features/chat/application/providers/cube_settings_provider.dart';
import '../features/chat/data/data_sources/local/pref_util.dart';
import '../features/chat/presentation/views/screens/chat_screens.dart';
import '../features/common/presentation/views/screens/error_screen.dart';
import '../features/devis/domain/providers/check_out_service_provider.dart';
import '../features/devis/domain/providers/devis_providers.dart';
import '../features/devis/domain/providers/edit_devis_view_model_provider.dart';
import '../features/devis/presentation/states/entities/product_states/produit_entity_states.dart';
import '../features/devis/presentation/views/screens/devis_screens.dart';
import '../features/home/presentation/view/home_screen.dart';
import '../features/home/presentation/widget/godzylogo.dart';
import '../features/settings/presentation/view/gallery/gallery.dart';
import '../features/settings/presentation/view/settings_ui_page.dart';
import '../features/sketch/presentation/view/drawing_page.dart';

Future<void> initializeProvider(ProviderContainer container) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(
      _initializeCoreServicesInBackground, receivePort.sendPort);

  final result = await receivePort.first;

  if (result is String) {
    developer.log('Error during initialization: $result');
    throw Exception(result);
  }
  developer.log('Core services initialized successfully');

  await _initializeAdditionalProviders(container);
  container.dispose();
}

void _initializeCoreServicesInBackground(SendPort sendPort) async {
  try {
    final container = ProviderContainer();
    // Lancer les initialisations en parallèle avec Future.any
    await Future.any([
      container.read(supabaseInitProvider.future),
      container.read(webrtcInitProvider.future),
      container.read(datadogProvider.future),
      container.read(cubeUserProvider.future),
    ]).timeout(const Duration(seconds: 30));

    sendPort
        .send('Core services initialized successfully'); // Envoyer un succès
  } catch (e) {
    sendPort.send(
        'Error during core services initialization: $e'); // En cas d'erreur
  }
}

Future<void> _initializeAdditionalProviders(ProviderContainer container) async {
  final receivePort = ReceivePort();

  // Créer un Isolate pour initialiser les fournisseurs supplémentaires
  await Isolate.spawn(
      _initializeAdditionalProvidersInBackground, receivePort.sendPort);

  // Attendre la fin de l'initialisation des fournisseurs
  final result = await receivePort.first;

  if (result is String) {
    developer.log('Error during additional provider initialization: $result');
    throw Exception(result); // Gérer l'erreur d'initialisation
  }

  developer.log('Additional providers initialized successfully');
  await _cleanupProviders(container);
  container.dispose();
}

void _initializeAdditionalProvidersInBackground(SendPort sendPort) async {
  try {
    final container = ProviderContainer();

    await Future.wait(
      <Future<dynamic>>[
        container.read(permissionsInitProvider.future),
        container.read(firebaseInitProvider.future),
        container.read(userFutureProvider.future),
        container.read(cubeUserProvider.future),
        container.read(sharedPreferencesProvider.future),
        container.read(cubeChatConnectionSettingsProvider.future),
        container.read(produitFutureProvider.future),
      ],
      eagerError: true, // Si une des futures échoue, l'exécution s'arrête
    );
  } catch (e) {
    sendPort.send(
        'Error during additional providers initialization: $e'); // En cas d'erreur
  }
}

Future<void> _cleanupProviders(ProviderContainer container) async {
  final receivePort = ReceivePort();

  await Isolate.spawn(
      _cleanupProvidersInBackground, [container, receivePort.sendPort]);

  receivePort.listen((message) {
    if (message is String) {
      developer.log('Cleanup completed successfully: $message');
      throw Exception(message);
    } else {
      developer.log('Error during cleanup: $message');
    }
  }, onError: (error, stackTrace) {
    developer.log('Error during cleanup: $error');
    developer.log('Stack trace: $stackTrace');
    throw Exception('Error during cleanup: $error');
  });
}

void _cleanupProvidersInBackground(List<dynamic> args) async {
  final container = args[0] as ProviderContainer;
  final sendPort = args[1] as SendPort;

  try {
    await Future.delayed(const Duration(seconds: 2), () {
      container.read(appStateProvider);
      container.read(connectivityStatusProviders);
      container.read(sharedPrefsProvider);
      container.read(firebaseDatabaseProvider);
      container.read(firebaseFirestoreProvider);
      container.read(firebaseMessagingProvider);
      container.read(emulatorSettingsProvider);
      container.read(firebaseAuthProvider);
      container.read(cubeUserControllerProvider);
      container.read(cubeSessionManagerProvider);
      container.read(cubeChatConnectionNotifierProvider);
      container.read(cubeChatConnectionSettingsProvider);
      container.read(cubeChatConnectionProvider);
      container.read(goRouterProvider);
      container.read(localizationProvider);
      container.read(cubeProvider);

      // Read authentication related providers
      container.read(authStateChangesProvider);
      container.read(authControllerStateProvider);
      container.read(userChangesProvider);
      container.read(userRoleProvider);

      // Read other services/providers
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
      container.read(dioProvider);
      container.read(telemetryProvider);
      container.read(feedbacksProvider);
      container.read(authCubeStreamProvider);
      container.read(datadogServiceProvider);
    });

    sendPort.send('Cleanup completed successfully');
  } catch (e) {
    sendPort.send('Error during cleanup: $e');
  }
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
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
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
                                    cubeUser: ref.watch(
                                        cubeUserControllerProvider
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
                          final produitId = state.pathParameters['produitId']!;
                          return ProductEditScreen(
                            key: state.pageKey,
                            produitId: produitId,
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
                  builder: (context, state) =>
                      SettingsUiPage(key: state.pageKey),
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
                        routes: [
                          GoRoute(
                              path: NotificationsScreenRoute.path,
                              name: 'notificationsScreen',
                              builder: (context, state) =>
                                  const NotificationsScreen()),
                          GoRoute(
                              path: DevicesScreenRoute.path,
                              name: 'devicesScreen',
                              builder: (context, state) =>
                                  const DevicesScreen()),
                          GoRoute(
                              path: NetworkScreenRoute.path,
                              name: 'networkScreen',
                              builder: (context, state) =>
                                  const NetworkScreen()),
                          GoRoute(
                            path: PermissionRoute.path,
                            name: 'permissionScreen',
                            builder: (context, state) => PermissionScreen(
                              key: state.pageKey,
                            ),
                          )
                        ]),
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
              final currentUserId = state.pathParameters['cId']!;
              final cubeDialogId = state.pathParameters['dialogId']!;
              if (cubeDialogId == '0' && currentUserId == '0') {
                return ErrorScreen(
                    key: state.pageKey,
                    error:
                        'What\'s wrong bobby?! CubeDialogId is null && currentUser is not null');
              }
              if (cubeDialogId != '0' && currentUserId != '0') {
                return ChatScreen(
                    key: state.pageKey,
                    cubeUserId: currentUserId,
                    cubeDialogId: cubeDialogId);
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
/*      redirect: (context, state) async {
        // await Firebase.initializeApp();

        final user = ref.watch(firebaseAuthProvider).currentUser;

        // Si l'utilisateur n'est pas connecté, rediriger vers la page de connexion
        if (user == null && state.uri.toString() != '/login') {
          return '/login';
        }

        // Si l'utilisateur est connecté, rediriger vers la page d'accueil
        if (user != null && state.uri.toString() == '/login') {
          return '/home';
        }
        return null; // Aucune redirection
      },*/
      errorBuilder: (context, state) =>
          ErrorScreen(error: state.error.toString()),
      refreshListenable: authStateListenable,
      debugLogDiagnostics: true,
      observers: [observer]);
});

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

final containerProvider = Provider<ProviderContainer>((ref) {
  final container = ProviderContainer();
  ref.onDispose(
    () => container.dispose(),
  );
  return container;
});
