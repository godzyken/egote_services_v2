import 'package:egote_services_v2/config/providers.dart' as providers;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import '../app_shared/images/assets_images.dart';
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

  await SentryFlutter.init((options) {
    options
      ..environment = 'dev'
      ..dsn =
          'https://8486e00ed99148aaa94a4b700ea4df50@o4505047063592960.ingest.sentry.io/4505047065427968'
      ..autoAppStart = true
      ..maxCacheItems
      ..enableAutoPerformanceTracing = true
      ..tracesSampleRate = 1.0
      ..tracesSampler = (samplingContext) =>
          samplingContext.transactionContext.parentSamplingDecision?.sampleRate;
  });

  final container = ProviderContainer(
    overrides: [],
    observers: [if (F.appFlavor == Flavor.local) _Logger()],
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
    StackFilter? stackFilter;
    FlutterError.addDefaultStackFilter(stackFilter!);
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
