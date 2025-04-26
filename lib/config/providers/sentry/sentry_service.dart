import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;

import '../../environements/flavors.dart';
import '../../providers.dart';
import '../../services/app_telemetry_service.dart';
import '../customer/shared_prefs_provider.dart';
import 'i_sentry_service.dart';

class SentryService extends AppTelemetryService implements ISentryService {
  @override
  bool get isEnabled => switch (F.appFlavor) {
        Flavor.production => true,
        Flavor.development => true,
        Flavor.local => false,
      };

  @override
  Future<void> initialize() async {
    try {
      await SentryFlutter.init(
        _sentryOptions,
      );
      developer.log('Sentry initialisé avec succès');
    } on MissingPluginException catch (e, st) {
      developer.log('Erreur lors de l\'initialisation de Sentry: $e');
      await Sentry.captureException(e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<void> configureFlutterErrorHandling() async {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      if (kReleaseMode) exit(1);
    };

    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (stack is stacktrace.Trace) return stack.vmTrace;
      if (stack is stacktrace.Chain) return stack.toTrace().vmTrace;
      return stack;
    };
  }

  @override
  Future<void> initBinding() async {
    SentryWidgetsFlutterBinding.ensureInitialized();
  }

  @override
  void addBreadcrumb({
    required String message,
    String? category,
    Map<String, dynamic>? data,
    SentryLevel? level = SentryLevel.info,
  }) {
    Sentry.addBreadcrumb(Breadcrumb(
      message: message,
      category: category ?? 'custom',
      data: data,
      level: level,
      timestamp: DateTime.now().toUtc(),
    ));
    Sentry.configureScope((scope) {
      scope.setTag('app_flavor', F.appFlavor.name);
      scope.setTag('feature_flag', 'chat_enabled');
    });
  }

  @override
  void addPartialStackFrameFilters() {
    FlutterError.addDefaultStackFilter(
      const RepetitiveStackFrameFilter(
        frames: [
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'Element',
              method: 'inflateWidget'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'Element',
              method: 'updateChild'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'Element',
              method: 'rebuild'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'ComponentElement',
              method: 'performRebuild'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'ComponentElement',
              method: '_firstBuild'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'ComponentElement',
              method: 'mount'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'StatefulElement',
              method: '_firstBuild'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'SingleChildRenderObjectElement',
              method: 'mount'),
          PartialStackFrame(
              package: 'package:flutter/src/widgets/framework.dart',
              className: 'StatefulElement',
              method: 'performRebuild'),
        ],
        replacement: '...     Normal element mounting',
      ),
    );
  }

  @override
  Future<void> trackComplexFlow() async {
    final searchResults = [
      {'id': 1, 'name': 'Philipe Morice'},
      {'id': 2, 'name': 'Romain Roussel'},
      {'id': 3, 'name': 'Biggy man'},
    ];

    final context = {
      'user_id': '12312012',
      'search_results': searchResults,
    };

    ISentrySpan? transaction;

    try {
      final sentryId = await Sentry.captureMessage(
        'Sentry Message: Hello world',
        level: SentryLevel.fatal,
      );

      transaction = Sentry.startTransaction(
        'processOrderBatch',
        'task',
        bindToScope: true,
        customSamplingContext: context,
      );

      await Future.delayed(const Duration(seconds: 1));
      await _tryProcessOrderBatch(transaction);
      await _tryStackFilter(transaction);
      await _sendDataToSupabase(transaction);

      developer.log('Message envoyé à Sentry avec ID: $sentryId');
      await transaction.finish(status: SpanStatus.ok());
    } catch (e, st) {
      await transaction?.finish(status: SpanStatus.internalError());
      await Sentry.captureException(e, stackTrace: st);
    }
  }

  Future<void> _tryProcessOrderBatch(ISentrySpan transaction) async {
    final span = transaction.startChild('task.process',
        description: 'Traitement des commandes');
    try {
      await Future.delayed(const Duration(milliseconds: 500)); // simulation
      await span.finish(status: SpanStatus.ok());
    } catch (e, st) {
      span.throwable = e;
      await span.finish(status: SpanStatus.internalError());
      await Sentry.captureException(e, stackTrace: st);
    }
  }

