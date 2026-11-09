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
import '../features/common/domain/values/key_value_db_listener.dart';
import '../features/common/domain/values/key_value_db_provider.dart';

enum BootPolicy {
  /// Blocking: if initialization fails, startup fails (rethrow).
  blocking,

  /// Non-blocking: if initialization fails, log warning and continue in degraded mode.
  nonBlocking,
}

/// Safely initializes a future provider based on its [BootPolicy] and platform conditions.
Future<void> initProviderSafely<T>(
  ProviderContainer container,
  FutureProvider<T> provider, {
  required String name,
  required BootPolicy policy,
  bool condition = true,
}) async {
  if (!condition) return;

  try {
    await container.read(provider.future);
    debugPrint('✅ [Boot] Provider initialized successfully: $name');
  } catch (e, stackTrace) {
    if (policy == BootPolicy.blocking) {
      debugPrint(
        '❌ [Boot] CRITICAL: Blocking provider "$name" failed to initialize: $e',
      );
      debugPrint('$stackTrace');
      rethrow;
    } else {
      debugPrint(
        '⚠️ [Boot] WARNING: Non-blocking provider "$name" failed (degraded mode): $e',
      );
    }
  }
}

Future<void> initializeProvider(ProviderContainer container) async {
  // 1. Firebase initialization (non-blocking on web, blocking on mobile)
  await initProviderSafely(
    container,
    firebaseInitProvider,
    name: 'firebaseInitProvider',
    policy: kIsWeb ? BootPolicy.nonBlocking : BootPolicy.blocking,
  );

  // 2. Supabase initialization (strictly blocking)
  await initProviderSafely(
    container,
    supabaseInitProvider,
    name: 'supabaseInitProvider',
    policy: BootPolicy.blocking,
  );

  // 3. User future initialization (non-blocking on web, blocking on mobile)
  await initProviderSafely(
    container,
    userFutureProvider,
    name: 'userFutureProvider',
    policy: kIsWeb ? BootPolicy.nonBlocking : BootPolicy.blocking,
  );

  // 4. Monitoring & Settings providers (strictly non-blocking)
  await initProviderSafely(
    container,
    datadogProvider,
    name: 'datadogProvider',
    policy: BootPolicy.nonBlocking,
  );

  await initProviderSafely(
    container,
    datadogConfigProvider,
    name: 'datadogConfigProvider',
    policy: BootPolicy.nonBlocking,
  );

  await initProviderSafely(
    container,
    cubeSettingsInitProvider,
    name: 'cubeSettingsInitProvider',
    policy: BootPolicy.nonBlocking,
  );

  // Initialize KeyValueDb (Hive / Prefs) before reading settings / themes
  try {
    final activeDb = container.read(keyValueDbProvider);
    await activeDb.init();
    container.read(keyValueDbListenerProvider);
  } catch (e) {
    debugPrint('⚠️ [Boot] KeyValueDb initialization warning: $e');
  }

  // Synchronous initializations & reads
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
