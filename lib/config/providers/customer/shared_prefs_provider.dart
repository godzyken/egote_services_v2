import 'dart:async';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/services/app_telemetry_service.dart';
import 'package:egote_services_v2/features/common/application/controllers/user_prefs_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/domain/entities/user_preferences/user_pref.dart';
import '../../../features/chat/data/data_sources/local/pref_util.dart';
import '../../../features/common/application/controllers/used_key_value_db_provider.dart';
import '../../../features/common/domain/values/key_value_db.dart';

final sharedPrefsProvider = FutureProvider<SharedPrefs?>((ref) async {
  return await ref.runSafeIsolate('SharedPrefs', () async {
    final sharedPrefs = SharedPrefs.instance;
    await sharedPrefs.init();
    return sharedPrefs;
  }, fallback: SharedPrefs.instance);
});

class SharedPrefsAsyncNotifier extends AsyncNotifier<SharedPrefs> {
  @override
  Future<SharedPrefs> build() async {
    final sharedPrefs = SharedPrefs.instance;
    return await sharedPrefs.init().then((_) => sharedPrefs);
  }

  Future<void> clearAll() async {
    state = const AsyncLoading();
    try {
      final sharedPrefs = state.requireValue;
      await sharedPrefs.deleteUser();
      state = AsyncData(sharedPrefs);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  String? getSubscriptionToken() {
    return state.hasValue ? state.value!.getSubscriptionToken() : null;
  }

  Future<void> saveSubscriptionToken(String token) async {
    if (!state.hasValue) return;
    final telemetry = ref.read(telemetryManagerProvider);
    state = const AsyncLoading();
    try {
      final sharedPrefs = state.requireValue;
      await sharedPrefs.saveSubscriptionToken(token);
      state = AsyncData(sharedPrefs);
    } catch (e, st) {
      state = AsyncError(e, st);
      telemetry.trackError(e, st);
    }
  }

  Future<void> saveSubscriptionId(int id) async {
    if (!state.hasValue) return;
    final telemetry = ref.read(telemetryManagerProvider);
    state = const AsyncLoading();
    try {
      final sharedPrefs = state.requireValue;
      await sharedPrefs.saveSubscriptionId(id);
      state = AsyncData(sharedPrefs);
    } catch (e, st) {
      state = AsyncError(e, st);
      telemetry.trackError(e, st);
    }
  }

  Future<void> updateUser(CubeUser user) async {
    final telemetry = ref.read(telemetryManagerProvider);
    if (!state.hasValue) return;

    state = const AsyncLoading();
    try {
      final sharedPrefs = state.requireValue;
      await sharedPrefs.updateUser(user);
      state = AsyncData(sharedPrefs);
    } catch (e, st) {
      state = AsyncError(e, st);
      telemetry.trackError(e, st);
    }
  }

  Future<void> deleteUser() async {
    final telemetry = ref.read(telemetryManagerProvider);
    if (!state.hasValue) return;
    state = const AsyncLoading();
    try {
      final sharedPrefs = state.requireValue;
      final isDeleted = await sharedPrefs.deleteUser();
      if (isDeleted == false) {
        state = AsyncData(sharedPrefs);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
      telemetry.trackError(e, st);
    }
  }
}

final sharedPrefsAsyncNotifierProvider =
    AsyncNotifierProvider<SharedPrefsAsyncNotifier, SharedPrefs>(
  () => SharedPrefsAsyncNotifier(),
);

final keyValueDbProvider = Provider<KeyValueDb>((ref) {
  final usedDb = ref.watch(usedKeyValueDbProvider);
  return usedDb.get;
});

final userPreferencesProvider =
    AsyncNotifierProvider<UserPrefsController, UserPreferences>(
  UserPrefsController.new,
);