  Future<void> _tryStackFilter(ISentrySpan transaction) async {
    final span = transaction.startChild('task.stacktrace',
        description: 'Ajout des filtres');
    try {
      addPartialStackFrameFilters();
      await span.finish(status: SpanStatus.ok());
    } catch (e, st) {
      await span.finish(status: SpanStatus.internalError());
      await Sentry.captureException(e, stackTrace: st);
    }
  }

  @override
  Future<void> traceTask({
    required String name,
    required Future<void> Function(ISentrySpan span) task,
    Map<String, dynamic>? samplingContext,
  }) async {
    final span = Sentry.startTransaction(name, 'task',
        bindToScope: true, customSamplingContext: samplingContext ?? {});
    try {
      await task(span);
      await span.finish(status: SpanStatus.ok());
    } catch (e, st) {
      span.throwable = e;
      await span.finish(status: SpanStatus.internalError());
      await Sentry.captureException(e, stackTrace: st);
    }
  }

  Future<void> _sendDataToSupabase(ISentrySpan transaction) async {
    final client = SentryHttpClient();
    final span = transaction.startChild('http.supabase',
        description: 'Requête Supabase');

    try {
      final response = await client.post(
        Uri.parse(
            'https://ltcnlgqoeunywzlewydv.supabase.co/rest/v1/avis_posts'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'name': 'Philipe Morice', 'message': 'I love to move it.'}),
      );

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        developer.log('POST ok: $decoded');

        if (decoded is List && decoded.isNotEmpty) {
          final id = decoded.first['id'];
          final getResp = await client.get(
            Uri.parse(
                'https://ltcnlgqoeunywzlewydv.supabase.co/rest/v1/avis_posts?id=eq.$id'),
          );
          if (getResp.statusCode == 200) {
            developer.log('GET ok: ${getResp.body}');
          } else {
            developer.log('GET erreur: ${getResp.statusCode}');
          }
        }
      } else {
        developer.log('POST erreur: ${response.statusCode}');
      }

