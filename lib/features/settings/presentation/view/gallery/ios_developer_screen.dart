import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class IosDeveloperScreen extends ConsumerStatefulWidget {
  const IosDeveloperScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IosDeveloperScreenState();
}

class _IosDeveloperScreenState extends ConsumerState<IosDeveloperScreen> {
  bool darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(context.tr!.developerNavBar)),
      child: SafeArea(
        bottom: false,
        child: SettingsList(
          applicationType: ApplicationType.cupertino,
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
              title: Text(context.tr!.appearanceTitle),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      darkTheme = value;
                    });
                  },
                  initialValue: darkTheme,
                  title: Text(context.tr!.appearanceTitleDark),
                ),
              ],
            ),
            SettingsSection(
              title: Text(context.tr!.displayTitleZoom.toUpperCase()),
              tiles: [
                SettingsTile.navigation(
                  onPressed: (_) {},
                  title: Text(context.tr!.viewTitle),
                  value: Text(context.tr!.tooltipStandard),
                  description: Text(context.tr!.viewDescription),
                ),
              ],
            ),
            SettingsSection(
              title: Text(context.tr!.uiAutomationTitle.toUpperCase()),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: true,
                  title: Text(context.tr!.uiAutomationEnable),
                ),
                SettingsTile.navigation(
                  title: Text(context.tr!.multiPathNetworking),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: Text(context.tr!.httpThree),
                ),
              ],
            ),
            SettingsSection(
              title: Text(context.tr!.stateResSettings.toUpperCase()),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: Text(
                      context.tr!.fastAppTerminationTitle
                  ),
                  description: Text(context.tr!.fastAppTerminationDescription),
                ),
              ],
            ),
            SettingsSection(
              title: Text(context.tr!.iadDevTitle.toUpperCase()),
              tiles: [
                SettingsTile.navigation(
                  title: Text(context.tr!.fillRate),
                ),
                SettingsTile.navigation(
                  title: Text(context.tr!.addRefreshTitle),
                ),
                SettingsTile.switchTile(
                  onToggle: (_) {},
                  initialValue: false,
                  title: Text(context.tr!.unlimitedAdPresentation),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
