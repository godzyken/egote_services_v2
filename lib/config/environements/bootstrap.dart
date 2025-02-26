import 'dart:developer' as developer;
import 'dart:io';
import 'dart:isolate';

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/app.dart';
import 'package:egote_services_v2/config/providers.dart' as providers;
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/platform/platform_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;
import 'package:workmanager/workmanager.dart';

import '../app_shared/images/assets_images.dart';
import '../providers.dart';
import '../providers/watchdog/datadog_config.dart';
import 'flavors.dart';

Future<ProviderContainer> bootstrap() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final binding = SentryWidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher);

  await Future.wait(
      [
        Future.delayed(const Duration(seconds: 2)),
        runTaskInIsolate(),
        callbackDispatcher(),
        providerTaskIsolate(),
      ]..clear(),
      eagerError: true, cleanUp: (successValue) {
    binding
      ..deferFirstFrame()
      ..createSceneBuilder()
      ..debugShowWidgetInspectorOverride = true
      ..addPostFrameCallback((timeStamp) {
        final Element? context = binding.rootElement;
        if (context != null) {
          for (final asset in assetList.dependencies!.toList()) {
            precacheImage(AssetImage(asset.toString()), context,
                onError: (error, stacktrace) => ErrorWidget(error.toString()));
          }
        }
        binding.allowFirstFrame();
        successValue;
      });
  });

  await SentryFlutter.init(
      appRunner: () => runApp(const ProviderScope(child: EgoteApp())),
      (options) {
    options.dsn =
        'https://8486e00ed99148aaa94a4b700ea4df50@o4505047063592960.ingest.us.sentry.io/4505047065427968';

    options.beforeCaptureScreenshot = (event, hint, bool isOn) {
      event.tags?['app_version'] = '1.0.0';
      if (isOn) {
        // Ajouter des informations supplémentaires dans l'événement
        event.tags!['background'] =
            'App is in foreground'; // Exemple d'état du fond
        return false;
      } else {
        event.tags!['background'] =
            'App is in background'; // Exemple d'état du fond
        return true;
      }
    };

    options.beforeCaptureViewHierarchy = (event, hint, bool isOn) {
      if (FlutterBackground.isBackgroundExecutionEnabled) {
        event.tags?['background'] =
            'App is in background'; // Exemple d'état du fond
        return true;
      } else {
        event.tags?['background'] =
            'App is in foreground'; // Exemple d'état du fond
        return false;
      }
    };

    options.beforeSend = (event, hint) {
      event.tags?['app_version'] = '1.0.0';
      return event;
    };
    options.tracesSampleRate = 1.0;
    options.tracesSampler = (samplingContext) {
      // Vous pouvez baser votre logique de sampling sur le contexte de la trace
      if (samplingContext.transactionContext.name == 'importantOperation') {
        return 1.0; // 100% de probabilité d'échantillonner
      } else {
        return 0.0; // 0% pour les autres opérations
      }
    };

    options.debug = true;
    options.attachStacktrace = true;
    options.enableNativeCrashHandling = true;
    options.maxBreadcrumbs = 100;
    options.environment = 'development';
  });

  final container = ProviderContainer(
    overrides: [
      firebaseInitProvider.overrideWith((ref) => ref.future),
      localizationProvider.overrideWith(
          (ref) => MultiLang(ref.read(localeProvider).languageCode)),
      datadogConfigProvider.overrideWith((ref) => ref.future),
      backgroundTaskProvider.overrideWith((ref) => BackgroundTaskNotifier()),
      sharedPreferencesProvider.overrideWith((ref) => ref.future),
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
  } on SentryException catch (exception, stacktrace) {
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

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    if (previousValue == newValue) {
      return;
    }

    if (provider.name == 'sharedPreferencesProvider') {
      return;
    }

    if (provider.name == 'localizationProvider') {
      return;
    }

    if (provider.name == 'datadogConfigProvider') {
      DatadogSdk.instance.addUserExtraInfo({
        'message': 'Provider updated: ${provider.name}',
        'status': DatadogSdk.instance.sdkVerbosity,
        'attributes': {
          'previous_value': previousValue.toString(),
          'new_value': newValue.toString(),
        },
      });
      return;
    }

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

class CustomRepetitiveStackFrameFilter {
  final List<String> _previousStackFrames = [];

  String filter(String stackTrace) {
    // Divise la stack trace en lignes (frames)
    List<String> stackFrames = stackTrace.split('\n');

    // Liste pour conserver les frames uniques
    List<String> filteredStackFrames = [];

    for (var frame in stackFrames) {
      if (!_previousStackFrames.contains(frame)) {
        filteredStackFrames.add(frame);
        _previousStackFrames.add(frame);
      }
    }

    // Retourne la stack trace filtrée
    return filteredStackFrames.join('\n');
  }

  bool matchFrames(List<String> frames1, List<String> frames2) {
    if (frames1.length != frames2.length) {
      return false;
    }
    for (int i = 0; i < frames1.length; i++) {
      if (frames1[i] != frames2[i]) {
        return false;
      }
    }
    return true;
  }
}

Future<void> runTaskInIsolate() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(runHeavyTask, receivePort.sendPort);
  final result = await receivePort.first;
  developer.log('run isolate: $result');
  receivePort.close();

  var res =
      await compute((message) => expensiveComputation(message), 'message');

  developer.log('run compute: $res');
  sleep(const Duration(seconds: 1));

  return;
}

int expensiveComputation(String data) {
  return data.length;
}

void runHeavyTask(SendPort sendPort) {
  // Effectuer une tâche lourde ici
  sendPort.send('Task completed');
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
Future<void> callbackDispatcher() async {
  Workmanager().executeTask((task, inputData) {
    try {
      developer.log("Task $task executed with inputData: $inputData");

      String value = inputData!['key'];

      // Effectuez votre traitement ici
      developer.log("Value from inputData: $value");

      switch (task) {
        case Workmanager.iOSBackgroundTask:
          stderr.writeln("The iOS background fetch was triggered");
          break;
      }

      return Future.value(true);
    } catch (e) {
      developer.log("Error dans la tache de fond: $e");
      return Future.value(false);
    }
  });

  Workmanager().registerOneOffTask("1", "simpleTask",
      initialDelay: Duration(seconds: 10),
      inputData: <String, dynamic>{'key': 'value'},
      constraints: Constraints(
          networkType: NetworkType.connected,
          requiresBatteryNotLow: true,
          requiresCharging: true,
          requiresDeviceIdle: true,
          requiresStorageNotLow: true));

  Workmanager().registerPeriodicTask(
    "periodic-task-identifier",
    "simplePeriodicTask",
// When no frequency is provided the default 15 minutes is set.
// Minimum frequency is 15 min. Android will automatically change your
// frequency to 15 min if you have configured a lower frequency.
    frequency: Duration(minutes: 15),
  );

  BackgroundTaskNotifier().setTaskStarted((details) => FlutterErrorDetails(
      exception: details.exception,
      stack: details.stack,
      library: details.library,
      informationCollector: details.informationCollector,
      context: details.context,
      silent: details.silent,
      stackFilter: details.stackFilter));
}

Future<void> providerTaskIsolate() async {
  Ref? ref;
  Workmanager().executeTask((task, inputData) async {
    developer.log(
        "Native called background task: $task"); //simpleTask will be emitted here.

    int? totalExecutions;
    final sharedPreferences = ref!.read(sharedPreferencesProvider).value;

    try {
      totalExecutions = sharedPreferences?.getInt('totalExecutions');
      ref
          .read(sharedPreferencesProvider)
          .value!
          .setInt('totalExecutions', totalExecutions! + 1);
    } on IsolateSpawnException catch (err) {
      _Logger().providerDidFail(sharedPreferencesProvider, err,
          StackTrace.fromString(err.message), ref.container);
    }

    return Future.value(true);
  });

  Workmanager().registerOneOffTask("1", "background_task",
      inputData: <String, dynamic>{'key': 'value'},
      backoffPolicy: BackoffPolicy.exponential,
      backoffPolicyDelay: Duration(seconds: 30),
      initialDelay: Duration(seconds: 10)) as BackgroundTaskNotifier;
}
