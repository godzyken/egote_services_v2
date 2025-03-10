import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/features/common/presentation/controller/providers/custom_drawer/drawer_width_provider.dart';
import 'package:egote_services_v2/features/settings/controllers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_shared/extensions/extensions.dart';
import 'config/cube_config/cube_config.dart';
import 'config/environements/flavors.dart';
import 'config/providers/cube/cube_providers.dart';
import 'features/chat/data/data_sources/local/pref_util.dart';
import 'features/theme/controller/provider/themes/themes_provider.dart';
import 'l10n/app_localizations.dart';

class EgoteApp extends ConsumerStatefulWidget {
  const EgoteApp({super.key});

  @override
  ConsumerState<EgoteApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<EgoteApp> with WidgetsBindingObserver {
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
    final cubeInstance = ref.watch(cubeProvider);
    //  late final initCube = initStateConnection(cubeInstance, ref);

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

    connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityType) {
      if (AppLifecycleState.resumed != appState) return;

      log("chatConnectionState = ${CubeChatConnection.instance.chatConnectionState}");
      bool isChatDisconnected =
          CubeChatConnection.instance.chatConnectionState ==
                  CubeChatConnectionState.Closed ||
              CubeChatConnection.instance.chatConnectionState ==
                  CubeChatConnectionState.ForceClosed;

      if (isChatDisconnected &&
          CubeChatConnection.instance.currentUser != null) {
        CubeChatConnection.instance.relogin();
      }

      log("chatConnectionState = ${CubeChatConnection.instance.chatConnectionState}");
    });

    //initCube.asStream();

    appState = WidgetsBinding.instance.lifecycleState;

    WidgetsBinding.instance.addObserver(this);
  }

  Future<bool> initForegroundService() async {
    final androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: 'Egote Services',
      notificationText: 'Screen sharing is in progress',
      notificationImportance: AndroidNotificationImportance.max,
      notificationIcon: androidResource,
    );
    return FlutterBackground.initialize(androidConfig: androidConfig);
  }

  AndroidResource get androidResource =>
      AndroidResource(name: 'ic_launcher_foreground', defType: 'drawable');

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        SharedPrefs.instance.init().then((sharedPrefs) async {
          CubeUser? user =
              await sharedPrefs.getUser().then((savedUser) => savedUser!);

          if (user != null) {
            if (!CubeChatConnection.instance.isAuthenticated()) {
              if (LoginType.phone == sharedPrefs.getLoginType()) {
                if (CubeSessionManager.instance.isActiveSessionValid()) {
                  user.password =
                      CubeSessionManager.instance.activeSession?.token;
                } else {
                  var phoneAuthSession = await createSessionUsingFirebasePhone(
                      'projectId', 'accessToken');
                  user.password = phoneAuthSession.token;
                }
              }
              CubeChatConnection.instance.login(user);
            } else {
              CubeChatConnection.instance.markActive();
            }
          }
        });
      case AppLifecycleState.inactive:
      // TODO: Handle this case.
      case AppLifecycleState.paused:
        if (CubeChatConnection.instance.isAuthenticated()) {
          CubeChatConnection.instance.markInactive();
        }
      case AppLifecycleState.detached:
      // TODO: Handle this case.
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
  }
}

/*
roles/serviceusage.apiKeysAdmin

gcloud projects add-iam-policy-binding PROJECT_ID --member="user:isgodzy@gmail.com" --role=ROLE

alias gcurl='curl -H "Authorization: Bearer $(gcloud auth print-access-token)" -H "Content-Type: application/json"'

gcurl https://apikeys.googleapis.com/v2/projects/YOUR_PROJECT_NUMBER/locations/global/keys

 */
