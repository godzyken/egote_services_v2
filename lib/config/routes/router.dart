import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/routes/app_router_observer.dart';
import 'package:egote_services_v2/config/routes/router_notifier.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/config/routes/sentry_navigator_observer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootRouterKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final _shellRouterKey = GlobalKey<NavigatorState>(debugLabel: 'shellRouterKey');

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

@riverpod
// ignore: prefer-static-class
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
      routes: [
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return SharedAppData(child: child);
          },
          observers: [AppRouterObserver(), sentryNavigatorObserver, observer],
          routes: notifier.routes,
          navigatorKey: _shellRouterKey,
        ),
      ],
      refreshListenable: notifier,
      initialLocation: HomeRoute.path,
      debugLogDiagnostics: true,
      navigatorKey: _rootRouterKey,
      observers: [observer]);
}
