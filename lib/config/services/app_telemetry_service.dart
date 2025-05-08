import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/sentry/sentry_provider.dart';
import '../providers/watchdog/datadog_service.dart';

abstract class AppTelemetryService {
  bool get isEnabled;

  void log(String message) {
    if (isEnabled) {
      debugPrint('[Telemetry] $message');
    }
  }

  void logDebug(String message) {
    if (kDebugMode && isEnabled) debugPrint('[Telemetry] $message');
  }

  Future<void> trackError(dynamic error, [StackTrace? stackTrace]) async {}
  Future<void> trackEvent(String eventName,
      [Map<String, dynamic>? params]) async {}

  Future<T> trace<T>(String name, Future<T> Function() task) async {
    logDebug('📍 Tracing $name...');
    final start = DateTime.now();
    try {
      final result = await task();
      final duration = DateTime.now().difference(start);
      logDebug('✅ Traced $name in $duration');
      trackEvent('$name:success', {'duration': duration.inMilliseconds});
      return result;
    } catch (e, s) {
      logDebug(
          '❌ Failed to trace $name in ${DateTime.now().difference(start)}');
      await trackError(e, s);
      rethrow;
    }
  }
}

class TelemetryManager {
  final SentryService sentry;
  final DatadogService datadog;
  // Todo: Ajouter les autres services Mixpanel, Firebase Analytics, etc.

  TelemetryManager({
    required this.sentry,
    required this.datadog,
  });

  void trackAll(String event, [Map<String, dynamic>? params]) {
    if (sentry.isEnabled) sentry.trackEvent(event, params);
    if (datadog.isEnabled) datadog.trackEvent(event, params);
  }
}

mixin TelemetryMixin on AppTelemetryService {
  Future<T> traceTask<T>(
    String name,
    Future<T> Function() task, {
    Map<String, dynamic>? params,
  }) async {
    logDebug('📍 Tracing: $name...');
    final start = DateTime.now();
    try {
      final result = await task();
      final duration = DateTime.now().difference(start).inMilliseconds;
      await trackEvent('$name:success', {
        ...(params ?? {}),
        'duration': duration,
      });
      return result;
    } catch (e, s) {
      await trackError(e, s);
      rethrow;
    }
  }
}

extension TelemetryExtension on TelemetryManager {
  Future<T> trace<T>(
    String name,
    Future<T> Function() task, {
    Map<String, dynamic>? params,
  }) async {
    debugPrint('📍 Tracing: $name...');
    if (datadog.isEnabled) {
      return await datadog.trace(name, task);
    } else if (sentry.isEnabled) {
      return await sentry.trace(name, task);
    } else {
      // fallback
      final start = DateTime.now();
      final result = await task();
      final duration = DateTime.now().difference(start).inMilliseconds;
      debugPrint('[Telemetry] (noop trace) $name took ${duration}ms');
      return result;
    }
  }

  Future<void> trackError(dynamic error, [StackTrace? stackTrace]) async {
    if (datadog.isEnabled) {
      await datadog.trackError(error, stackTrace);
    } else if (sentry.isEnabled) {
      await sentry.trackError(error, stackTrace);
    }

    // Op
    debugPrint('📛 [TelemetryManager] Error: $error');
  }

  Future<void> trackEvent(String eventName,
      [Map<String, dynamic>? params]) async {
    if (sentry.isEnabled) {
      await sentry.trackEvent(eventName, params);
    }

    if (datadog.isEnabled) {
      await datadog.trackEvent(eventName, params);
    }

    debugPrint('📍 [TelemetryManager] Event: $eventName');
  }
}

extension RefSafeRun on Ref {
  Future<T> runSafe<T>(
    String label,
    Future<T> Function() task, {
    T? fallback,
    int maxRetries = 3,
  }) async {
    final telemetry = read(telemetryManagerProvider);

    int attempt = 0;

    while (true) {
      try {
        return await telemetry.trace(label, task);
      } catch (e, s) {
        if (e is PlatformException && e.code == 'channel-error') {
          if (attempt++ >= maxRetries) {
            await telemetry.trackError(e, s);
            if (fallback != null) return fallback;
            rethrow;
          }
          await Future.delayed(Duration(seconds: 2));
          continue;
        }

        await telemetry.trackError(e, s);
        if (fallback != null) return fallback;
        rethrow;
      }
    }
  }

  Future<T?> runSafeIsolate<T>(
    String label,
    Future<T> Function() task, {
    required T fallback,
    bool logError = true,
  }) async {
    final telemetry = read(telemetryManagerProvider);

    try {
      final result = await telemetry.trace(label, task);
      return result;
    } catch (e, st) {
      await telemetry.trackError(e, st);
      // Optionnel: envoyer à Datadog manuellement ici
      return fallback;
    }
  }
}

extension RefSafeDefaultExtension on Ref {
  Future<T> runSafeWithDefault<T>(
    String label,
    Future<T> Function() task, {
    required T fallback,
  }) async {
    final telemetry = read(telemetryManagerProvider);

    try {
      final result = await telemetry.trace(label, task);
      return result;
    } catch (e, st) {
      await telemetry.trackError(e, st);
      return fallback;
    }
  }
}

final telemetryManagerProvider = Provider<TelemetryManager>((ref) {
  final sentry = ref.watch(sentryServiceProvider);
  final datadog = ref.watch(datadogServiceProvider);
  return TelemetryManager(sentry: sentry, datadog: datadog);
});
