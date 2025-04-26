import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/domain/values/key_value_db.dart';
import 'package:flutter/material.dart';

extension HiveUserPrefsHelper on KeyValueDb {
  Future<void> saveUserPrefs(UserPreferences prefs) async {
    await put('prefs_${prefs.userEntityModel.id}', prefs.toJson());
  }

  UserPreferences getUserPrefs(UserEntityModel user) {
    final map = get<Map<String, dynamic>>('prefs_${user.id}', {});
    if (map.isEmpty) {
      return UserPreferences(
        userEntityModel: user,
        themeMode: ThemeMode.system,
        about: '',
        isDarkMode: true,
      );
    } else {
      return UserPreferences.fromJson(map);
    }
  }
}
