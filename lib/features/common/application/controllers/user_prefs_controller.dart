import 'dart:async';

import 'package:egote_services_v2/config/services/app_telemetry_service.dart';
import 'package:egote_services_v2/features/auth/application/controller/user_controller.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/domain/values/hive_user_prefs_helper.dart';
import 'package:egote_services_v2/features/common/domain/values/key_value_db_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/values/key_value_db.dart';

class UserPrefsController extends AsyncNotifier<UserPreferences> {
  late final KeyValueDb db;

  @override
  Future<UserPreferences> build() async {
    db = ref.watch(keyValueDbProvider);

    final currentUser = await ref.read(currentUserProfileProvider.future);

    await ref.runSafeIsolate('UserPrefsController', () async {
      await db.init();
    }, fallback: () async {
      await db.dispose();
    });

    return db.getUserPrefs(currentUser);
  }

  Future<void> updateUserPrefs(UserPreferences prefs) async {
    state = AsyncValue.data(prefs);

    await db.saveUserPrefs(prefs);
  }

  Future<void> saveUserPrefs(UserPreferences prefs) async {
    await db.put('prefs_${prefs.userEntityModel.id}', prefs.toJson());
  }

  /* Future<void> removeUserPrefs(UserPreferences prefs) async {
    await db.delete('prefs_${prefs.userEntityModel.id}');
  }*/
}
