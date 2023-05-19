import 'dart:developer' as developer;

import 'package:flutter/material.dart';

class AppRouterObserver extends NavigatorObserver {
/*  @override
  NavigatorState get navigator {

  }

  @override
  void didStopUserGesture() {

  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {

  }*/

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    developer.log('Did Replace new Route: $newRoute');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Remove route: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Pop route: $route');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log('Did Push route: $route');
  }
}
