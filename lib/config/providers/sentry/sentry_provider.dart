import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryProviderObserver extends ProviderObserver {
  final bool enableSentryLogging;
  SentryProviderObserver({this.enableSentryLogging = true});

  final _ignoreProviders = <String>[
    'platformProvider',
    'sharedPreferencesProvider',
    'localizationProvider'
  ];

  final _criticalProvider = <String>[
    'firebaseInitProvider',
    'userStreamProvider',
    'supabaseInitProvider',
    'datadogStreamProvider',
  ];

  final _timings = <String, DateTime>{};

  bool _shouldIgnore(String name) => _ignoreProviders.contains(name);
  bool _shouldCritical(String name) => _criticalProvider.contains(name);

  void _logBreadcrumb(String message, String category,
      Map<String, dynamic> data, SentryLevel level) {
    if (!enableSentryLogging) return;
    Sentry.addBreadcrumb(Breadcrumb(
      message: message,
      category: category,
      data: data,
      level: level,
    ));
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();

    if (!enableSentryLogging || _shouldIgnore(name)) return;

    final start = _timings.remove(name);
    final duration =
        start != null ? DateTime.now().difference(start).inMilliseconds : null;

    _logBreadcrumb(
      'Provider updated: $name',
      'riverpod.provider',
      {
        if (duration != null) 'duration': duration.toString(),
        'previous_value': previousValue.toString(),
        'new_value': newValue.toString(),
      },
      SentryLevel.debug,
    );
  }

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    if (!enableSentryLogging || _shouldIgnore(name)) return;

    _timings[name] = DateTime.now();

    _logBreadcrumb(
      'Provider updated: $name',
      'riverpod.provider',
      {
        'value': value.toString(),
      },
      SentryLevel.debug,
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    if (!enableSentryLogging || _shouldIgnore(name)) return;

    _logBreadcrumb(
      'Provider updated: $name',
      'riverpod.provider',
      {},
      SentryLevel.debug,
    );
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();

    if (!enableSentryLogging) return;
    _logBreadcrumb(
      'Erreur dans provider: $name',
      'riverpod.error',
      {'error': error.toString()},
      SentryLevel.error,
    );

    if (_shouldCritical(name)) {
      Sentry.configureScope((scope) {
        scope.setTag('error_provider', name);
      });

      Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    }
  }
  //Astuce : tu peux aussi utiliser un bool enableSentryLogging pour activer ou désactiver dynamiquement.
}
