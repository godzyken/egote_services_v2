import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/features/common/presentation/controller/providers/custom_drawer/drawer_width_provider.dart';
import 'package:egote_services_v2/features/settings/controllers/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_shared/extensions/extensions.dart';
import 'config/cube_config/cube_config.dart';
import 'config/environements/flavors.dart';
import 'features/chat/data/data_sources/local/pref_util.dart';
import 'features/theme/controller/provider/themes/themes_provider.dart';
import 'l10n/app_localizations.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  late StreamSubscription<ConnectivityResult> connectivityStateSubscription;
  AppLifecycleState? appState;

  @override
  Widget build(BuildContext context) {
    final router = ref.read(goRouterProvider);
    final lang = ref.read(localizationProvider);
    return MaterialApp.router(
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
    );
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

    });

    appState = WidgetsBinding.instance.lifecycleState;

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appState = state;

    switch (appState) {
      case null:
      // TODO: Handle this case.
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
                  var phoneAuthSession = await createSessionUsingFirebase(
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
    }

    /* if (AppLifecycleState.paused == state) {
      if (CubeChatConnection.instance.isAuthenticated()) {
        CubeChatConnection.instance.markInactive();
      }
    } else if (AppLifecycleState.resumed == state) {
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
                var phoneAuthSession = await createSessionUsingFirebase(
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
    }*/
  }
}
