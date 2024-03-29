import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AndroidNotificationsScreen extends ConsumerStatefulWidget {
  const AndroidNotificationsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AndroidNotificationsScreenState();
}

class _AndroidNotificationsScreenState
    extends ConsumerState<AndroidNotificationsScreen> {
  bool useNotificationDotOnAppIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.notifications),
      ),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            title: Text(context.tr!.manage),
            tiles: [
              SettingsTile(
                title: Text(context.tr!.appSettings),
                description: Text(context.tr!.controlNotifications),
              ),
              SettingsTile(
                title: Text(context.tr!.notificationsHistory),
                description: Text(context.tr!.notificationsHistoryText),
              ),
            ],
          ),
          SettingsSection(
            title: Text(context.tr!.conservation),
            tiles: [
              SettingsTile(
                title: Text(context.tr!.conservations),
                description: Text(context.tr!.conservationsNoP),
              ),
              SettingsTile(
                title: Text(context.tr!.bubbles),
                description: Text(context.tr!.bubblesActive),
              ),
            ],
          ),
          SettingsSection(
            title: Text(context.tr!.privacy),
            tiles: [
              SettingsTile(
                title: Text(context.tr!.notificationsDeviceApp),
                description: Text(context.tr!.notificationsDeviceAppDescription),
              ),
              SettingsTile(
                title: Text(context.tr!.notificationsLockScreen),
                description: Text(context.tr!.notificationsDeviceAppDescription),
              ),
            ],
          ),
          SettingsSection(
            title: Text(context.tr!.general),
            tiles: [
              SettingsTile(
                title: Text(context.tr!.doNotDisturb),
                description: Text(context.tr!.doNotDisturbDescription),
              ),
              SettingsTile(
                title: Text(context.tr!.wirelessAlert),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (_) {},
                title: Text(context.tr!.hideSilentTile),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (_) {},
                title: Text(context.tr!.notificationsSnoozing),
              ),
              SettingsTile.switchTile(
                initialValue: useNotificationDotOnAppIcon,
                onToggle: (value) {
                  setState(() {
                    useNotificationDotOnAppIcon = value;
                  });
                },
                title: Text(context.tr!.notificationsDot),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (_) {},
                title: Text(context.tr!.notificationsEnable),
                description: Text(context.tr!.notificationsEnableDescription),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
