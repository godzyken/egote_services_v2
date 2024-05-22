import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';
import 'config/providers/watchdog/datadog_config.dart';

void main() async {
  F.appFlavor = Flavor.development;
  final configuration = DatadogConfiguration(
      clientToken: datadogConfigProvider
          .selectAsync((data) => AsyncValue.data(data.clientToken))
          .toString(),
      env: datadogConfigProvider
          .selectAsync((data) => AsyncValue.data(data.env))
          .toString(),
      site: DatadogSite.eu1,
      nativeCrashReportEnabled: true,
      loggingConfiguration: DatadogLoggingConfiguration(),
      rumConfiguration: DatadogRumConfiguration(
          applicationId: '99911285-5746-429f-8168-b7b05c9db5fb',
          sessionSamplingRate: 100.0,
          detectLongTasks: true,
          reportFlutterPerformance: true),
      firstPartyHosts: [
        datadogConfigProvider
            .selectAsync(
                (data) => AsyncValue.data(data.firstPartyHosts.toList()))
            .toString()
      ]);
  await DatadogSdk.runApp(
      configuration,
      TrackingConsent.granted,
      () async => runApp(UncontrolledProviderScope(
          container: await bootstrap(),
          child: SentryScreenshotWidget(child: const MyApp()))));
}

// @pragma(
//     'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) {
//     log("Native called background task: $task"); //simpleTask will be emitted here.
//     return Future.value(true);
//   });
// }
