import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:isolate';

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_notification_handler.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/platform/platform_provider.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_provider.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:workmanager/workmanager.dart';

import '../../features/chat/application/services/notification_utils.dart';
import '../providers.dart' as providers;
import '../providers.dart';
import '../providers/firebase/firebase_providers.dart';
import '../providers/sentry/riverpod_performance_monitor.dart';
import '../providers/supabase/supabase_providers.dart';
import '../providers/watchdog/datadog_config.dart';
import '../providers/watchdog/datadog_service.dart';
import 'flavors.dart';

Future<Refreshable<Future<Supabase>>> initializeSupabase() async {
  return supabaseInitProvider.future;
}

Future<Refreshable<AppStateNotifier>> initializeFirebase() async {
  return appStateProvider.notifier;
}

Future<void> sentryInitBinding() async {
  await SentryService.initBinding();
}

Future<void> initializeSentry() async {
  await SentryService.initialize();
}

Future<void> sentryConfigureFlutterErrorHandling() async {
  await SentryService.configureFlutterErrorHandling();
}

Future<void> initializeWorkManager() async {
  try {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

    await Workmanager().registerOneOffTask(
      'id_unique',
      'simpleTask',
      initialDelay: Duration(seconds: 10),
      inputData: <String, dynamic>{'key': 'value'},
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

    await Workmanager().registerPeriodicTask(
      'id_unique',
      'simplePeriodicTask',
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      frequency: Duration(hours: 1),
    );
  } catch (e, stackTrace) {
    developer.log('Error initializing WorkManager: $e');
    await Sentry.captureException(e, stackTrace: stackTrace);
    await Workmanager().cancelAll();
  }
}

Future<void> initializeDatadog() async {
  try {} catch (e, stackTrace) {
    developer.log('Error initializing Datadog: $e');
    await Sentry.captureException(e, stackTrace: stackTrace);
  }
}

Future<void> flutterErrorFlow() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      Sentry.captureException(details.exception, stackTrace: details.stack);
    }
  };

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stacktrace.Trace) return stack.vmTrace;
    if (stack is stacktrace.Chain) return stack.toTrace().vmTrace;

    return stack;
  };
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

  flutterErrorFlow();
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
    developer.log("Task executed: $task");
    try {
      final bool result = await myTaskFunction(task);
      if (result == true) {
        final sharedPreferences = inputData?['sharedPreferences'];
        final totalExecutions = sharedPreferences.getInt('totalExecutions');
        sharedPreferences.setInt('totalExecutions', totalExecutions! + 1);

        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on MissingPluginException catch (e) {
      developer.log("Error in callbackDispatcher: $e");
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

Future<bool> myTaskFunction(String taskName) async {
  developer.log("Executing background task: $taskName");

  try {
    // Add your background work here
    // For example, a network request, database operation, etc.

    // Simulating a background task (you can replace it with your actual task logic)
    bool success = await performBackgroundTask();

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
Future<bool> performBackgroundTask() async {
  // Simulate success or failure of a background task.
  bool success =
      await initForegroundService(); // Replace with your actual task logic
  return success;
}

Future<bool> initForegroundService() async {
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: 'Egote Services',
    notificationText: 'Screen sharing is in progress',
    notificationImportance: AndroidNotificationImportance.max,
    notificationIcon: androidResource,
  );
  return await FlutterBackground.initialize(androidConfig: androidConfig);
}

AndroidResource get androidResource =>
    AndroidResource(name: 'ic_launcher_foreground', defType: 'drawable');

Future<ProviderContainer> bootstrap() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

  // Init services de fond (Sentry, Firebase, Supabase, WorkManager...)
  await Future.wait([
    initializeFirebase(),
    initializeSupabase(),
    initializeWorkManager(),
    sentryInitBinding(),
    initializeSentry(),
    sentryConfigureFlutterErrorHandling(),
    flutterErrorFlow(),
  ], eagerError: true);

  final bool isSentryEnabled = !kDebugMode && F.appFlavor != Flavor.local;

  // Init container avec overrides & observers
  final container = ProviderContainer(
    overrides: [
      appStreamProvider.overrideWith((ref) => Stream.value(0)),
      firebaseInitProvider.overrideWith((ref) async {
        await Future.delayed(Duration(seconds: 2));
        return await Firebase.initializeApp();
      }),
      userStreamProvider
          .overrideWith((ref) => FirebaseAuth.instance.authStateChanges()),
      supabaseInitProvider.overrideWith((ref) async {
        await Future.delayed(Duration(seconds: 2));
        return await Supabase.initialize(url: 'url', anonKey: 'anonKey');
      }),
      localizationProvider.overrideWith(
        (ref) => MultiLang(ref.read(localeProvider).languageCode),
      ),
      sharedPreferencesProvider.overrideWith((ref) async {
        await Future.delayed(Duration(seconds: 2));
        return await SharedPreferences.getInstance();
      }),
      firebaseNotificationHandlerProvider.overrideWith((ref) {
        return FirebaseNotificationHandler(
          ref: ref,
          notificationUtils: NotificationUtils(
            ref.read(flutterLocalNotificationsProvider),
            ref.read(sharedPrefsProvider),
          ),
        );
      }),
      datadogStreamProvider.overrideWith(
        (ref) => Stream.periodic(Duration(days: 1)),
      ),
      datadogServiceProvider.overrideWith(
        (ref) {
          final service = DatadogService();
          service.setRef(ref);
          service.init();

          return service;
        },
      ),
      platformProvider
          .overrideWith((ref) => ref.watch(targetPlatformProvider).value!),
    ],
    observers: [
      if (isSentryEnabled) SentryProviderObserver(enableSentryLogging: true),
      // DatadogObserver(datadogService: container.read(datadogServiceProvider)),
      if (F.appFlavor == Flavor.local || F.appFlavor == Flavor.development)
        _Logger(),
    ],
  );

  developer.log('🛠 ProviderContainer ready');

  // Configure Sentry avec des infos personnalisées
  Sentry.configureScope((scope) {
    final sp = container.read(sharedPrefsProvider);
    scope.setTag(
        'dark_mode', sp.prefs.getBool('dark_mode')?.toString() ?? 'null');
  });

  // Init custom Riverpod services ou autres providers
  await providers.initializeProvider(container);

  // Init Datadog avec accès au ref
  final datadogService = container.read(datadogServiceProvider);
  await datadogService.init();

  // Init RUM ou traces automatiques (facultatif)
  RiverpodPerformanceMonitor(container);

  // Déclenche quelques tests de flux Sentry
  unawaited(SentryService.trackComplexFlow());
  unawaited(SentryService.testSendMessage());

  developer.log("✅ bootstrap complete");

  return container;
}
