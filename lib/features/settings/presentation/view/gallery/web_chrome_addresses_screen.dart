import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class WebChromeAddressesScreen extends ConsumerStatefulWidget {
  const WebChromeAddressesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WebChromeAddressesScreenState();
}

class _WebChromeAddressesScreenState
    extends ConsumerState<WebChromeAddressesScreen> {
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr!.addressMore)),
      body: SettingsList(
        platform: DevicePlatform.web,
        sections: [
          SettingsSection(
            margin: const EdgeInsetsDirectional.only(top: 40),
            tiles: [
              SettingsTile.switchTile(
                initialValue: _toggle,
                onToggle: (yeh) {
                  setState(() {
                    _toggle = yeh;
                  });
                },
                trailing: const Icon(Icons.info),
                title: Text(context.tr!.addressTitle),
                description: Text(context.tr!.addressDescription),
              )
            ],
          ),
          SettingsSection(
            title: Text(context.tr!.addressesTitle),
            tiles: [
              SettingsTile.navigation(
                onPressed: (_) {},
                title: Text(context.tr!.addressesNameTitle),
                trailing: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
