import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class RiverpodPerformanceMonitor {
  final ProviderContainer container;
  final Map<String, DateTime> _startTimes = {};
  final Map<String, int> _executionTimes = {};

  RiverpodPerformanceMonitor(this.container);

  // Démarre un chronomètre pour un provider
  void startProviderTimer(ProviderBase provider) {
    final name = provider.name ?? provider.runtimeType.toString();
    _startTimes[name] = DateTime.now();
  }

  // Arrête le chronomètre et calcule le temps écoulé
  void stopProviderTimer(ProviderBase provider, dynamic value) {
    final name = provider.name ?? provider.runtimeType.toString();
    final startTime = _startTimes.remove(name);
    if (startTime != null) {
      final duration = DateTime.now().difference(startTime).inMilliseconds;
      _executionTimes[name] = duration;

      _logPerformance(name, duration, value);
    }
  }

  // Envoie des logs de performance dans l'UI
  void _logPerformance(String name, int duration, dynamic value) {
    // Pour debug local, tu peux loguer dans la console ou l'UI
    developer
        .log('Provider $name executed in $duration ms with result: $value');

    // Tu peux aussi capturer ces logs dans Sentry ou Datadog
    try {
      Sentry.addBreadcrumb(
        Breadcrumb(
          message: 'Provider $name executed in $duration ms',
          category: 'performance',
          data: {'result': value.toString()},
          level: SentryLevel.info,
        ),
      );
    } catch (e, stackTrace) {
      Sentry.captureException('capture sentry & datadog error : $e',
          stackTrace: stackTrace, withScope: (scope) {
        scope.setTag('env', 'development');
        scope.extra;
        scope.user;
        scope.transaction;
        scope.level;
        scope.contexts;
        scope.breadcrumbs;
        scope.span;
        scope.clearBreadcrumbs();
        scope.removeContexts('id');
      });
      developer.log('Erreur lors de l\'ajout du breadcrumb dans Sentry: $e');
    }
  }

  // Fonction pour obtenir les performances des providers
  Map<String, int> get providerExecutionTimes => _executionTimes;
}
