// A popup menu that allows us to select the Flutter platform we want to use.
//
// Does not actually change the platform, only the UI for the selection.
// The actual selection is done via platform property in ThemeData.
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_shared/flex_icons/flex_icons.dart';

class PlatformPopupMenu extends StatelessWidget {
  const PlatformPopupMenu({
    super.key,
    required this.platform,
    required this.onChanged,
  });
  final TargetPlatform platform;
  final ValueChanged<TargetPlatform> onChanged;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Theme.of(context).colorScheme.primary;
    final String labelAndroid = context.tr!.labelAndroid;
    final String labelApple = context.tr!.labelApple;
    final String labelWindows = context.tr!.labelWindows;
    final String labelMacOs = context.tr!.labelMacOs;
    final String labelLinux = context.tr!.labelLinux;
    final String labelFuchsia = context.tr!.labelFuchsia;

    final Map<TargetPlatform, PopupMenuItem<TargetPlatform>> platformItems =
    <TargetPlatform, PopupMenuItem<TargetPlatform>>{
      TargetPlatform.android: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.android,
        child: ListTile(
          leading: Icon(Icons.android, color: iconColor),
          title: Text(labelAndroid),
        ),
      ),
      TargetPlatform.iOS: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.iOS,
        child: ListTile(
          leading: Icon(Icons.phone_iphone, color: iconColor),
          title: Text(labelApple),
        ),
      ),
      TargetPlatform.windows: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.windows,
        child: ListTile(
          leading: Icon(FlexIcons.windows, color: iconColor),
          title: Text(labelWindows),
        ),
      ),
      TargetPlatform.macOS: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.macOS,
        child: ListTile(
          leading: Icon(FlexIcons.apple, color: iconColor),
          title: Text(labelMacOs),
        ),
      ),
      TargetPlatform.linux: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.linux,
        child: ListTile(
          leading: Icon(FlexIcons.linux, color: iconColor),
          title: Text(labelLinux),
        ),
      ),
      TargetPlatform.fuchsia: PopupMenuItem<TargetPlatform>(
        value: TargetPlatform.fuchsia,
        child: ListTile(
          leading: Icon(FlexIcons.infinity, color: iconColor),
          title: Text(labelFuchsia),
        ),
      ),
    };

    final Map<TargetPlatform, String> platformString = <TargetPlatform, String>{
      TargetPlatform.android: labelAndroid,
      TargetPlatform.iOS: labelApple,
      TargetPlatform.windows: labelWindows,
      TargetPlatform.macOS: labelMacOs,
      TargetPlatform.linux: labelLinux,
      TargetPlatform.fuchsia: labelFuchsia,
    };

    const Map<TargetPlatform, IconData> platformIcon =
    <TargetPlatform, IconData>{
      TargetPlatform.android: Icons.android,
      TargetPlatform.iOS: Icons.phone_iphone,
      TargetPlatform.windows: FlexIcons.windows,
      TargetPlatform.macOS: FlexIcons.apple,
      TargetPlatform.linux: FlexIcons.linux,
      TargetPlatform.fuchsia: FlexIcons.infinity,
    };

    String subtitle = '${context.tr!.nowSetTo} ${platformString[platform]}\n'
    '${context.tr!.forTesting}';

    return PopupMenuButton<TargetPlatform>(
      tooltip: '',
      padding: const EdgeInsets.all(10),
      onSelected: (TargetPlatform value) {
        subtitle = '${context.tr!.nowSetTo} ${platformString[value]}';
        onChanged(value);
      },
      itemBuilder: (BuildContext context) =>
      <PopupMenuItem<TargetPlatform>>[...platformItems.values],
      child: ListTile(
        trailing: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12),
          child: Icon(
            platformIcon[platform],
            color: iconColor,
            size: 40,
          ),
        ),
        title: Text(context.tr!.usedPlatformMechanics),
        subtitle: Text(subtitle),
      ),
    );
  }
}