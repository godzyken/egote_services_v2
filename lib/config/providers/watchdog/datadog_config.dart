import 'dart:convert';
import 'dart:developer' as developer;

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/config/providers/watchdog/watchdog_logger_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../environements/flavors.dart';
import 'datadog_service.dart';

final datadogProvider = FutureProvider<DatadogSdk>((ref) async {
  final configuration = await ref.watch(datadogConfigProvider.future);
  final trackingConsent = ref.watch(trackingConsentProvider);
  final dogData = ref.watch(datadogInstanceProvider);

  final originalOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    dogData.rum?.handleFlutterError(details);
    originalOnError?.call(details);
  };
  final platformOriginalOnError = PlatformDispatcher.instance.onError;
  PlatformDispatcher.instance.onError = (e, st) {
    dogData.rum?.addErrorInfo(
      e.toString(),
      RumErrorSource.source,
      stackTrace: st,
    );
    return platformOriginalOnError?.call(e, st) ?? false;
  };
  final logger = dogData.logs?.createLogger(
    DatadogLoggerConfiguration(
      remoteLogThreshold: LogLevel.warning,
    ),
  );
  logger?.debug("A debug message.");
  logger?.info("Some relevant information?");
  logger?.warn("An important warning…");
  logger?.error("An error was met!");

  if (dogData case final initDatadog) {
    if (trackingConsent == TrackingConsent.pending) {
      try {
        final consent = trackingConsent;
        await initDatadog.initialize(configuration, consent);
        return initDatadog;
      } on FlutterError catch (e) {
        if (kDebugMode) {
          developer.log('Datadog Provider error: ${e.message}\n'
              'Datadog Provider error runtime Type: ${e.runtimeType}\n'
              'Datadog Provider error diagnostics: ${e.diagnostics}');
        }
      }
    } else {
      final nonConsent = trackingConsent;
      await initDatadog.initialize(configuration, nonConsent);

      initDatadog.clearAllData();
      return initDatadog;
    }
  }
  return dogData;
}, name: 'Initialisation de datadog provider');

final datadogInstanceProvider =
    Provider<DatadogSdk>((ref) => DatadogSdk.instance);

final datadogConfigProvider = FutureProvider<DatadogConfiguration>((ref) async {
  F.appFlavor = Flavor.development;

  final configFile = await rootBundle.loadString(F.envFileName, cache: false);
  final env =
      Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  final String clientToken = env.clientToken;
  final String environmentName = F.appFlavor.toString();

  final firstPartyHosts = env.firstPartyHost;
  final hostHeaders = {
    'example.com': {TracingHeaderType.b3},
    'myapi.names': {TracingHeaderType.tracecontext}
  };

  if (kDebugMode) {
    print('clientToken: $clientToken');
    print('environmentName: $environmentName');
    print('firstPartyHosts: $firstPartyHosts');
    print('hostHeaders: $hostHeaders');
  }

  final config = DatadogConfiguration(
      clientToken: clientToken,
      env: environmentName,
      site: DatadogSite.eu1,
      nativeCrashReportEnabled: true,
      batchSize: BatchSize.small,
      uploadFrequency: UploadFrequency.frequent,
      batchProcessingLevel: BatchProcessingLevel.low,
      firstPartyHosts: firstPartyHosts,
      firstPartyHostsWithTracingHeaders: hostHeaders,
      loggingConfiguration: DatadogLoggingConfiguration(),
      rumConfiguration: DatadogRumConfiguration(
        sessionSamplingRate: 100.0,
        applicationId: env.applicationId,
        detectLongTasks: true,
        reportFlutterPerformance: true,
        resourceEventMapper: (event) => event,
        actionEventMapper: (event) => event,
        viewEventMapper: (event) => event,
        errorEventMapper: (event) => event,
        traceSampleRate: 1.0,
        longTaskEventMapper: (event) => event,
        telemetrySampleRate: 100,
      ))
    ..additionalConfig['_dd.needsClearTextHttp'] = true;

  return config;
});

