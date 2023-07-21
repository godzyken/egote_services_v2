import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../common/application/navigation/navigation.dart';
import 'gallery.dart';

class WebChromeSettings extends ConsumerWidget {
  const WebChromeSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr!.settings)),
      body: SettingsList(
        platform: DevicePlatform.web,
        sections: [
          SettingsSection(
            title: Text(context.tr!.autoFillTitle),
            tiles: [
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.vpn_key),
                title: Text(context.tr!.passwords),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.credit_card_outlined),
                title: Text(context.tr!.paymentMethods),
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
                title: Text(context.tr!.addressMore),
              ),
            ],
          ),
          SettingsSection(
            title: Text(context.tr!.privacySecTitle),
            tiles: [
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.delete),
                title: Text(context.tr!.clearBrowsingTitle),
                description: Text(context.tr!.clearBrowsingDescription),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.web),
                title: Text(context.tr!.cookiesOtherTitle),
                description:
                Text(context.tr!.cookiesOtherDescription),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.security),
                title: Text(context.tr!.securityTitle),
                description: Text(
                    context.tr!.securitySafeBrowsingDescription),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.settings),
                title: Text(context.tr!.siteSettingsTitle),
                description: Text(
                context.tr!.siteSettingsDescription),
              ),
              SettingsTile.navigation(
                onPressed: (_) {},
                leading: const Icon(Icons.account_balance_outlined),
                title: Text(context.tr!.privacySandBoxTitle),
                description: Text(context.tr!.privacyDescription),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
