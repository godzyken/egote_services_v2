import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../common/application/navigation/navigation.dart';
import 'gallery/gallery.dart';

class SettingsUiPage extends ConsumerWidget {
  const SettingsUiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('General'),
              tiles: [
                SettingsTile.navigation(
                    title: const Text('Abstract settings screen'),
                  leading: const Icon(CupertinoIcons.wrench),
                  description: const Text('UI create to show plugin\'s possibilities'),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const CrossPlatformSettingsScreen(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
              ],
          ),
          SettingsSection(
            title: const Text('Replications'),
              tiles: [
                SettingsTile.navigation(
                  title: const Text('iOS Developer Screen'),
                  leading: const Icon(CupertinoIcons.settings),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const IosDeveloperScreen(),
                      style: NavigationRouteStyle.cupertino,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: const Text('Android Settings Screen'),
                  leading: const Icon(Icons.settings),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const AndroidSettingsScreen(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: const Text('Web Settings'),
                  leading: const Icon(Icons.web),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const WebChromeSettings(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
              ],
          ),
        ],
      ),
    );
  }

}
