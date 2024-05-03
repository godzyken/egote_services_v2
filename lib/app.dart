import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
//import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/features/common/presentation/controller/providers/custom_drawer/drawer_width_provider.dart';
import 'package:egote_services_v2/features/settings/controllers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_shared/extensions/extensions.dart';
// import 'config/cube_config/cube_config.dart';
import 'config/environements/flavors.dart';
import 'features/chat/data/data_sources/local/pref_util.dart';
import 'features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'features/theme/controller/provider/themes/themes_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  late StreamSubscription<List<ConnectivityResult>>
      connectivityStateSubscription;
  AppLifecycleState? appState;

  @override
  Widget build(BuildContext context) {
    final router = ref.read(goRouterProvider);
    final lang = ref.read(localizationProvider);
    final datadog = ref.read(datadogInstanceProvider);
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
          theme: ref.watch(lightThemeProvider),
          darkTheme: ref.watch(darkThemeProvider),
          themeMode: ref.watch(Settings.themeModeProvider),
          scrollBehavior: const AppScrollBehavior(),
          locale: lang,
        ));
  }

  @override
  void didChangeMetrics() {
    ref.read(drawerWidthProvider.notifier).state = drawerWidth(context);

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

    /*  connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityType) {
      if (AppLifecycleState.resumed != appState) return;

      switch (connectivityType) {
        case ConnectivityResult.bluetooth:
        // TODO: Handle this case.
        case ConnectivityResult.wifi:
          // TODO: Handle this case.
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
        case ConnectivityResult.ethernet:
        // TODO: Handle this case.
        case ConnectivityResult.mobile:
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
        case ConnectivityResult.none:
          // TODO: Handle this case.
          CubeChatConnection.instance.destroy();
        case ConnectivityResult.vpn:
        // TODO: Handle this case.
        case ConnectivityResult.other:
        // TODO: Handle this case.
      }
    });*/
    late final initCube = initConnectyCube();

    initCube.asStream();

    appState = WidgetsBinding.instance.lifecycleState;

    WidgetsBinding.instance.addObserver(this);
  }

  Future<List<ConnectivityResult>> initConnectyCube() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    // This condition is for demo purposes only to explain every connection type.
    // Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection available.
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection available.
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
    }

    return connectivityResult;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        SharedPrefs.instance.init().then((sharedPrefs) async {
          CubeUserMig? user =
              await sharedPrefs.getUser().then((savedUser) => savedUser!);

          if (user != null) {
            /*   if (!CubeChatConnection.instance.isAuthenticated()) {
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
            }*/
          }
        });
      case AppLifecycleState.inactive:
      // TODO: Handle this case.
      case AppLifecycleState.paused:
      /*if (CubeChatConnection.instance.isAuthenticated()) {
          CubeChatConnection.instance.markInactive();
        }*/
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
