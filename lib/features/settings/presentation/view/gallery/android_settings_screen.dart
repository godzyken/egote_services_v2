import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AndroidSettingsScreen extends ConsumerWidget {
  const AndroidSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr!.settings)),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.networkInternet),
                description: Text(context.tr!.networkInternetDescription),
                leading: const Icon(Icons.wifi),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.connectedDevices),
                description: Text(context.tr!.connectedDevicesDescription),
                leading: const Icon(Icons.devices_other),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.appsTitle),
                description: Text(context.tr!.appsDescription),
                leading: const Icon(Icons.apps),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.notifications),
                description: Text(context.tr!.notificationsDescription),
                leading: const Icon(Icons.notifications_none),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.batteryTitle),
                description: Text(context.tr!.batteryDescription),
                leading: const Icon(Icons.battery_full),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.storage),
                description: Text(context.tr!.storage),
                leading: const Icon(Icons.storage),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.soundVibrationTitle),
                description: Text(context.tr!.soundVibrationDescription),
                leading: const Icon(Icons.volume_up_outlined),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.display),
                enabled: false,
                description: Text(context.tr!.displayDescription),
                leading: const Icon(Icons.brightness_6_outlined),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.wallpaperStyleTitle),
                description: Text(context.tr!.wallpaperStyleDescription),
                leading: const Icon(Icons.palette_outlined),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.accessibilityTitle),
                description: Text(context.tr!.accessibilityDescription),
                leading: const Icon(Icons.accessibility),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.securityTitle),
                description: Text(context.tr!.securityDescription),
                leading: const Icon(Icons.lock_outline),
              ),
              SettingsTile(
                onPressed: (context) => toNotificationsScreen(context),
                title: Text(context.tr!.location),
                description: Text(context.tr!.locationDescription),
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
