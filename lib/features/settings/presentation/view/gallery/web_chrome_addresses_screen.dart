import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class WebChromeAddressesScreen extends ConsumerStatefulWidget {
  const WebChromeAddressesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WebChromeAddressesScreenState();
}

class _WebChromeAddressesScreenState extends ConsumerState<WebChromeAddressesScreen> {
  bool _toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Addresses and more')),
      body: SettingsList(
        platform: DevicePlatform.web,
        sections: [
          SettingsSection(
            margin: const EdgeInsetsDirectional.only(top: 40),
            tiles: [
              SettingsTile.switchTile(
                initialValue: _toggle,
                onToggle: (_) {
                  setState(() {
                    _toggle = _;
                  });
                },
                trailing: const Icon(Icons.info),
                title: const Text('Save and fill addresses'),
                description: const Text(
                    'Include information like phone numbers, email, and shipping addresses'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Addresses'),
            tiles: [
              SettingsTile.navigation(
                onPressed: (_) {},
                title: const Text('Name, addresses'),
                trailing: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
