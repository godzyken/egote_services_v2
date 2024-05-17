import 'package:egote_services_v2/config/app_shared/extensions/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../../config/app_shared/colors/color_scheme_box.dart';

class AppBarStylePopupMenu extends StatelessWidget {
  const AppBarStylePopupMenu({
    super.key,
    required this.index,
    this.onChanged,
    this.title,
    this.subtitle,
    this.contentPadding,
    this.labelForDefault = 'default (null)',
    this.popupLabelDefault,
    this.customAppBarColor,
    this.customScaffoldColor,
  });
  final int index;
  final ValueChanged<int>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final EdgeInsetsGeometry? contentPadding; // Defaults to 16.
  final String labelForDefault;
  final String? popupLabelDefault;
  final Color? customAppBarColor;
  final Color? customScaffoldColor;

  Color _appBarStyleColor(
    final FlexAppBarStyle? style,
    final ColorScheme colorScheme,
    final bool isLight,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return colorScheme.primary;
      case FlexAppBarStyle.material:
        return isLight
            ? FlexColor.materialLightSurface
            : FlexColor.materialDarkSurface;
      case FlexAppBarStyle.surface:
        return colorScheme.surface;
      case FlexAppBarStyle.background:
        return colorScheme.surface;
      case FlexAppBarStyle.scaffoldBackground:
        return customScaffoldColor ?? colorScheme.surface;
      case FlexAppBarStyle.custom:
        return customAppBarColor ?? colorScheme.tertiaryContainer;
      case null:
        {
          if (useMaterial3) {
            return colorScheme.surface;
          } else {
            if (isLight) {
              return FlexColor.materialLightSurface;
            } else {
              return FlexColor.materialDarkSurface;
            }
          }
        }
    }
  }

  String _explainAppBarStyle(
    final FlexAppBarStyle? style,
    final bool isLight,
    final bool useMaterial3,
  ) {
    switch (style) {
      case FlexAppBarStyle.primary:
        return isLight ? 'Primary color (M2 default)' : 'Primary color';
      case FlexAppBarStyle.material:
        return isLight
            ? 'White (M2 light surface)'
            : 'Dark (M2 default surface #121212)';
      case FlexAppBarStyle.surface:
        return 'Surface color, with primary color blend';
      case FlexAppBarStyle.background:
        return 'Background color, with primary color blend';
      case FlexAppBarStyle.scaffoldBackground:
        return 'Scaffold background color, with primary color blend';
      case FlexAppBarStyle.custom:
        return 'Custom. Built-in schemes use tertiary color, '
            'but you can use any color';
      case null:
        {
          if (useMaterial3) {
            return 'Surface color (M3 default)';
          } else {
            if (isLight) {
              return 'Primary color (M2 default)';
            } else {
              return 'Dark (M2 default surface #121212)';
            }
          }
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final bool useM3 = theme.useMaterial3;
    final ColorScheme scheme = theme.colorScheme;
    final TextStyle txtStyle = theme.textTheme.labelLarge!;
    final bool enabled = onChanged != null;
    // Negative value, or index over range are used as null and default value.
    final bool useDefault = index < 0 || index >= FlexAppBarStyle.values.length;
    final String styleName = !useDefault
        ? _explainAppBarStyle(FlexAppBarStyle.values[index], isLight, useM3)
        : _explainAppBarStyle(null, isLight, useM3);

    return PopupMenuButton<int>(
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int index) {
        // We return -1 for index that reached max length or any negative
        // value will cause controller for a FlexAppBarStyle to be set to
        // "null", we need to be able to do that to input "null" property
        // value to FlexAppBarStyle configs.
        onChanged?.call(index >= FlexAppBarStyle.values.length ? -1 : index);
      },
      enabled: enabled,
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i <= FlexAppBarStyle.values.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              dense: true,
              leading: ColorSchemeBox(
                backgroundColor: i >= FlexAppBarStyle.values.length
                    ? _appBarStyleColor(null, scheme, isLight, useM3)
                    : _appBarStyleColor(
                        FlexAppBarStyle.values[i],
                        scheme,
                        isLight,
                        useM3,
                      ),
                borderColor: index == i ||
                        (i >= FlexAppBarStyle.values.length && useDefault)
                    ? scheme.primary
                    : scheme.outline,
                selected: index == i ||
                    (i >= FlexAppBarStyle.values.length && useDefault),
                defaultOption: i >= FlexAppBarStyle.values.length,
              ),
              title: i >= FlexAppBarStyle.values.length
                  // If we reached max length make default label.
                  ? Text(popupLabelDefault ?? labelForDefault, style: txtStyle)
                  : Text(
                      FlexAppBarStyle.values[i].name.sentenceCase(),
                      style: txtStyle,
                    ),
            ),
          )
      ],
      child: ListTile(
        enabled: enabled,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
        title: title,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (subtitle != null) subtitle!,
            Text(styleName),
          ],
        ),
        trailing: ColorSchemeBox(
          backgroundColor: enabled && !useDefault
              ? _appBarStyleColor(
                  FlexAppBarStyle.values[index],
                  scheme,
                  isLight,
                  useM3,
                )
              : _appBarStyleColor(null, scheme, isLight, useM3),
          borderColor: index == FlexAppBarStyle.custom.index
              ? Colors.transparent
              : scheme.primary,
          defaultOption: useDefault,
        ),
      ),
    );
  }
}
