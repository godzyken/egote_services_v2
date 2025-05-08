import 'dart:async';
import 'dart:developer' as developer;

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as log;
import 'package:sentry_flutter/sentry_flutter.dart';
//import 'package:log_tracking/log_tracking.dart' as fog;

class CustomLogger {
  final log.Logger _logger = log.Logger('CustomLogger');

  CustomLogger() {
    _logger.onRecord.listen((record) {
      // Envoi à Sentry
      Sentry.captureMessage(record.message);

      // Envoi à Datadog
      sendLogToDatadog(record.message);
    });
  }

  void info(String message) {
    _logger.info(message);
  }

  void warning(String message) {
    _logger.warning(message);
  }

  void severe(String message) {
    _logger.severe(message);
  }

  void sendLogToDatadog(String message) async {
    developer.log(message);
    developer.log(message, name: 'AppLogger');

    // Envoyer aussi à Sentry si prod ?
    if (kReleaseMode && Sentry.isEnabled) {
      unawaited(Sentry.captureMessage(message));
    }

    // Optionnel: tu peux ajouter un hook pour Datadog ici
    if (DatadogSdk.instance != null) {
      DatadogSdk.instance.logs?.createLogger(DatadogLoggerConfiguration(
        name: message,
      ));
    }
  }

/*  void initializeLogging() {
    fog.Log.init(
      saveToLocal: true,
      onInfo: (log) {
        // Envoi à Firebase Crashlytics
        FirebaseCrashlytics.instance.log("INFO: ${log.text}");
      },
      onWarning: (log) {
        // Envoi à Firebase Crashlytics
        FirebaseCrashlytics.instance.recordFlutterError(
          FlutterErrorDetails(
            exception: "WARNING: ${log.text}",
            stack: log.stackTrace,
          ),
          fatal: false,
        );
      },
      onError: (log) {
        // Envoi à Firebase Crashlytics
        FirebaseCrashlytics.instance.recordFlutterError(
          FlutterErrorDetails(exception: log.error, stack: log.stackTrace),
          fatal: true,
        );
      },
      onSendToServer: (LogInfoRequest request) async {
        // Envoi à votre serveur
      },
    );
  }*/
}
