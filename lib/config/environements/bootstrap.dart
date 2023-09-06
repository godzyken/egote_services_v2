import 'package:egote_services_v2/config/providers.dart' as providers;
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import '../providers.dart';
import 'flavors.dart';

Future<ProviderContainer> bootstrap() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final binding = WidgetsFlutterBinding.ensureInitialized();

  binding
    ..deferFirstFrame()
    ..addPostFrameCallback((timeStamp) {
      // final Element? context = binding.rootElement;
      // if (context != null) {
      //   for (final asset in assetList.dependencies!.toList()) {
      //     precacheImage(AssetImage(asset.toString()), context);
      //   }
      // }
      binding.allowFirstFrame();
    });

  await SentryFlutter.init((options) {
    options
      ..environment = 'dev'
      ..dsn =
          'https://0ee7fbe213ed4eeb9d8e2225896c1601@o573314.ingest.sentry.io/4505427558400000'
      ..autoAppStart = true
      ..maxCacheItems
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
      ..maxResponseBodySize = MaxResponseBodySize.always
      ..tracesSampleRate = 1.0
      ..tracesSampler = (samplingContext) =>
          samplingContext.transactionContext.parentSamplingDecision?.sampleRate;
  });

  final sharedPreferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      localizationProvider.overrideWith(
          (ref) => MultiLang(ref.read(localeProvider).languageCode)),
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
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;

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
  } catch (exception, stack_Trace) {
    await Sentry.captureException(
      exception,
      stackTrace: stack_Trace,
    );
  } finally {
    transaction.finished;
  }

  await providers.initializeProvider(container);
  return container;
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
