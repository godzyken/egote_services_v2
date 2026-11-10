import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/db/app_db.dart';
import '../../domain/values/used_key_value_db.dart';

/// Notifier permettant de contrôler l'implémentation [KeyValueDb] utilisée.
class UsedKeyValueDbNotifier extends Notifier<UsedKeyValueDb> {
  @override
  UsedKeyValueDb build() {
    // Sur le web minifié, Hive + IndexedDB provoque des TypeError
    // sur les casts Map / enums. On bascule vers SharedPreferences.
    if (kIsWeb) {
      return UsedKeyValueDb.sharedPreferences;
    }
    return AppDb.keyValue; // hive sur mobile / desktop
  }

  /// Permet de modifier l'implémentation de [KeyValueDb]
  void selectDb(UsedKeyValueDb db) {
    // Optionnel : empêcher de repasser sur Hive en web
    if (kIsWeb && db == UsedKeyValueDb.hive) {
      state = UsedKeyValueDb.sharedPreferences;
      return;
    }
    state = db;
  }
}

/// Controller utilisé par les widgets pour lire et modifier l'implémentation [KeyValueDb].
final usedKeyValueDbNotifierProvider =
    NotifierProvider<UsedKeyValueDbNotifier, UsedKeyValueDb>(
      UsedKeyValueDbNotifier.new,
      name: 'usedKeyValueDbNotifierProvider',
    );
