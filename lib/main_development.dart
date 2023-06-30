import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';

void main() async {
  F.appFlavor = Flavor.development;
  runApp(UncontrolledProviderScope(
      container: await bootstrap(), child: const SentryScreenshotWidget(child: MyApp())));
}
