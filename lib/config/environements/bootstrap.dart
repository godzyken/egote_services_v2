import 'dart:developer' as dev;

import 'package:egote_services_v2/config/providers.dart' as providers;
import 'package:egote_services_v2/config/providers/talker/talker_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

import '../providers.dart';
import 'flavors.dart';

Future<ProviderContainer> bootstrap() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final binding = WidgetsFlutterBinding.ensureInitialized();

  binding
    ..deferFirstFrame()
    ..addPostFrameCallback((timeStamp) {
      binding.allowFirstFrame();
    });

  await SentryFlutter.init((options) {
    options
      ..environment = 'dev'
      ..dsn =
          'https://822eaa260b9c8726005d7acd9aa33f04@o4505047063592960.ingest.us.sentry.io/4512392327397376'
      ..maxCacheItems = 100
      ..enableAutoPerformanceTracing = true
      ..debug = true
      ..reportSilentFlutterErrors = true
      ..reportPackages = false
      ..sendDefaultPii = true
      ..considerInAppFramesByDefault = true
      ..attachThreads = true
      ..attachScreenshot = true
      ..screenshotQuality = SentryScreenshotQuality.low
      ..maxRequestBodySize = MaxRequestBodySize.always
      ..tracesSampleRate = 1.0
      ..tracesSampler = (samplingContext) =>
          samplingContext.transactionContext.parentSamplingDecision?.sampleRate;
  });

  final sharedPreferences = await SharedPreferences.getInstance();

  final talker = TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: kDebugMode,
      useHistory: true,
      maxHistoryItems: 200,
    ),
  );

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      talkerProvider.overrideWithValue(talker),
    ],
    observers: [
      TalkerRiverpodObserver(talker: talker),
      if (F.appFlavor == Flavor.local) _Logger(),
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
    const PartialStackFrame componentElementPerformRebuild = PartialStackFrame(
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
  } finally {
    transaction.finished;
  }

  await providers.initializeProvider(container);
  return container;
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
}

Future<void> processOrderBatch(ISentrySpan span) async {
  // span operation: task, span description: operation
  final innerSpan = span.startChild('task', description: 'operation');

  try {
    // omitted code
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
