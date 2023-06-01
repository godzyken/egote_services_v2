import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AndroidSettingsScreen extends ConsumerWidget {
  const AndroidSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Network & internet'),
                description: const Text('Mobile, Wi-Fi, hotspot'),
                leading: const Icon(Icons.wifi),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Connected devices'),
                description: const Text('Bluetooth, pairing'),
                leading: const Icon(Icons.devices_other),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Apps'),
                description: const Text('Assistant, recent apps, default apps'),
                leading: const Icon(Icons.apps),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Notifications'),
                description: const Text('Notification history, conversations'),
                leading: const Icon(Icons.notifications_none),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Battery'),
                description: const Text('100%'),
                leading: const Icon(Icons.battery_full),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Storage'),
                description: const Text('30% used - 5.60 GB free'),
                leading: const Icon(Icons.storage),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Sound & vibration'),
                description: const Text('Volume, haptics, Do Not Disturb'),
                leading: const Icon(Icons.volume_up_outlined),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Display'),
                enabled: false,
                description: const Text('Dark theme, font size, brightness'),
                leading: const Icon(Icons.brightness_6_outlined),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Wallpaper & style'),
                description: const Text('Colors, themed icons, app grid'),
                leading: const Icon(Icons.palette_outlined),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Accessibility'),
                description: const Text('Display, interaction, audio'),
                leading: const Icon(Icons.accessibility),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Security'),
                description: const Text('Screen lock, Find My Device, app security'),
                leading: const Icon(Icons.lock_outline),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: const Text('Location'),
                description: const Text('On - 3 apps have access to location'),
                leading: const Icon(Icons.location_on_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void toNotificationsScreen(BuildContext context) {}

}
