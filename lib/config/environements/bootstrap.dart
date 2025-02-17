import 'package:egote_services_v2/config/providers.dart' as providers;
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;

import '../app_shared/images/assets_images.dart';
import '../providers.dart';
import '../providers/watchdog/datadog_config.dart';
import 'flavors.dart';

Future<ProviderContainer> bootstrap() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final binding = WidgetsFlutterBinding.ensureInitialized();

  binding
    ..deferFirstFrame()
    ..addPostFrameCallback((timeStamp) {
      final Element? context = binding.rootElement;
      if (context != null) {
        for (final asset in assetList.dependencies!.toList()) {
          precacheImage(AssetImage(asset.toString()), context);
        }
      }
      binding.allowFirstFrame();
    });

  await SentryFlutter.init(appRunner: () => appRunnerConfig(), (options) {
    options
      ..environment = 'dev'
      ..dsn =
          'https://8486e00ed99148aaa94a4b700ea4df50@o4505047063592960.ingest.us.sentry.io/4505047065427968'
      ..autoAppStart = true
      ..maxCacheItems
      ..enableAutoPerformanceTracing = true
      ..debug = true
      ..reportSilentFlutterErrors = true
      ..reportPackages = false
      ..sendDefaultPii = true
      ..serverName
      ..considerInAppFramesByDefault = true
      ..attachThreads = true
      ..attachScreenshot = true
      ..screenshotQuality = SentryScreenshotQuality.low
      ..maxRequestBodySize = MaxRequestBodySize.always
      ..maxResponseBodySize = MaxResponseBodySize.always
      ..tracesSampleRate = 1.0
      ..tracesSampler =
          (samplingContext) => tracesSamplerContext(samplingContext);
  });

  final sharedPreferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      localizationProvider.overrideWith(
          (ref) => MultiLang(ref.read(localeProvider).languageCode)),
      datadogConfigProvider.overrideWith((ref) => ref.future),
    ],
    observers: [
      if (F.appFlavor == Flavor.local) _Logger(),
    ],
  );

  final transaction =
      Sentry.startTransaction('processOrderBatch', 'task', bindToScope: true);

  try {
    await processOrderBatch(transaction);
  } catch (exception) {
    transaction.throwable = exception;
    transaction.status = const SpanStatus.internalError();
  } finally {
    await transaction.finish();
  }

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stacktrace.Trace) return stack.vmTrace;
    if (stack is stacktrace.Chain) return stack.toTrace().vmTrace;

    return stack;
  };

  try {
    const PartialStackFrame elementInflateWidget = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'Element',
        method: 'inflateWidget');
    const PartialStackFrame elementUpdateChild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'Element',
        method: 'updateChild');
    const PartialStackFrame elementRebuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'Element',
        method: 'rebuild');
    const PartialStackFrame componentElementPerformRebuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'ComponentElement',
        method: 'performRebuild');
    const PartialStackFrame componentElementFirstBuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'ComponentElement',
        method: '_firstBuild');
    const PartialStackFrame componentElementMount = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'ComponentElement',
        method: 'mount');
    const PartialStackFrame statefulElementFirstBuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'StatefulElement',
        method: '_firstBuild');
    const PartialStackFrame singleChildMount = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'SingleChildRenderObjectElement',
        method: 'mount');
    const PartialStackFrame statefulElementRebuild = PartialStackFrame(
        package: 'package:flutter/src/widgets/framework.dart',
        className: 'StatefulElement',
        method: 'performRebuild');

    const String replacementString = '...     Normal element mounting';
    FlutterError.addDefaultStackFilter(
        const RepetitiveStackFrameFilter(frames: <PartialStackFrame>[
      elementInflateWidget,
      elementUpdateChild,
      elementRebuild,
      componentElementPerformRebuild,
      componentElementFirstBuild,
      componentElementMount,
      statefulElementFirstBuild,
      singleChildMount,
      statefulElementRebuild,
    ], replacement: replacementString));
  } catch (exception, stacktrace) {
    await Sentry.captureException(
      exception,
      stackTrace: stacktrace,
    );
  } finally {
    transaction.finished;
  }

  await providers.initializeProvider(container);
  return container;
}

double? tracesSamplerContext(SentrySamplingContext samplingContext) {
  // Default to capturing everything
  var sampleRate = 1.0;

  // Adjust sampling logic based on the transaction context
  if (samplingContext.transactionContext.operation == 'http') {
    // If the operation is HTTP, capture 50% of the requests
    sampleRate = 0.5;
  } else if (samplingContext.transactionContext.origin == 'db') {
    // If it's a database operation, only capture 10% of those
    sampleRate = 0.1;
  }

  // You can also apply more complex logic here
  if (samplingContext.transactionContext.name.contains('critical')) {
    // Always capture critical transactions
    sampleRate = 1.0;
  }

  if (samplingContext.transactionContext.parentSamplingDecision?.sampleRate !=
      null) {
    sampleRate =
        samplingContext.transactionContext.parentSamplingDecision!.sampleRate!;
  }

  return sampleRate;
}

Future<void Function(Widget app)> appRunnerConfig() async {
  SentryWidgetsFlutterBinding.ensureInitialized();
  return runApp;
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    debugPrint('''{
      "provider": "${provider.name ?? provider.runtimeType}",
      "previousValue": "$previousValue",
      "newValue": "$newValue",
      }''');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    debugPrint('''{
      "provider": "${provider.name ?? provider.runtimeType}",
      "value": "$value",
      "container": "$container",
      }''');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    debugPrint('''{
      "provider": "${provider.name ?? provider.runtimeType}",
      "container": "$container",
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
      ..setMeasurement('ui.footerComponent.render', 1.3,
          unit: SentryMeasurementUnit.none)
      ..setMeasurement('localStorageRead', 4);
  } catch (exception) {
    innerSpan
      ..throwable = exception
      ..status = const SpanStatus.notFound();
  } finally {
    await innerSpan.finish();
  }
}
