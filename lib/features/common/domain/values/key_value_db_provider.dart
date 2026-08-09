import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/controllers/used_key_value_db_provider.dart';
import 'key_value_db.dart';

const bool _debug = !kReleaseMode && true;

/// Fournit le dépôt [KeyValueDb] actif.
///
/// La valeur retournée dépend réactivement de [usedKeyValueDbNotifierProvider].
final Provider<KeyValueDb> keyValueDbProvider = Provider<KeyValueDb>((ref) {
  ref.onDispose(() {
    if (_debug) debugPrint('keyValueDbProvider: onDispose called');
  });

  // Lit et réagit automatiquement aux changements de l'implémentation sélectionnée
  final usedDb = ref.watch(usedKeyValueDbNotifierProvider);
  return usedDb.get;
}, name: 'keyValueDbProvider');