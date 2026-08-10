import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/routes/app_router_observer.dart';
import 'package:egote_services_v2/config/routes/router_notifier.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/config/routes/sentry_navigator_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootRouterKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
final _shellRouterKey = GlobalKey<NavigatorState>(debugLabel: 'shellRouterKey');

/// Provider for the [GoRouter] instance
final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(appRouterNotifierProvider.notifier);

  // Here we assemble routes from different modules
  final allRoutes = [
    ...CoreModule().routes,
    // Add other modules here:
    // ...BatTrackModule().routes,
    // ...Compta4meModule().routes,
  ];

  return GoRouter(
    navigatorKey: _rootRouterKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: notifier,
    observers: [
      DatadogNavigationObserver(
        datadogSdk: DatadogSdk.instance,
        viewInfoExtractor: infoExtractor,
      ),
    ],
    routes: [
      ShellRoute(
        navigatorKey: _shellRouterKey,
        builder: (context, state, child) {
          return SharedAppData(child: child);
        },
        observers: [
          AppRouterObserver(),
          sentryNavigatorObserver,
        ],
        routes: allRoutes,
      ),
    ],
  );
});

RumViewInfo? infoExtractor(Route<dynamic> route) {
  final name = route.settings.name;
  if (name == 'my_named_route') {
    return RumViewInfo(
      name: 'MyDifferentName',
      attributes: {'extra_attribue': 'attribute_value'},
    );
  }
  return defaultViewInfoExtractor(route);
}
