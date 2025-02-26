import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'config/environements/bootstrap.dart';
import 'config/environements/flavors.dart';

void main() async {
  F.appFlavor = Flavor.development;
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  runZonedGuarded(() async {
    runApp(UncontrolledProviderScope(
        container: await bootstrap(),
        child: SentryScreenshotWidget(child: EgoteApp())));
  }, (error, stack) async {
    // Gère les erreurs non capturées et applique le filtre de stack trace
    final stackTraceFilter = CustomRepetitiveStackFrameFilter();
    String filteredStack = stackTraceFilter.filter(stack.toString());

    // Affiche la stack trace filtrée dans la console (ou tu peux l'enregistrer dans un fichier ou serveur)
    if (kDebugMode) {
      developer.log('Erreur non capturée : $error');

      developer.log('Stack trace filtrée :\n$filteredStack');
    }
  });
}
