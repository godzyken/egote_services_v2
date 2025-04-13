import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/features/common/presentation/controller/providers/custom_drawer/drawer_width_provider.dart';
import 'package:egote_services_v2/features/settings/controllers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_shared/extensions/extensions.dart';
import 'config/cube_config/cube_config.dart';
import 'config/environements/flavors.dart';
import 'config/providers/connectivity/connectivity_providers.dart';
import 'features/theme/controller/provider/themes/themes_provider.dart';
import 'l10n/app_localizations.dart';

class EgoteApp extends ConsumerStatefulWidget {
  const EgoteApp({super.key});

  @override
  ConsumerState<EgoteApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<EgoteApp> with WidgetsBindingObserver {
  static const platform = MethodChannel('com.godzy.egote_services_v2/firebase');

  String _firebaseResponse = 'Reponse de firebase: Non recue';

  Future<void> _getFirebaseData() async {
    try {
      final String response = await platform
          .invokeMethod('getFirebaseData', {'message': 'Hello from Flutter'});
      developer.log('Firebase response: $response');
      setState(() {
        _firebaseResponse = response;
      });
    } on PlatformException catch (e) {
      developer.log('$_firebaseResponse :: ${e.message}');
      setState(() {
        _firebaseResponse = 'Erreur: ${e.message}';
      });
    }
  }

  Future<void> _getPlatformVersion() async {
    try {
      // Invoke the method on the native side
      final String version = await platform.invokeMethod('getPlatformVersion');
      developer.log('Platform version: $version');
    } on PlatformException catch (e) {
      developer.log("Failed to get platform version: '${e.message}'.");
    }
  }

  late StreamSubscription<List<ConnectivityResult>>
      connectivityStateSubscription;
  AppLifecycleState? appState;

  @override
  Widget build(BuildContext context) {
    final router = ref.read(goRouterProvider);
    final lang = ref.read(localizationProvider);
    final datadog = ref.read(datadogInstanceProvider);
    final lightTheme = ref.watch(lightThemeProvider);
    final darkTheme = ref.watch(darkThemeProvider);
    final settingsThemeMode = ref.watch(Settings.themeModeProvider);

    connectivityStateSubscription =
        ref.watch(connectivityStatusProviders.notifier).subscription!;

    return RumUserActionDetector(
        rum: datadog.rum,
        child: MaterialApp.router(
          title: F.title,
          // routerDelegate: router.routerDelegate,
          // routeInformationParser: router.routeInformationParser,
          // routeInformationProvider: router.routeInformationProvider,
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: settingsThemeMode,
          debugShowCheckedModeBanner: true,
          scrollBehavior: const AppScrollBehavior(),
          locale: lang,
          builder: (context, child) => child!,
          actions: <Type, Action<Intent>>{
            ...WidgetsApp.defaultActions,
            ActivateAction: CallbackAction<Intent>(
              onInvoke: (Intent intent) {
                // Do something here...

                return null;
              },
            ),
          },
        ));
  }

  @override
  void didChangeMetrics() {
    ref.read(drawerWidthProvider.notifier).state = drawerWidth();

    super.didChangeMetrics();
  }

  @override
  void dispose() {
    connectivityStateSubscription.cancel();

    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //initCube.asStream();

    _getPlatformVersion();

    _getFirebaseData();

    appState = WidgetsBinding.instance.lifecycleState;

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    try {
      switch (state) {
        case AppLifecycleState.resumed:
          // L'application revient au premier plan
          ref.watch(sharedPrefsProvider).init().then((sharedPrefs) async {
            CubeUser? user =
                await sharedPrefs.getUser().then((savedUser) => savedUser);

            if (user != null) {
              // Si l'utilisateur est présent dans les préférences partagées
              if (!CubeChatConnection.instance.isAuthenticated()) {
                if (LoginType.phone == sharedPrefs.getLoginType()) {
                  // Connexion par téléphone
                  if (CubeSessionManager.instance.isActiveSessionValid()) {
                    user.password =
                        CubeSessionManager.instance.activeSession?.token;
                  } else {
                    var phoneAuthSession =
                        await createSessionUsingFirebasePhone(
                            'projectId', 'accessToken');
                    user.password = phoneAuthSession.token;
                  }
                }
                // Connexion à CubeChat
                CubeChatConnection.instance.login(user);
              } else {
                // Si déjà connecté, on marque la connexion comme active
                CubeChatConnection.instance.markActive();
              }
            }
          });
          break;

        case AppLifecycleState.inactive:
          // L'application passe en mode inactif
          // Peut-être qu'on pourrait faire un nettoyage ou enregistrer des données ici
          break;

        case AppLifecycleState.paused:
          // L'application passe en arrière-plan
          if (CubeChatConnection.instance.isAuthenticated()) {
            CubeChatConnection.instance.markInactive();
          }
          break;

        case AppLifecycleState.detached:
          // L'application se détache de l'arbre des widgets
          // Ici, il peut être utile de faire un nettoyage ou une sauvegarde des données
          break;

        case AppLifecycleState.hidden:
          // L'application passe à l'état caché
          // Vous pouvez gérer ce cas si nécessaire
          break;
      }
    } catch (e) {
      // Gestion des erreurs globales
      developer.log('Error handling app lifecycle state: $e');
    }
  }
}

/*
roles/serviceusage.apiKeysAdmin

gcloud projects add-iam-policy-binding PROJECT_ID --member="user:isgodzy@gmail.com" --role=ROLE

alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json"'

gcurl https://apikeys.googleapis.com/v2/projects/YOUR_PROJECT_NUMBER/locations/global/keys

 */
