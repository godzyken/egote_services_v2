import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';

void main() async {
  F.appFlavor = Flavor.development;
  final configuration = DdSdkConfiguration(
      clientToken: 'pub8f8371ed662182de9c831bb02d76a453',
      env: F.appFlavor.toString(),
      site: DatadogSite.eu1,
      trackingConsent: TrackingConsent.granted,
      nativeCrashReportEnabled: true,
      flavor: F.appFlavor!.name,
      loggingConfiguration: LoggingConfiguration(),
      rumConfiguration: RumConfiguration(
        applicationId: '99911285-5746-429f-8168-b7b05c9db5fb',
      ),
      firstPartyHosts: ['zngannbhansflbwydrgw.supabase.co']);
  await DatadogSdk.runApp(configuration, () async {
    runApp(UncontrolledProviderScope(
        container: await bootstrap(),
        child: SentryScreenshotWidget(child: const MyApp())));
  });
}
