import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'datadog_service.dart';

class DatadogObserver extends ProviderObserver {
  final DatadogService datadogService;
  final bool enableSentry;

  DatadogObserver({required this.datadogService, this.enableSentry = true});

  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    // final log = container.read(datadogServiceProvider);
    // log.logInfo(
    //     '[Riverpod] Provider updated: ${provider.name ?? provider.runtimeType}',
    //     attributes: {
    //       'previousValue': previousValue.toString(),
    //       'newValue': newValue.toString(),
    //     });

    final name = provider.name ?? provider.runtimeType.toString();

    final log =
        '[Provider Updated] ${provider.name ?? provider.runtimeType}: $previousValue → $newValue';
    datadogService.trackEvent(log, {
      'name': name,
      'previousValue': previousValue.toString(),
      'newValue': newValue.toString()
    });

    datadogService.addUserAction('provider:$name');

    developer.log(log);
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    final name = provider.name ?? provider.runtimeType.toString();

    final log =
        '[Provider Added] ${provider.name ?? provider.runtimeType} => $value';
    datadogService
        .trackEvent(log, {'provider': name, 'value': value.toString()});
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    // final log = container.read(datadogServiceProvider);
    // log.logInfo(
    //   '[Riverpod] Provider disposed: ${provider.name ?? provider.runtimeType}',
    // );
    final name = provider.name ?? provider.runtimeType.toString();

    final log = '[Provider Disposed] ${provider.name ?? provider.runtimeType}';
    datadogService.trackEvent(log, {'provider': name, 'event': 'dispose'});
    developer.log(log);
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    final name = provider.name ?? provider.runtimeType.toString();

    datadogService.trackEvent('Provider did failed', {
      'stackTrace': stackTrace.toString(),
      'error': error.toString(),
      'provider': name,
    });

    if (enableSentry) {
      Sentry.captureException(error, stackTrace: stackTrace);
    }

    developer.log('Error in provider: $name — $error');
  }
}

class DatadogNavigationObserver extends NavigatorObserver {
  final DatadogService datadogService;
  DatadogNavigationObserver({required this.datadogService});

  String _getRouteName(Route<dynamic> route) {
    return route.settings.name ?? route.runtimeType.toString();
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _startViewForRoute(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute != null) _startViewForRoute(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) _startViewForRoute(previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // if (previousRoute != null) _startViewForRoute(previousRoute);
    // super.didRemove(route, previousRoute);
  }

  void _startViewForRoute(Route<dynamic> route) {
    final viewName = _getRouteName(route);
    datadogService.startView(viewName);
  }
}
