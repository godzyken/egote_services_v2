import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as dart_logger;
import 'package:riverpod/riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Optional: only if you're using `firebase_dart`
tryInitFirebaseLogger() {
  try {
    // Vérifie si FirebaseDart est disponible

    dart_logger.Logger(printer: dart_logger.PrettyPrinter());
    // ignore: avoid_dynamic_calls
    dart_logger.Logger.addLogListener((record) {
      developer.log(
          '🔥 Firebase: ${record.level.name}: ${record.time}: ${record.message}');
    });
  } catch (_) {
    // Ignorer silencieusement si non supporté
  }
}

class Logger extends ProviderObserver {
  Logger() {
    tryInitFirebaseLogger();
  }

  final excludedProviders = <String>{
    'sharedPreferencesProvider',
    'localizationProvider',
  };

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    if (excludedProviders.contains(name) || previousValue == newValue) return;

    final logMessage = '''
🔄 Provider Updated:
  → Name     : $name
  → Previous : $previousValue
  → New      : $newValue
''';
    _log(logMessage);
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    _log('➕ Provider Added: $name → Value: $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    _log('🗑️ Provider Disposed: $name');
  }

  void _log(String message) {
    developer.log(message);
    developer.log(message, name: 'AppLogger');

    // Envoyer aussi à Sentry si prod ?
    if (kReleaseMode) {
      Sentry.captureMessage(message);
    }

    // Optionnel: tu peux ajouter un hook pour Datadog ici
    // DatadogSdk.instance.log(message);
  }
}
