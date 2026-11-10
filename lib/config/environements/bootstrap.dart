import 'dart:developer' as dev;

import 'package:egote_services_v2/config/providers.dart' as providers;
import 'package:egote_services_v2/config/providers/talker/talker_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

import '../providers.dart';

Future<ProviderContainer> bootstrap() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.deferFirstFrame();

  SharedPreferences? sharedPreferences;
  Talker? talker;
  ProviderContainer? container;

  try {
    await SentryFlutter.init((options) {
      options
        ..environment = 'dev'
        ..dsn =
            'https://822eaa260b9c8726005d7acd9aa33f04@o4505047063592960.ingest.us.sentry.io/4512392327397376'
        ..maxCacheItems = 100
        ..enableAutoPerformanceTracing = true
        ..debug = kDebugMode
        ..reportSilentFlutterErrors = true
        ..reportPackages = false
        ..sendDefaultPii = true
        ..considerInAppFramesByDefault = true
        ..attachThreads = true
        ..attachScreenshot = true
        ..screenshotQuality = SentryScreenshotQuality.low
        ..maxRequestBodySize = MaxRequestBodySize.always
        ..tracesSampleRate = 1.0
        ..tracesSampler = (samplingContext) => samplingContext
            .transactionContext
            .parentSamplingDecision
            ?.sampleRate;
    });

    sharedPreferences = await SharedPreferences.getInstance();

    talker = TalkerFlutter.init(
      settings: TalkerSettings(
        enabled: true,
        useHistory: true,
        maxHistoryItems: 500,
        useConsoleLogs: true,
      ),
    );

    ErrorWidget.builder = (FlutterErrorDetails details) {
      debugPrint('ErrorWidget: ${details.exception}');
      return Material(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Erreur UI:\n${details.exception}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    };

    // Wire up global Flutter framework error handling to Talker
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      talker?.handle(details.exception, details.stack, 'Flutter UI Error');
      dev.log(
        '❌ [FlutterError] ${details.exception}',
        error: details.exception,
        stackTrace: details.stack,
      );
    };

    // Wire up global uncaught async/platform errors to Talker
    PlatformDispatcher.instance.onError = (error, stackTrace) {
      talker?.handle(error, stackTrace, 'Uncaught Platform/Async Error');
      dev.log('❌ [PlatformError] $error', error: error, stackTrace: stackTrace);
      return true;
    };

    container = ProviderContainer(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        talkerProvider.overrideWithValue(talker),
      ],
      observers: [
        TalkerRiverpodObserver(
          talker: talker,
          settings: const TalkerRiverpodLoggerSettings(
            enabled: true,
            printStateFullData: true,
            printProviderAdded: true,
            printProviderUpdated: true,
            printProviderDisposed: true,
            printProviderFailed: true,
          ),
        ),
        _Logger(),
      ],
    );

    final transaction = Sentry.startTransaction(
      'processOrderBatch',
      'task',
      bindToScope: true,
    );

    try {
      await processOrderBatch(transaction);
    } catch (exception) {
      transaction.throwable = exception;
      transaction.status = const SpanStatus.internalError();
    } finally {
      await transaction.finish();
    }

    FlutterError.demangleStackTrace = (StackTrace stack) {
      if (kIsWeb) return stack;
      if (stack is stack_trace.Trace) return stack.vmTrace;
      if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;

      return stack;
    };

    try {
      const PartialStackFrame elementInflateWidget = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'Element',
        method: 'inflateWidget',
      );
      const PartialStackFrame elementUpdateChild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'Element',
        method: 'updateChild',
      );
      const PartialStackFrame elementRebuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'Element',
        method: 'rebuild',
      );
      const PartialStackFrame componentElementPerformRebuild =
          PartialStackFrame(
            package: 'package:flutter/src/widgets/framework.dart',
            className: 'ComponentElement',
            method: 'performRebuild',
          );
      const PartialStackFrame componentElementFirstBuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'ComponentElement',
        method: '_firstBuild',
      );
      const PartialStackFrame componentElementMount = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'ComponentElement',
        method: 'mount',
      );
      const PartialStackFrame statefulElementFirstBuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'StatefulElement',
        method: '_firstBuild',
      );
      const PartialStackFrame singleChildMount = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'SingleChildRenderObjectElement',
        method: 'mount',
      );
      const PartialStackFrame statefulElementRebuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'StatefulElement',
        method: 'performRebuild',
      );

      const String replacementString = '...     Normal element mounting';
      FlutterError.addDefaultStackFilter(
        const RepetitiveStackFrameFilter(
          frames: <PartialStackFrame>[
            elementInflateWidget,
            elementUpdateChild,
            elementRebuild,
            componentElementPerformRebuild,
            componentElementFirstBuild,
            componentElementMount,
            statefulElementFirstBuild,
            singleChildMount,
            statefulElementRebuild,
          ],
          replacement: replacementString,
        ),
      );
    } catch (exception, stack_Trace) {
      await Sentry.captureException(exception, stackTrace: stack_Trace);
    }

    await providers.initializeProvider(container);
  } catch (e, st) {
    debugPrint('❌ [Bootstrap] Critical initialization error: $e\n$st');
    try {
      await Sentry.captureException(e, stackTrace: st);
    } catch (_) {}
  } finally {
    // GUARANTEE: Never leave the app stuck on a blank white screen on Web
    binding.allowFirstFrame();
  }

  return container ??
      ProviderContainer(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(
            sharedPreferences ?? (await SharedPreferences.getInstance()),
          ),
        ],
      );
}

base class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    dev.log('''
{
  "provider": "${context.provider.name ?? context.provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    dev.log(
      '❌ [Riverpod Provider Error] ${context.provider.name ?? context.provider.runtimeType}: $error',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

Future<void> processOrderBatch(ISentrySpan span) async {
  final innerSpan = span.startChild('task', description: 'operation');

  try {
    innerSpan
      ..startChild('_Logger()')
      ..setMeasurement('memoryUsed', 123, unit: SentryMeasurementUnit.none)
      ..setMeasurement(
        'ui.footerComponent.render',
        1.3,
        unit: SentryMeasurementUnit.none,
      )
      ..setMeasurement('localStorageRead', 4);
  } catch (exception) {
    innerSpan
      ..throwable = exception
      ..status = const SpanStatus.notFound();
  } finally {
    await innerSpan.finish();
  }
}
