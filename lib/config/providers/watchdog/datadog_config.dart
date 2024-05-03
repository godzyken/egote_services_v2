import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../environements/flavors.dart';

final datadogProvider = FutureProvider<DatadogSdk>((ref) async {
  final configuration = ref.watch(datadogConfigProvider);
  final trackingConsent = ref.watch(trackingConsentProvider);
  final dogData = ref.watch(datadogInstanceProvider);
  if (dogData case final initDatadog) {
    if (trackingConsent.isGranted) {
      final consent = trackingConsent.changeAccessRight(true);
      await initDatadog.initialize(configuration, consent);
      return initDatadog;
    } else if (trackingConsent.isNotGranted) {
      final nonConsent = trackingConsent.changeAccessRight(false);
      await initDatadog.initialize(configuration, nonConsent);

      initDatadog.clearAllData();
      return initDatadog;
    }
  }

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
  return dogData;
}, dependencies: [
  datadogConfigProvider,
  datadogInstanceProvider,
  trackingConsentProvider
], name: 'Initialisation de datadog provider');

final datadogInstanceProvider =
    Provider<DatadogSdk>((ref) => DatadogSdk.instance);

final datadogConfigProvider = Provider<DatadogConfiguration>((ref) {
  F.appFlavor = Flavor.development;

  //
  // 724eebdc5988eb21aec8ddcbd1cee6ff
  //
  // a67cd81c-d62a-4681-b809-ea6f650205bf

  final config = DatadogConfiguration(
      clientToken: "pub8f8371ed662182de9c831bb02d76a453",
      env: F.appFlavor.toString(),
      site: DatadogSite.eu1,
      nativeCrashReportEnabled: true,
      flavor: F.appFlavor!.name,
      loggingConfiguration: DatadogLoggingConfiguration(),
      rumConfiguration: DatadogRumConfiguration(
        applicationId: "99911285-5746-429f-8168-b7b05c9db5fb",
      ),
      firstPartyHosts: ["zngannbhansflbwydrgw.supabase.co"]);
  return config;
});

final trackingConsentProvider = StateProvider<TrackingContentChangeNotifier>(
    (_) => TrackingContentChangeNotifier());

class TrackingContentChangeNotifier extends StateNotifier<bool> {
  final _trackingConsent = TrackingConsent.values;

  TrackingContentChangeNotifier() : super(false) {
    _init();
  }

  bool get isGranted => TrackingConsent.granted == _trackingConsent;

  bool get isNotGranted => TrackingConsent.notGranted == _trackingConsent;

  changeAccessRight(bool value) {
    state = value;
    if (state == true) _trackingConsent == isGranted;
    if (state == false) _trackingConsent == isNotGranted;
    return state;
  }

  _init() {
    _trackingConsent == TrackingConsent.pending;
    state == isNotGranted;
    changeAccessRight(state);
  }
}
