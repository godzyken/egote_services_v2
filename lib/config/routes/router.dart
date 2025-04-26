import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/routes/app_router_observer.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/config/routes/sentry_navigator_observer.dart';
import 'package:egote_services_v2/config/services/app_init_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/common/presentation/controller/providers/lock_screen/lock_screen_provider.dart';
import '../providers/gorouteprovider/router_refresh_provider.dart';
import '../providers/watchdog/datadog_service.dart';

part 'router.g.dart';

final rootRouterKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

// final _shellRouterKey = GlobalKey<NavigatorState>(debugLabel: 'shellRouterKey');

// <---------------- RunViewInfo Provider --------------------> //
final observer = DatadogNavigationObserver(
    datadogSdk: DatadogSdk.instance, viewInfoExtractor: infoExtractor);
final appRouterObserver = AppRouterObserver(datadogService: DatadogService());

RumViewInfo? infoExtractor(Route<dynamic> route) {
  var name = route.settings.name;
  if (name == 'my_named_route') {
    return RumViewInfo(
        name: 'MyDifferentName',
        attributes: {'extra_attribue': 'attribute_value'});
  }

  return defaultViewInfoExtractor(route);
}

@riverpod
// ignore: prefer-static-class
GoRouter router(Ref ref) {
  //final notifier = ref.watch(routerProvider).configuration;
  final isLocked = ref.watch(lockScreenProvider.notifier).state;

  return GoRouter(
      routes: [
        redirectRootRoute,
        homeShellRoute,
        /*StatefulShellRoute(
          builder: (context, state, navigationShell) {
            final preload = state.extra as bool? ?? false;

            return SharedAppData(
                child: AppBarConnection(
                    preload: preload,
                    child: AdminShell(navigationShell: navigationShell)));
          },
          pageBuilder: (context, state, child) {
            final preload = state.extra as bool? ?? false;
            return NoTransitionPage(
                child: AppBarConnection(preload: preload, child: child));
          },
          branches: <StatefulShellBranch>[
            // Branche 1 : /home
            StatefulShellBranch(
                routes: homeShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/home',
                restorationScopeId: 'shell_branch_1'),
            // Branche 2 : /auth
            StatefulShellBranch(
                routes: authShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/auth',
                restorationScopeId: 'shell_branch_2'),
            // Branche 3 : /admin
            StatefulShellBranch(
                routes: adminShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/admin',
                restorationScopeId: 'shell_branch_3'),
            // Branche 3 : /support
            StatefulShellBranch(
                routes: supportShellRoute.routes,
                navigatorKey: _shellRouterKey,
                observers: [
                  appRouterObserver,
                  sentryNavigatorObserver,
                  observer
                ],
                preload: true,
                initialLocation: '/support',
                restorationScopeId: 'shell_branch_3'),
          ],
          navigatorContainerBuilder: (BuildContext context,
              StatefulNavigationShell navigationShell, List<Widget> children) {
            return Scaffold(
              body: navigationShell,
            );
          },
        ),*/
      ],
      redirect: (context, state) {
        final container = ProviderScope.containerOf(context);
        final init = container.read(appInitServiceProvider);
        if (init.isLoading || !init.hasValue || init.hasError) return '/splash';
        return null;
      },
      refreshListenable: ref.watch(routerRefreshStreamProvider),
      initialLocation: isLocked ? '/lockScreen' : '/home',
      debugLogDiagnostics: true,
      navigatorKey: rootRouterKey,
      observers: [observer, appRouterObserver, sentryNavigatorObserver],
      overridePlatformDefaultLocation: true,
      onException: (context, state, router) => GoExceptionHandler,
      requestFocus: true);
}
