import 'package:egote_services_v2/config/services/app_update_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AppUpdateService Tests', () {
    test('First run initializes version and does not clear cache', () async {
      SharedPreferences.setMockInitialValues({});
      PackageInfo.setMockInitialValues(
        appName: 'Egote Services',
        packageName: 'com.egote.services',
        version: '1.0.0',
        buildNumber: '1',
        buildSignature: '',
        installerStore: null,
      );

      final container = ProviderContainer();
      final service = container.read(appUpdateServiceProvider);

      await service.checkAndHandleUpdate();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('last_known_version'), '1.0.0');
      expect(prefs.getString('last_known_build'), '1');
    });

    test(
      'Same version run does not clear cache or re-trigger actions',
      () async {
        SharedPreferences.setMockInitialValues({
          'last_known_version': '1.0.0',
          'last_known_build': '1',
          'some_cached_key': 'cached_value',
        });
        PackageInfo.setMockInitialValues(
          appName: 'Egote Services',
          packageName: 'com.egote.services',
          version: '1.0.0',
          buildNumber: '1',
          buildSignature: '',
          installerStore: null,
        );

        final container = ProviderContainer();
        final service = container.read(appUpdateServiceProvider);

        await service.checkAndHandleUpdate();

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('last_known_version'), '1.0.0');
        expect(prefs.getString('some_cached_key'), 'cached_value');
      },
    );

    test('Updated version clears cache and updates version', () async {
      SharedPreferences.setMockInitialValues({
        'last_known_version': '1.0.0',
        'last_known_build': '1',
        'some_cached_key': 'stale_value',
      });
      PackageInfo.setMockInitialValues(
        appName: 'Egote Services',
        packageName: 'com.egote.services',
        version: '1.1.0',
        buildNumber: '2',
        buildSignature: '',
        installerStore: null,
      );

      final container = ProviderContainer();
      final service = container.read(appUpdateServiceProvider);

      await service.checkAndHandleUpdate();

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('last_known_version'), '1.1.0');
      expect(prefs.getString('last_known_build'), '2');
      // Cache should be cleared (stale_value gone)
      expect(prefs.getString('some_cached_key'), null);
    });
  });
}
