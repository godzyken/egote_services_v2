import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/controllers/settings.dart';
import 'key_value_db.dart';
import 'key_value_db_provider.dart';

const bool _debug = !kReleaseMode && true;

/// Classe responsable d'écouter les changements d'implémentation [KeyValueDb].
///
/// Lors d'un changement de DB, elle initialise la nouvelle base puis met à jour
/// les paramètres de l'application via `Settings.init(ref)`.
class KeyValueDbListener {
  KeyValueDbListener(this.ref);

  final Ref ref;

  /// Méthode réactive appelée à chaque changement de [KeyValueDb].
  Future<void> onDbChanged(
      KeyValueDb? previous,
      KeyValueDb current,
      ) async {
    if (_debug) {
      debugPrint('KeyValueDbListener: listen called - - - - -');
      debugPrint('  DB switch : $current');
    }

    // Initialisation de la nouvelle instance de base de données
    await current.init();

    // Mise à jour des paramètres UI avec la nouvelle DB
    Settings.init(ref);
  }
}

/// Provider qui instancie [KeyValueDbListener] et écoute activement [keyValueDbProvider].
final keyValueDbListenerProvider = Provider<KeyValueDbListener>((ref) {
  if (_debug) debugPrint('keyValueDbListenerProvider called');

  final listener = KeyValueDbListener(ref);

  // En Riverpod 3, ref.listen écoute directement la valeur envoyée par le provider (KeyValueDb)
  ref.listen<KeyValueDb>(
    keyValueDbProvider,
        (previous, current) {
      listener.onDbChanged(previous, current);
    },
    fireImmediately: false,
  );

  return listener;
}, name: 'keyValueDbListenerProvider');