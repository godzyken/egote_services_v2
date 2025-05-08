import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart' as dart_logger;

import 'custom/custom_logger.dart';

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

  bool _shouldLog(String providerName) {
    return !excludedProviders.contains(providerName) &&
        !providerName.toLowerCase().contains('theme') &&
        !providerName.toLowerCase().contains('l10n');
  }

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
    if (_shouldLog(name)) CustomLogger().sendLogToDatadog(logMessage);
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    if (_shouldLog(name)) {
      CustomLogger()
          .sendLogToDatadog('➕ Provider Added: $name → Value: $value');
    }
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    if (_shouldLog(name)) {
      CustomLogger().sendLogToDatadog('🗑️ Provider Disposed: $name');
    }
  }
}
