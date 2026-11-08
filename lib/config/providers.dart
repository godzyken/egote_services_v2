import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/config/routes/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/data_source_providers.dart';
import '../features/auth/presentation/controller/auth_controller_state.dart';
import '../features/chat/application/providers/cube_settings_provider.dart';

Future<void> initializeProvider(ProviderContainer container) async {
  // Firebase is non-blocking on web (DEC-002).
  // Mock options must not prevent the Hub from starting.
  try {
    await container.read(firebaseInitProvider.future);
  } catch (e) {
    if (kIsWeb) {
      // Swallow on web – Supabase is the primary backend.
      debugPrint('Firebase init skipped on web: $e');
    } else {
      // On mobile we still want to know about the failure.
      rethrow;
    }
  }

  await container.read(supabaseInitProvider.future);
  try {
    await container.read(userFutureProvider.future);
  } catch (e) {
    if (kIsWeb) {
      debugPrint('User future provider skipped on web: $e');
    } else {
      rethrow;
    }
  }
  try {
    await container.read(datadogProvider.future);
  } catch (e) {
    debugPrint('Datadog provider init error: $e');
  }
  try {
    await container.read(datadogConfigProvider.future);
  } catch (e) {
    debugPrint('Datadog config provider init error: $e');
  }
  try {
    await container.read(cubeSettingsInitProvider.future);
  } catch (e) {
    debugPrint('Cube settings init error: $e');
  }

  container.read(sharedPreferencesProvider);

  if (!kIsWeb) {
    container.read(firebaseDatabaseProvider);
    container.read(firebaseFirestoreProvider);
    container.read(firebaseMessagingProvider);
    container.read(emulatorSettingsProvider);
    container.read(firebaseAuthProvider);
  }

  container.read(geoFlutterFireProvider);
  container.read(cubeUserControllerProvider);
  container.read(cubeSessionManagerProvider);
  container.read(cubeChatConnectionSettingsProvider);
  container.read(cubeChatConnectionProvider);
  container.read(goRouterProvider);
  container.read(localizationProvider);

  if (!kIsWeb) {
    container.read(authStateChangesProvider);
    container.read(authStateProvider);
    container.read(userChangesProvider);
    container.read(fireDatabaseProvider);
  }
}

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
  name: 'Shared preferences future provider',
);

// <---------------- GeoLocation Provider --------------------> //
final geoFlutterFireProvider = Provider<GeoFlutterFire>(
  (ref) => GeoFlutterFire(),
);
