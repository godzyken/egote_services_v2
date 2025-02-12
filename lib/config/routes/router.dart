import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/routes/app_router_observer.dart';
import 'package:egote_services_v2/config/routes/router_notifier.dart';
import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:egote_services_v2/config/routes/sentry_navigator_observer.dart';
import 'package:egote_services_v2/features/auth/presentation/views/widgets/app_bar_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
GoRouter router(Ref ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
      routes: [
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            final preload = state.extra as bool? ?? false;

            return SharedAppData(
                child: AppBarConnection(preload: preload, child: child));
          },
          observers: [AppRouterObserver(), sentryNavigatorObserver, observer],
          routes: notifier.routes,
          pageBuilder: (context, state, child) {
            final preload = state.extra as bool? ?? false;
            return NoTransitionPage(
                child: AppBarConnection(preload: preload, child: child));
          },
          navigatorKey: _shellRouterKey,
        ),
      ],
      refreshListenable: notifier,
      initialLocation: HomeRoute.path,
      debugLogDiagnostics: true,
      navigatorKey: _rootRouterKey,
      observers: [observer]);
}