// final trackingConsentProvider = StateProvider<TrackingContentChangeNotifier>(
//     (_) => TrackingContentChangeNotifier());

final trackingConsentProvider =
    StateNotifierProvider<TrackingConsentNotifier, TrackingConsent>(
        (_) => TrackingConsentNotifier());

class TrackingConsentNotifier extends StateNotifier<TrackingConsent> {
  TrackingConsentNotifier() : super(TrackingConsent.pending) {
    _loadConsent();
  }

  Ref? _ref;

  Future<void> _loadConsent() async {
    final prefs = _ref?.watch(sharedPreferencesProvider).value;
    final consentString =
        prefs!.getString('trackingConsent') ?? 'notDetermined';
    state = TrackingConsent.values
        .firstWhere((e) => e.toString() == 'TrackingConsent.$consentString');
  }

  Future<void> _saveConsent() async {
    final prefs = _ref?.watch(sharedPreferencesProvider).value;
    await prefs!.setString('trackingConsent', state.toString().split('.').last);
  }

  // Met à jour l'état du consentement à "Granted"
  void grantConsent() {
    state = TrackingConsent.granted;
    _saveConsent();
  }

  // Met à jour l'état du consentement à "Denied"
  void denyConsent() {
    state = TrackingConsent.notGranted;
    _saveConsent();
  }

  // Réinitialise l'état à "NotDetermined" (par exemple, pour réinitialiser les préférences)
  void resetConsent() {
    state = TrackingConsent.pending;
    _saveConsent();
  }
}

class TelemetryState {
  final bool isConfigured;
  final String errorMessage;

  TelemetryState({this.isConfigured = false, this.errorMessage = ''});
}

class TelemetryNotifier extends StateNotifier<TelemetryState> {
  TelemetryNotifier(this.ref) : super(TelemetryState());

  Ref ref;

  Future<void> updateTelemetryConfiguration(
      String service, bool nativeCrashReportEnabled) async {
    try {
      final datadog = await ref.watch(datadogProvider.future);
      if (datadog case final DatadogSdk initDatadog) {
        initDatadog.platform
            .updateTelemetryConfiguration(service, nativeCrashReportEnabled);
      }
      state = TelemetryState(isConfigured: true);
    } catch (e) {
      state = TelemetryState(isConfigured: false, errorMessage: e.toString());
    }
  }
}

final telemetryProvider =
    StateNotifierProvider<TelemetryNotifier, TelemetryState>(
  (ref) => TelemetryNotifier(ref),
  dependencies: [datadogProvider, datadogInstanceProvider],
  name: 'Telemetry provider',
);
final datadogStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  final channel = EventChannel(
    'com.godzy.egote_services_v2/datadog',
    const StandardMethodCodec(),
    BackgroundIsolateBinaryMessenger.instance,
  );

  // Fermer le canal lors de la suppression du provider
  ref.onDispose(() {
    channel.receiveBroadcastStream('dispose');
  });

  // Écouter les messages du canal
  await for (final message in channel.receiveBroadcastStream()) {
    yield message;
  }
});

final MethodChannel channel = MethodChannel(
  'com.godzy.egote_services_v2/datadog/method',
  StandardMethodCodec(),
);

// Exemple d'appel de méthode
Future<void> invokeMethod() async {
  try {
    final result = await channel.invokeMethod('methodName', DataDogConfig);
    // Traitez le résultat ici
    channel.setMethodCallHandler(result);
    developer.log("hello from data config", name: "data config", error: result);
  } on PlatformException catch (e) {
    // Gérez les exceptions ici
    developer.log("hello from data config", name: "data config", error: e);
  }
}

mixin DataDogConfig {}

final watchdogLoggerProvider = Provider<WatchdogLogger>((ref) {
  final datadogService = ref.watch(datadogServiceProvider);
  return WatchdogLogger(datadogService: datadogService);
});
