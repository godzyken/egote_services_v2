import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
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
      appBar: AppBar(title: Text(context.tr!.settings)),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(context.tr!.general),
              tiles: [
                SettingsTile.navigation(
                    title: Text(context.tr!.abstractSettingsTitle),
                  leading: const Icon(CupertinoIcons.wrench),
                  description: Text(context.tr!.abstractSettingsDescription),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const CrossPlatformSettingsScreen(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
                SettingsTile.navigation(
                  title: Text(context.tr!.languageSettingsScreen),
                  leading: const Icon(CupertinoIcons.globe),
                  onPressed: (context) {
                    Navigation.navigateTo(
                      context: context,
                      screen: const LanguageSettingsScreen(),
                      style: NavigationRouteStyle.material,
                    );
                  },
                ),
              ],
          ),
          SettingsSection(
            title: Text(context.tr!.replications),
              tiles: [
                SettingsTile.navigation(
                  title: Text(context.tr!.iosDevTitle),
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
                  title: Text(context.tr!.androidSettingsTitle),
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
                  title: Text(context.tr!.webSettingsTitle),
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
