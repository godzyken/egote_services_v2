import 'dart:convert';

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../environements/flavors.dart';

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
    if (trackingConsent.mounted) {
      try {
        final consent = trackingConsent._trackingConsent.first;
        await initDatadog.initialize(configuration, consent);
        return initDatadog;
      } on FlutterError catch (e) {
        // TODO
        if (kDebugMode) {
          print('Datadog Provider error: $e');
        }
      }
    } else {
      final nonConsent = trackingConsent._trackingConsent.last;
      await initDatadog.initialize(configuration, nonConsent);

      initDatadog.clearAllData();
      return initDatadog;
    }
  }
  return dogData;
}, dependencies: [
  datadogConfigProvider,
  datadogInstanceProvider,
  trackingConsentProvider
], name: 'Initialisation de datadog provider');

final datadogInstanceProvider =
    Provider<DatadogSdk>((ref) => DatadogSdk.instance);

final datadogConfigProvider = FutureProvider<DatadogConfiguration>((ref) async {
  F.appFlavor = Flavor.development;

  //
  // 724eebdc5988eb21aec8ddcbd1cee6ff
  //
  // a67cd81c-d62a-4681-b809-ea6f650205bf
  final configFile = await rootBundle.loadString(F.envFileName, cache: false);
  final env =
      Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

  final config = DatadogConfiguration(
      clientToken: env.clientToken,
      env: F.appFlavor.toString(),
      site: DatadogSite.eu1,
      nativeCrashReportEnabled: true,
      loggingConfiguration: DatadogLoggingConfiguration(),
      rumConfiguration: DatadogRumConfiguration(
        applicationId: env.applicationId,
      ),
      firstPartyHosts: env.firstPartyHost);
  return config;
});

final trackingConsentProvider = StateProvider<TrackingContentChangeNotifier>(
    (_) => TrackingContentChangeNotifier());

class TrackingContentChangeNotifier
    extends StateNotifier<List<TrackingConsent>> {
  final _trackingConsent = TrackingConsent.values;

  TrackingContentChangeNotifier() : super(TrackingConsent.values) {
    _init();
  }

  changeAccessRight(bool value) {
    for (var c in state) {
      switch (value) {
        case false:
          c = TrackingConsent.notGranted;
          return c;
        case true:
          c = TrackingConsent.granted;
          return c;
        default:
          return c = state.last;
      }
    }
    return state.last == _trackingConsent.single;
  }

  _init() {
    changeAccessRight;
  }
}
