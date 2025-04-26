import 'dart:async';
import 'dart:developer' as developer;
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_notification_handler.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/platform/platform_provider.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_provider.dart';
import 'package:egote_services_v2/config/providers/watchdog/custom/filtered_error_logger_observer.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;

import '../../features/chat/application/services/notification_utils.dart';
import '../providers.dart' as providers;
import '../providers.dart';
import '../providers/customer/shared_prefs_provider.dart';
import '../providers/launcherconfig/environment_provider.dart';
import '../providers/sentry/riverpod_performance_monitor.dart';
import '../providers/watchdog/datadog_config.dart';
import '../providers/watchdog/datadog_logger.dart';
import '../providers/watchdog/datadog_service.dart';
import '../services/app_init_service.dart';
import 'flavors.dart';

Future<void> initializeServices(ProviderContainer container) async {
  // Init services de fond (FlutterErrorFlow...)
  try {
    developer.log('🛠 Initializing background services...');

    // Initialize services asynchronously and handle errors individually
    await Future.wait([
      _initializeService('Flutter Error Flow Handling', flutterErrorFlow()),
    ], eagerError: true);

    developer.log("✅ All services initialized successfully.");
  } catch (e, stackTrace) {
    // Catch any unhandled error and log it into Sentry and print to the console
    developer.log('Error during bootstrap: $e',
        error: e, stackTrace: stackTrace);
    Sentry.captureException(e, stackTrace: stackTrace);
    rethrow; // Rethrow the error to allow higher-level handling
  }
}

Future<void> _initializeService(
    String serviceName, Future<void> serviceFuture) async {
  final stopwatch = Stopwatch()..start();
  try {
    developer.log('🛠 Initializing service: [$serviceName]...');
    await serviceFuture;
    stopwatch.stop();
    developer.log('✅ Service [$serviceName] initialized successfully.');
    developer.log('⏱ [$serviceName] initialized in ${stopwatch.elapsed}');
  } catch (e, stackTrace) {
    // Handle errors for each specific service
    developer.log('❌ Error initializing $serviceName: $e',
        error: e, stackTrace: stackTrace);
    Sentry.captureException(e, stackTrace: stackTrace);
    throw Exception(
        'Failed to initialize $serviceName'); // Rethrow with more context
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

/// Wrapper pour transmettre le [SendPort] + le [RootIsolateToken]
class SendPortWrapper {
  final SendPort port;
  final ui.RootIsolateToken token;
  SendPortWrapper(this.port, this.token);
}

Future<void> runTaskInIsolate() async {
  final receivePort = ReceivePort();

  final rootToken = ui.RootIsolateToken.instance!;
  final wrapper = SendPortWrapper(receivePort.sendPort, rootToken);

  await Isolate.spawn<SendPortWrapper>(runHeavyTask, wrapper);

  final result = await receivePort.first;
  developer.log('run isolate: $result');
  receivePort.close();

  var res =
      await compute((message) => expensiveComputation(message), 'message');

  developer.log('run compute: $res');
  await Future.delayed(const Duration(seconds: 1));
}

int expensiveComputation(String data) {
  return data.length;
}

void runHeavyTask(SendPortWrapper wrapper) async {
  // Effectuer une tâche lourde ici
  BackgroundIsolateBinaryMessenger.ensureInitialized(wrapper.token);

  final result = 'Task completed';
  wrapper.port.send(result);
}

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final bool isSentryEnabled = !kDebugMode && F.appFlavor != Flavor.local;

  final (flavor, env) = await EnvironmentReader.load(F.appFlavor);
  developer.log('👀 Loaded Flavor: $flavor');

  final observers = buildObservers();

  final providerOverrides = await buildProviderOverrides(env);

  // Init container avec overrides & observers
  final container = ProviderContainer(
    overrides: providerOverrides,
    observers: observers,
  );

  developer.log('🛠 ProviderContainer ready');

  // Lancer AppInitService (Firebase/Supabase/Sentry)
  await container.read(appInitServiceProvider.future);

  // Init custom Riverpod services ou autres providers
  await providers.initializeProvider(container);

  // Init Datadog avec accès au ref
  final datadogService = container.read(datadogServiceProvider);
  await datadogService.init();

  // Init RUM ou traces automatiques (facultatif)
  RiverpodPerformanceMonitor(container);

  // Init services de fond (Sentry, Firebase, Supabase, WorkManager...)
  await initializeServices(container);
  // Init Sentry avec accès au ref

  developer.log("✅ bootstrap complete");

  return container;
}

List<ProviderObserver> buildObservers() {
  return [
    SentryProviderObserver(enableSentryLogging: F.appFlavor != Flavor.local),
    if (kDebugMode) Logger(),
    if (kDebugMode) FilteredErrorLoggerObserver(),
  ];
}

Future<List<Override>> buildProviderOverrides(Environment env) async {
  return [
    environmentProvider.overrideWithValue(env),
    appStreamProvider.overrideWith((ref) => Stream.value(0)),
    localizationProvider.overrideWith(
      (ref) => MultiLang(ref.read(localeProvider).languageCode),
    ),
    sharedPreferencesProvider.overrideWith((ref) async {
      return await SharedPreferences.getInstance();
    }),
    firebaseNotificationHandlerProvider.overrideWith((ref) {
      return FirebaseNotificationHandler(
        ref: ref,
        notificationUtils: NotificationUtils(
          ref.read(flutterLocalNotificationsProvider),
          ref.read(sharedPrefsAsyncNotifierProvider).requireValue,
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
        .overrideWith((ref) => ref.watch(targetPlatformProvider).value!)
  ];
}
