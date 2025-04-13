import 'dart:developer' as developer;

import 'package:riverpod/riverpod.dart';
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
    Sentry.addBreadcrumb(
      Breadcrumb(
        message: 'Provider $name executed in $duration ms',
        category: 'performance',
        data: {'result': value.toString()},
        level: SentryLevel.info,
      ),
    );
  }

  // Fonction pour obtenir les performances des providers
  Map<String, int> get providerExecutionTimes => _executionTimes;
}
