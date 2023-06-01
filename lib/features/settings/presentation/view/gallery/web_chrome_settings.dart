import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../application/navigation/navigation.dart';
import 'gallery.dart';

class WebChromeSettings extends ConsumerWidget {
  const WebChromeSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SettingsList(
        platform: DevicePlatform.web,
        sections: [
          SettingsSection(
            title: const Text('Auto-fill'),
            tiles: [
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.vpn_key),
                title: const Text('Passwords'),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.credit_card_outlined),
                title: const Text('Payment methods'),
              ),
              SettingsTile.navigation(
                onPressed: (_) {
                  Navigation.navigateTo(
                    context: context,
                    screen: const WebChromeAddressesScreen(),
                    style: NavigationRouteStyle.material,
                  );
                },
                leading: const Icon(Icons.location_on),
                title: const Text('Addresses and more'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Privacy and security'),
            tiles: [
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.delete),
                title: const Text('Clear browsing data'),
                description: const Text('Clear history, cookies, cache and more'),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.web),
                title: const Text('Cookies and other site data'),
                description:
                const Text('Third-party cookies are blocked in Incognito mode'),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.security),
                title: const Text('Security'),
                description: const Text(
                    'Safe Browsing (protection from dangerous sites) and other security settings'),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.settings),
                title: const Text('Site settings'),
                description: const Text(
                    'Controls what information sites can use and show (location, camera, pop-ups and more)'),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.account_balance_outlined),
                title: const Text('Privacy Sandbox'),
                description: const Text('Trial features are on'),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
