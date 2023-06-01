import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class IosDeveloperScreen extends ConsumerStatefulWidget {
  const IosDeveloperScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IosDeveloperScreenState();
}

class _IosDeveloperScreenState extends ConsumerState<IosDeveloperScreen> {
  bool darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Developer')),
      child: SafeArea(
        bottom: false,
        child: SettingsList(
          applicationType: ApplicationType.cupertino,
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
              title: const Text('APPEARANCE'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      darkTheme = value;
                    });
                  },
                  initialValue: darkTheme,
                  title: const Text('Dark Appearance'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('DISPLAY ZOOM'),
              tiles: [
                SettingsTile.navigation(
                  onPressed: (_) {},
                  title: const Text('View'),
                  value: const Text('Standard'),
                  description: const Text(
                    'Choose a view for iPhone. '
                        'Zoomed shadows larger controls. '
                        'Standard shows more content.',
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('UI AUTOMATION'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  title: const Text('Enable UI Automation'),
                ),
                SettingsTile.navigation(
                  title: const Text('MultiPath Networking'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: const Text('HTTP/3'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('STATE RESTORATION TESTING'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: const Text(
                    'Fast App Termination',
                  ),
                  description: const Text(
                    'Terminate instead of suspending apps when backgrounded to '
                        'force apps to be relaunched when tray '
                        'are foregrounded.',
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('IAD DEVELOPER APP TESTING'),
              tiles: [
                SettingsTile.navigation(
                  title: const Text('Fill Rate'),
                ),
                SettingsTile.navigation(
                  title: const Text('Add Refresh Rate'),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: const Text('Unlimited Ad Presentation'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
