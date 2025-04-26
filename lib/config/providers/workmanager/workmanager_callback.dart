import 'dart:developer' as developer;
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

import '../../providers.dart';
import '../watchdog/datadog_logger.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Exécute ici tes tâches background
    developer.log('🔁 WorkManager Task triggered: $task');
    developer.log('📦 Data received: $inputData');

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

const simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";
const rescheduledTaskKey = "be.tramckrijte.workmanagerExample.rescheduledTask";
const failedTaskKey = "be.tramckrijte.workmanagerExample.failedTask";
const simpleDelayedTask = "be.tramckrijte.workmanagerExample.simpleDelayedTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";
const simplePeriodic1HourTask =
    "be.tramckrijte.workmanagerExample.simplePeriodic1HourTask";

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
      Logger().providerDidFail(sharedPreferencesProvider, err,
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
