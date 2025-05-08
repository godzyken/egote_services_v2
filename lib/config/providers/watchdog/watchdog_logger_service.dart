import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'datadog_logger_helper.dart';
import 'datadog_service.dart';

enum AppLogLevel { debug, info, warning, error, fatal }

class WatchdogLogger {
  final DatadogService _datadogService;
  final bool enableSentry;
  final bool enableConsole;

  WatchdogLogger({
    required DatadogService datadogService,
    this.enableSentry = true,
    this.enableConsole = true,
  }) : _datadogService = datadogService;

  void log(
    String message, {
    AppLogLevel level = AppLogLevel.info,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? attributes,
  }) {
    // 🎯 Log to console
    if (enableConsole) {
      developer.log(
        '[${level.name.toUpperCase()}] $message',
        error: error,
        stackTrace: stackTrace,
      );

      // 🐶 Log to Datadog

      _datadogService.trackEvent(
        message,
        {
          if (attributes != null) ...attributes,
          if (error != null) 'error': error.toString(),
          if (stackTrace != null) 'stackTrace': stackTrace.toString(),
        },
      );
    }

    // 🧠 Capture to Sentry
    if (enableSentry &&
        level.index >= AppLogLevel.error.index &&
        error != null) {
      Sentry.captureException(error, stackTrace: stackTrace,
          withScope: (scope) {
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
    }
  }

  void debug(String msg, {Map<String, Object?>? attributes}) =>
      log(msg, level: AppLogLevel.debug, attributes: attributes);

  void info(String msg, {Map<String, Object?>? attributes}) =>
      log(msg, level: AppLogLevel.info, attributes: attributes);

  void warning(String msg,
          {Object? error,
          StackTrace? stack,
          Map<String, Object?>? attributes}) =>
      log(msg,
          level: AppLogLevel.warning,
          error: error,
          stackTrace: stack,
          attributes: attributes);

  void error(String msg, Object error, StackTrace? stack,
          {Map<String, Object?>? attributes}) =>
      log(msg,
          level: AppLogLevel.error,
          error: error,
          stackTrace: stack,
          attributes: attributes);

  void fatal(String msg, Object error, StackTrace? stack,
          {Map<String, Object?>? attributes}) =>
      log(msg,
          level: AppLogLevel.fatal,
          error: error,
          stackTrace: stack,
          attributes: attributes);
}

final datadogLoggerProvider = Provider((ref) {
  return DatadogLoggerHelper(ref.read(datadogServiceProvider));
});
