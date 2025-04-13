import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../providers/watchdog/datadog_service.dart';

class AppRouterObserver extends NavigatorObserver {
  final DatadogService datadogService;
  AppRouterObserver({required this.datadogService});

  String? _previousRouteName;

  String _getRouteName(Route<dynamic> route) {
    return route.settings.name ?? route.runtimeType.toString();
  }

  @override
  void didStopUserGesture() {}

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Start User Gesture route: $route');
    final currentRouteName = _getRouteName(route);
    final previousRouteName = _getRouteName(previousRoute!);

    developer.log('Current Route Name: $currentRouteName');

    datadogService.startView(currentRouteName);
    datadogService.stopView(_previousRouteName ?? previousRouteName);
    _previousRouteName = currentRouteName;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    developer.log('Did Replace new Route: $newRoute');
    final newRouteName = _getRouteName(newRoute!);
    final oldRouteName = _getRouteName(oldRoute!);

    developer.log('New Route Name: $newRouteName');
    developer.log('Old Route Name: $oldRouteName');

    datadogService.stopView(oldRouteName);
    datadogService.startView(newRouteName);
    _previousRouteName = newRouteName;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Remove route: $route');
    final currentRouteName = _getRouteName(route);
    developer.log('Current Route Name: $currentRouteName');
    datadogService.stopView(currentRouteName);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Pop route: $route');
    final currentRouteName = _getRouteName(route);
    final previousRouteName =
        _getRouteName(previousRoute ?? ModalRoute.of(route.currentResult)!);

    developer.log('Current Route Name: $currentRouteName');

    datadogService.stopView(currentRouteName);
    datadogService.startView(_previousRouteName ?? previousRouteName);
    _previousRouteName = previousRouteName;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Push route: $route');
    final currentRouteName = _getRouteName(route);
    final previousRouteName =
        _getRouteName(previousRoute ?? ModalRoute.of(route.currentResult)!);

    developer.log('Current Route Name: $currentRouteName');

    datadogService.startView(currentRouteName);
    datadogService.stopView(_previousRouteName ?? previousRouteName);
    _previousRouteName = currentRouteName;
  }
}
