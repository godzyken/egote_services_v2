import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';
import 'config/providers/watchdog/custom/custom_stack_filter.dart';

void main() async {
  F.appFlavor = Flavor.development;

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final container = await bootstrap();

    runApp(UncontrolledProviderScope(
        container: container,
        child: SentryScreenshotWidget(child: EgoteApp())));
  }, (error, stack) async {
    // Gère les erreurs non capturées et applique le filtre de stack trace
    final stackFilter = CustomRepetitiveStackFrameFilter();
    final filteredStack = stackFilter.filter(stack.toString());

    developer.log('🛑 [Uncaught Error] $error');
    developer.log('🧹 [Filtered Stack Trace]\n$filteredStack');

    if (kReleaseMode) {
      await Sentry.captureException(error, stackTrace: stack);
    }
  });
}
