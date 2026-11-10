import 'package:flutter/foundation.dart';

import 'key_value_db.dart';

// ignore_for_file: comment_references

// Set the bool flag to true to show debug prints. Even if you forgot
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here for just this feature. You can leave it true
// below to see this feature's logs in debug mode.
const bool _debug = !kReleaseMode && true;

/// A repository that stores and retrieves key-value settings pairs from
/// volatile ram memory.
///
/// This class keeps the key-value pairs in a private static final Map during
/// app execution, so we can get the same Map data also when we get a
/// new instance of the mem key-value db, this happens when we dynamically in
/// the app switch to another implementation and back to mem again.
///
/// To actually persist the settings locally, use the [KeyValueDbMemPrefs]
/// implementation that uses the shared_preferences package to persists the
/// values, or the [KeyValueDbMemHive] that uses the Hive package to accomplish
/// the same thing. You could also make an implementation that stores settings
/// on a web server, e.g. with the http package.
class KeyValueDbMem implements KeyValueDb {
  // A private static Map that stores the key-value pairs.
  //
  // This is kept in memory as long as app runs, not so pretty, but simple.
  // We could make the entire class a singleton too, but we don't need to, this
  // works well enough for this demo.
  static final Map<String, dynamic> _memKeyValueDb = <String, dynamic>{};

  /// [KeyValueDbMem] implementation needs no init functionality.
  @override
  Future<void> init() async {
    if (_debug) debugPrint('KeyValueDbMem: init called');
  }

  /// [KeyValueDbMem] implementation needs no dispose functionality.
  @override
  Future<void> dispose() async {
    if (_debug) debugPrint('KeyValueDbMem: dispose called');
  }

  /// Get a settings value from the mem db, using [key] to access it.
  ///
  /// If key does not exist, return the [defaultValue].
  @override
  T get<T>(String key, T defaultValue) {
    try {
      if (!_memKeyValueDb.containsKey(key)) {
        return defaultValue;
      }

      final dynamic raw = _memKeyValueDb[key];

      // null explicite
      if (raw == null) {
        // Si T est nullable on peut renvoyer null, sinon defaultValue
        if (null is T) {
          return null as T;
        }
        return defaultValue;
      }

      // Cas Map fréquent qui casse en minifié
      if (T == Map<String, dynamic>) {
        if (raw is Map<String, dynamic>) return raw as T;
        if (raw is Map) {
          try {
            return Map<String, dynamic>.from(raw) as T;
          } catch (_) {
            return defaultValue;
          }
        }
        return defaultValue;
      }

      // Cas normal
      if (raw is T) return raw;

      // Dernier recours contrôlé
      try {
        return raw as T;
      } catch (e) {
        if (_debug) {
          debugPrint('MemDB get cast failed for key "$key": $e → defaultValue');
        }
        return defaultValue;
      }
    } catch (e) {
      debugPrint('MemDB get (load) ERROR');
      debugPrint(' Error message ...... : $e');
      debugPrint(' Store key .......... : $key');
      debugPrint(' defaultValue ....... : $defaultValue');
      return defaultValue;
    }
  }

  /// Put a settings [value] to the mem db, using [key], as key for the value.
  @override
  Future<void> put<T>(String key, T value) async {
    if (_debug) {
      debugPrint('MemDB put   : ["$key"] = $value (${value.runtimeType})');
    }
    _memKeyValueDb[key] = value;
  }
}
