import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/db/app_db.dart';
import '../../domain/values/used_key_value_db.dart';

/// Notifier permettant de contrôler l'implémentation [KeyValueDb] utilisée.
class UsedKeyValueDbNotifier extends Notifier<UsedKeyValueDb> {
  @override
  UsedKeyValueDb build() {
    return AppDb.keyValue;
  }

  /// Permet de modifier l'implémentation de [KeyValueDb]
  void selectDb(UsedKeyValueDb db) {
    state = db;
  }
}

/// Controller utilisé par les widgets pour lire et modifier l'implémentation [KeyValueDb].
final usedKeyValueDbNotifierProvider =
NotifierProvider<UsedKeyValueDbNotifier, UsedKeyValueDb>(
  UsedKeyValueDbNotifier.new,
  name: 'usedKeyValueDbNotifierProvider',
);