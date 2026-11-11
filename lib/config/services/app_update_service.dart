import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appUpdateServiceProvider = Provider<AppUpdateService>((ref) {
  return AppUpdateService(ref);
});

class AppUpdateService {
  final Ref ref;

  AppUpdateService(this.ref);

  /// À appeler au démarrage de l’app (dans le bootstrap / initialisation)
  Future<void> checkAndHandleUpdate() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version; // ex: "1.0.0"
      final buildNumber = packageInfo.buildNumber;

      final prefs = await SharedPreferences.getInstance();
      final lastKnownVersion = prefs.getString('last_known_version');

      debugPrint(
        '[AppUpdateService] Current version: $currentVersion ($buildNumber), Last known: $lastKnownVersion',
      );

      // Si la version a changé → on force le nettoyage du cache
      if (lastKnownVersion != null && lastKnownVersion != currentVersion) {
        debugPrint(
          '[AppUpdateService] 🔄 Version change detected ($lastKnownVersion -> $currentVersion). Clearing local cache...',
        );
        await _clearLocalCache();
      }

      // On enregistre la version actuelle
      await prefs.setString('last_known_version', currentVersion);
      await prefs.setString('last_known_build', buildNumber);
    } catch (e, st) {
      debugPrint('[AppUpdateService] Error checking app update: $e\n$st');
    }
  }

  Future<void> _clearLocalCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Si Hive est utilisé et initialisé :
      if (!kIsWeb) {
        try {
          if (Hive.isBoxOpen('my_app_settings')) {
            await Hive.box('my_app_settings').clear();
          }
        } catch (hiveErr) {
          debugPrint('[AppUpdateService] Hive box clear error: $hiveErr');
        }
      }

      debugPrint(
        '[AppUpdateService] Local cache successfully cleared due to app version upgrade.',
      );
    } catch (e) {
      debugPrint('[AppUpdateService] Error during _clearLocalCache: $e');
    }
  }
}
