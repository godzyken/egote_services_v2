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
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;
import 'package:workmanager/workmanager.dart';

import '../app_shared/images/assets_images.dart';
import '../providers.dart';
import '../providers/watchdog/datadog_config.dart';
import 'flavors.dart';

Future<ProviderContainer> bootstrap() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final binding = SentryWidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
/*  await Workmanager().initialize(callbackDispatcher);*/
  Workmanager().registerOneOffTask(
    'id_unique',
    'simpleTask',
    initialDelay: Duration(seconds: 10),
    inputData: <String, dynamic>{'key': 'value'},
    existingWorkPolicy: ExistingWorkPolicy.replace,
  );

  await Future.wait(
      [
        Future.delayed(const Duration(seconds: 2)),
        runTaskInIsolate(),
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

    options.beforeSend = (event, hint) {
      event.tags?['app_version'] = '1.0.0';
      return event;
    };
    options.tracesSampleRate = 1.0;
    options.tracesSampler = (samplingContext) {
      if (samplingContext.transactionContext.name == 'importantOperation') {
        return 1.0;
      } else {
        return 0.0;
      }
    };

    options.debug = true;
    options.attachStacktrace = true;
    options.enableAutoSessionTracking = true;
    options.enableNativeCrashHandling = true;
    options.maxBreadcrumbs = 100;
    options.environment = 'development';
    options.sendDefaultPii = true;
    options.experimental.replay.sessionSampleRate = 1.0;
    options.experimental.replay.onErrorSampleRate = 1.0;
  });

  await Sentry.captureMessage('message de sentry: hello world',
      level: SentryLevel.fatal, withScope: (p0) => p0.user!.name);

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

const simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";
const rescheduledTaskKey = "be.tramckrijte.workmanagerExample.rescheduledTask";
const failedTaskKey = "be.tramckrijte.workmanagerExample.failedTask";
const simpleDelayedTask = "be.tramckrijte.workmanagerExample.simpleDelayedTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";
const simplePeriodic1HourTask =
    "be.tramckrijte.workmanagerExample.simplePeriodic1HourTask";
@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    developer.log("Native called background task: $task");

    int? totalExecutions;
    final sharedPreference = await SharedPreferences.getInstance();

    try {
      totalExecutions = sharedPreference.getInt("totalExecutions");
      sharedPreference.setInt(
          "totalExecutions", totalExecutions == null ? 1 : totalExecutions + 1);

      developer.log("Task $task executed with inputData: $inputData");

      String value = inputData!['key'];

      // Effectuez votre traitement ici
      developer.log("Value from inputData: $value");

      switch (task) {
        case simpleTaskKey:
          developer.log("$simpleTaskKey was executed. inputData = $inputData");
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("test", true);
          developer.log("Bool from prefs: ${prefs.getBool("test")}");
          return myTaskFunction(task);
        case rescheduledTaskKey:
          final key = inputData['key']!;
          final prefs = await SharedPreferences.getInstance();
          if (prefs.containsKey('unique-$key')) {
            developer.log('has been running before, task is successful');
            return true;
          } else {
            await prefs.setBool('unique-$key', true);
            developer.log('reschedule task');
            return false;
          }
        case failedTaskKey:
          developer.log('failed task');
          return Future.error('failed');
        case simpleDelayedTask:
          developer.log("$simpleDelayedTask was executed");
          break;
        case simplePeriodicTask:
          developer.log("$simplePeriodicTask was executed");
          break;
        case simplePeriodic1HourTask:
          developer.log("$simplePeriodic1HourTask was executed");
          break;
        case Workmanager.iOSBackgroundTask:
          developer.log("The iOS background fetch was triggered");
          Directory? tempDir = await getTemporaryDirectory();
          String? tempPath = tempDir.path;
          developer.log(
              "You can access other plugins in the background, for example Directory.getTemporaryDirectory(): $tempPath");
          stderr.writeln('the iOS background fetch was triggered');
          break;
      }

      return Future.value(true);
    } catch (e) {
      developer.log("Error dans la tache de fond: $e");
      return Future.value(false);
    }
  });
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
      initialDelay: Duration(seconds: 10));
}

/*
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
*/

/*BackgroundTaskNotifier().setTaskStarted((details) => FlutterErrorDetails(
      exception: details.exception,
      stack: details.stack,
      library: details.library,
      informationCollector: details.informationCollector,
      context: details.context,
      silent: details.silent,
      stackFilter: details.stackFilter));*/
bool myTaskFunction(String taskName) {
  developer.log("Executing background task: $taskName");

  try {
    // Add your background work here
    // For example, a network request, database operation, etc.

    // Simulating a background task (you can replace it with your actual task logic)
    bool success = performBackgroundTask();

    if (success) {
      // If the task was successful, return true
      developer.log("Task $taskName completed successfully.");
      return true; // Success
    } else {
      // If the task failed, return false and the task will be retried
      developer.log("Task $taskName failed. Will retry.");
      return false; // Failure, to trigger retry
    }
  } catch (e) {
    // Catch any exceptions and return false to trigger retry
    developer.log("Error in task $taskName: $e");
    return false; // Failure, to trigger retry
  }
}

// Simulating a background task (you can replace this with your actual task logic)
bool performBackgroundTask() {
  // Simulate success or failure of a background task.
  return DateTime.now().second % 2 == 0; // Randomly return true or false
}