      await span.finish(status: SpanStatus.ok());
    } catch (e, st) {
      await span.finish(status: SpanStatus.internalError());
      await Sentry.captureException(e, stackTrace: st);
    } finally {
      client.close();
    }
  }

  void Function(SentryFlutterOptions) get _sentryOptions =>
      (SentryFlutterOptions options) {
        options.release = 'egote-services@1.0.0+1';
        options.dist = '1';
        options.dsn =
            'https://0ee7fbe213ed4eeb9d8e2225896c1601@o573314.ingest.us.sentry.io/4505427558400000';
        options.tracesSampleRate = 1.0;
        options.debug = !kReleaseMode;
        options.environment = kReleaseMode ? 'production' : 'development';
        options.enableAutoPerformanceTracing = true;
        options.beforeCaptureScreenshot = (event, hint, bool isOn) {
          event.tags?['app_version'] = '1.0.0';
          if (isOn) {
            // Ajouter des informations supplémentaires dans l'événement
            event.tags!['background'] = 'App is in foreground';
            return false;
          } else {
            event.tags!['background'] = 'App is in background';
            return true;
          }
        };

        options.beforeCaptureViewHierarchy = (event, hint, bool isOn) {
          if (FlutterBackground.isBackgroundExecutionEnabled) {
            event.tags?['background'] = 'App is in background';
            return true;
          } else {
            event.tags?['background'] = 'App is in foreground';
            return false;
          }
        };

        options.beforeSendTransaction = (
          transaction,
        ) {
          transaction.tags?['app_version'] = '1.0.0';
          return transaction;
        };
        options.beforeSend = (SentryEvent event, dynamic hint) {
          event.tags?['app_version'] = '1.0.0';

          return event;
        };
        options.tracesSampleRate = 1.0;
        options.tracesSampler = (samplingContext) {
          final ctx = samplingContext.customSamplingContext;
          // If this is the continuation of a trace, just use that decision (rate controlled by the caller).
          ctx['parentSampled'] ??= 1.0;

          if ('/payment' == ctx['url']) {
            // These are important - take a big sample
            return 0.5;
          } else if ('/search' == ctx['url']) {
            // Search is less important and happen much more frequently - only take 1%
            return 0.01;
          } else if ('/health' == ctx['url']) {
            // The health check endpoint is just noise - drop all transactions
            return 0.0;
          } else {
            // Default sample rate
            return 0.1;
          }
        };

        options.debug = true;
        options.attachStacktrace = true;
        options.enableAutoSessionTracking = true;
        options.enableNativeCrashHandling = true;
        options.maxBreadcrumbs = 100;
        options.sendDefaultPii = true;
        options.experimental.replay.sessionSampleRate = 1.0;
        options.experimental.replay.onErrorSampleRate = 1.0;
        options.experimental.replay.quality = SentryReplayQuality.high;
      };

  @override
  Future<void> testSendMessage() async {
    unawaited(Sentry.captureMessage('Sentry Message: Hello world',
        level: SentryLevel.info));
  }

  @override
  Future<void> testSendException() async {
    unawaited(
        Sentry.captureException(Exception('Sentry Exception: Hello world')));
  }

  @override
  Future<void> trackError(dynamic error, [StackTrace? stackTrace]) async {
    if (!isEnabled) return;
    await Sentry.captureException(error, stackTrace: stackTrace);
  }

  @override
  Future<void> trackEvent(String eventName,
      [Map<String, dynamic>? params]) async {
    if (!isEnabled) return;
    Sentry.addBreadcrumb(Breadcrumb(
      message: eventName,
      category: 'event',
      data: params,
      level: SentryLevel.info,
    ));
  }

  @override
  Future<void> captureError(dynamic error, [StackTrace? stackTrace]) async {
    if (!isEnabled) return;
    developer.log('[Sentry] Error: $error');
    if (stackTrace != null) {
      await Sentry.captureException(error, stackTrace: stackTrace);
    } else {
      await Sentry.captureException(error);
    }
  }

  @override
  Future<void> wrapWithSentry(Future<void> Function() task) async {
    try {
      await task();
    } catch (e, st) {
      await captureError(e, st);
      rethrow;
    }
  }

  @override
  void setUserContext(String userId, String? email) {
    Sentry.configureScope((scope) {
      scope.setUser(SentryUser(id: userId, email: email));
    });
  }

  @override
  Future<void> configureSentry(ProviderContainer container) async {
    // Si Sentry est activé, configurez les informations dans le scope
    if (Sentry.isEnabled) {
      try {
        // Configurer le scope Sentry avec des informations personnalisées
        await Sentry.configureScope((scope) async {
          // Ajouter un tag indiquant si l'application est en mode sombre
          final sp = container.read(sharedPreferencesProvider);
          final darkMode = sp.value?.getBool('dark_mode')?.toString() ?? 'null';
          scope.setTag('dark_mode', darkMode);

          // Ajouter d'autres informations spécifiques comme l'ID utilisateur ou la langue
          final pref = container.read(sharedPrefsProvider).maybeWhen(
                data: (prefs) {
                  return prefs;
                },
                orElse: () => null,
              );
          final user = await pref?.getUser();
          if (user != null) {
            scope.setUser(SentryUser(
              id: user.id?.toString(),
              email: user.email,
              username: user.fullName,
            ));
          }

          // Vous pouvez également ajouter des informations spécifiques à l'environnement
          scope.setTag('app_version', '1.0.0'); // Exemple de version
          scope.setTag('app_flavor', F.appFlavor.toString());
        });

        developer.log("✅ Sentry scope configured");
      } catch (e, stackTrace) {
        // En cas d'erreur, vous pouvez capturer l'exception dans Sentry
        await Sentry.captureException(e, stackTrace: stackTrace);
        developer.log('Error while configuring Sentry: $e');
      }
    }
  }
}
