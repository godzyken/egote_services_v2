import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../environements/flavors.dart';
import '../providers.dart';
import '../providers/customer/shared_prefs_provider.dart';

Future<void> configureSentry(ProviderContainer container) async {
  // Si Sentry est activé, configurez les informations dans le scope
  if (Sentry.isEnabled) {
    try {
      // Configurer le scope Sentry avec des informations personnalisées
      await Sentry.configureScope((scope) async {
        // Ajouter un tag indiquant si l'application est en mode sombre
        final sp = container.read(sharedPreferencesProvider);
        final darkMode = sp.value?.getBool('dark_mode')?.toString() ?? 'null';
        scope.setTag('dark_mode', darkMode);

        // Ajouter d'autres informations spécifiques comme l'ID utilisateur ou la langue
        final pref = container.read(sharedPrefsProvider).maybeWhen(
            data: (prefs) {
              return prefs;
            },
            orElse: () => null);

        final cubeUser = await pref?.getUser();
        if (cubeUser != null) {
          scope.setUser(SentryUser(
            id: cubeUser.id?.toString(),
            email: cubeUser.email,
            username: cubeUser.fullName,
          ));
        }

        // Vous pouvez également ajouter des informations spécifiques à l'environnement
        scope.setTag('app_version', '1.0.0'); // Exemple de version
        scope.setTag('app_flavor', F.appFlavor.toString());
      });

      developer.log("✅ Sentry scope configured");
    } catch (e, stackTrace) {
      // En cas d'erreur, vous pouvez capturer l'exception dans Sentry
      await Sentry.captureException(e, stackTrace: stackTrace);
      developer.log('Error while configuring Sentry: $e');
    }
  }
}
