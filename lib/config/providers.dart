import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/localizations/localizations_provider.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:egote_services_v2/config/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/data/data_source_providers.dart';
import '../features/auth/presentation/controller/auth_controller_state.dart';
import '../features/chat/application/providers/cube_settings_provider.dart';

Future<void> initializeProvider(ProviderContainer container) async {
  await container.read(firebaseInitProvider.future);
  await container.read(supabaseInitProvider.future);
  await container.read(userFutureProvider.future);
  await container.read(datadogProvider.future);
  await container.read(datadogConfigProvider.future);
  await container.read(cubeSettingsInitProvider.future);

  container.read(sharedPreferencesProvider);
  container.read(firebaseDatabaseProvider);
  container.read(firebaseFirestoreProvider);
  container.read(firebaseMessagingProvider);
  container.read(emulatorSettingsProvider);
  container.read(geoFlutterFireProvider);
  container.read(firebaseAuthProvider);
  container.read(cubeUserControllerProvider);
  container.read(cubeSessionManagerProvider);
  container.read(cubeChatConnectionSettingsProvider);
  container.read(cubeChatConnectionProvider);
  container.read(goRouterProvider);
  container.read(localizationProvider);

  container.read(authStateChangesProvider);
  container.read(authStateProvider);
  container.read(userChangesProvider);
  container.read(fireDatabaseProvider);
}

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
  name: 'Shared preferences future provider',
);

// <---------------- GeoLocation Provider --------------------> //
final geoFlutterFireProvider =
    Provider<GeoFlutterFire>((ref) => GeoFlutterFire());
