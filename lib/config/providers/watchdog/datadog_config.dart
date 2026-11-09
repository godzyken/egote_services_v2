import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../environements/flavors.dart';

// --- NOTIFIERS (Riverpod 3 Syntax) ---

class TrackingConsentNotifier extends Notifier<TrackingConsent> {
  @override
  TrackingConsent build() {
    // Statut de suivi initial par défaut
    return TrackingConsent.pending;
  }

  void updateConsent(bool granted) {
    state = granted ? TrackingConsent.granted : TrackingConsent.notGranted;
  }

  void setConsent(TrackingConsent consent) {
    state = consent;
  }
}

final trackingConsentNotifierProvider =
    NotifierProvider<TrackingConsentNotifier, TrackingConsent>(
      TrackingConsentNotifier.new,
      name: 'TrackingConsentNotifierProvider',
    );

// --- PROVIDERS ---

final datadogInstanceProvider = Provider<DatadogSdk>(
  (ref) => DatadogSdk.instance,
  name: 'DatadogInstanceProvider',
);

final datadogConfigProvider = FutureProvider<DatadogConfiguration>((ref) async {
  F.appFlavor ??= Flavor.development;

  final env = await Environment.load();

  return DatadogConfiguration(
    clientToken: env.clientToken,
    env: F.appFlavor.toString(),
    site: DatadogSite.eu1,
    nativeCrashReportEnabled: !kIsWeb,
    loggingConfiguration: DatadogLoggingConfiguration(),
    rumConfiguration: DatadogRumConfiguration(
      sessionSamplingRate: 100.0,
      applicationId: env.applicationId,
      detectLongTasks: true,
      reportFlutterPerformance: true,
    ),
    firstPartyHosts: env.firstPartyHost,
  );
}, name: 'DatadogConfigProvider');

final datadogProvider = FutureProvider<DatadogSdk>((ref) async {
  final configuration = await ref.watch(datadogConfigProvider.future);
  final consent = ref.watch(trackingConsentNotifierProvider);
  final datadogSdk = ref.watch(datadogInstanceProvider);

  try {
    await datadogSdk.initialize(configuration, consent);

    if (consent == TrackingConsent.notGranted) {
      datadogSdk.clearAllData();
    }

    // Configuration des gestionnaires d'erreurs globalisés
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      datadogSdk.rum?.handleFlutterError(details);
      originalOnError?.call(details);
    };

    final platformOriginalOnError = PlatformDispatcher.instance.onError;
    PlatformDispatcher.instance.onError = (e, st) {
      datadogSdk.rum?.addErrorInfo(
        e.toString(),
        RumErrorSource.source,
        stackTrace: st,
      );
      return platformOriginalOnError?.call(e, st) ?? false;
    };

    // Initialisation du logger de test
    final logger = datadogSdk.logs?.createLogger(
      DatadogLoggerConfiguration(remoteLogThreshold: LogLevel.warning),
    );
    logger?.debug("A debug message.");
    logger?.info("Some relevant information?");
    logger?.warn("An important warning…");
    logger?.error("An error was met!");
  } catch (e, st) {
    if (kDebugMode) {
      print('Datadog Provider error: $e\n$st');
    }
  }

  return datadogSdk;
}, name: 'Initialisation de datadog provider');
