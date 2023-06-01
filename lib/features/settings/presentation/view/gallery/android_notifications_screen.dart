import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class AndroidNotificationsScreen extends ConsumerStatefulWidget {
  const AndroidNotificationsScreen({Key? key}) : super(key: key);

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
        title: const Text('Notifications'),
      ),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            title: const Text('Manage'),
            tiles: [
              SettingsTile(
                title: const Text('App settings'),
                description: const Text('Control notifications from individual apps'),
              ),
              SettingsTile(
                title: const Text('Notification history'),
                description: const Text('Show recent and snoozed notifications'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Conservation'),
            tiles: [
              SettingsTile(
                title: const Text('Conservations'),
                description: const Text('No priority conservations'),
              ),
              SettingsTile(
                title: const Text('Bubbles'),
                description: const Text(
                  'On / Conservations can appear as floating icons',
                ),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Privacy'),
            tiles: [
              SettingsTile(
                title: const Text('Device & app notifications'),
                description: const Text(
                  'Control which apps and devices can read notifications',
                ),
              ),
              SettingsTile(
                title: const Text('Notifications on lock screen'),
                description: const Text('Show conversations, default, and silent'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('General'),
            tiles: [
              SettingsTile(
                title: const Text('Do Not Disturb'),
                description: const Text('Off / 1 schedule can turn on automatically'),
              ),
              SettingsTile(
                title: const Text('Wireless emergency alerts'),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('Hide silent notifications in status bar'),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('Allow notification snoozing'),
              ),
              SettingsTile.switchTile(
                initialValue: useNotificationDotOnAppIcon,
                onToggle: (value) {
                  setState(() {
                    useNotificationDotOnAppIcon = value;
                  });
                },
                title: const Text('Notification dot on app icon'),
              ),
              SettingsTile.switchTile(
                initialValue: false,
                onToggle: (_) {},
                title: const Text('Enable notifications'),
                description: const Text('Get suggested actions, replies and more'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
