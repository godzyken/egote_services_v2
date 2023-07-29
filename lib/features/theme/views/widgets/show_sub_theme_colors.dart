import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../config/app_shared/colors/color_card.dart';
import '../../../../config/app_shared/insets/app_insets.dart';

/// Draw a number of boxes showing the colors of key sub theme color properties
/// in the ColorScheme of the inherited ThemeData and its color properties.
///
/// This widget is just used so we can visually see the active scheme colors
/// in the examples and their used FlexColorScheme based themes.
///
/// These are all Flutter "Universal" Widgets that only depends on the SDK and
/// all the Widgets in this file be dropped into any application. They are
/// however not so generally reusable.
class ShowSubThemeColors extends StatelessWidget {
  const ShowSubThemeColors({
    super.key,
    this.onBackgroundColor,
    this.showTitle = true,
  });

  /// The color of the background the color widget are being drawn on.
  ///
  /// Some of the theme colors may have semi transparent fill color. To compute
  /// a legible text color for the sum when it shown on a background color, we
  /// need to alpha merge it with background and we need the exact background
  /// color it is drawn on for that. If not passed in from parent, it is
  /// assumed to be drawn on card color, which usually is close enough.
  final Color? onBackgroundColor;

  /// Show title for the sub-theme colors
  final bool showTitle;

  // Return true if the color is light, meaning it needs dark text for contrast.
  static bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  // On color used when a theme color property does not have a theme onColor.
  static Color _onColor(final Color color, final Color bg) =>
      _isLight(Color.alphaBlend(color, bg)) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isDark = colorScheme.brightness == Brightness.dark;
    final bool useMaterial3 = theme.useMaterial3;

    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppInsets.phoneWidthBreakpoint ||
        media.size.height < AppInsets.phoneHeightBreakpoint;
    final double spacing = isPhone ? 3 : 6;

    // Get effective background color.
    final Color background =
        onBackgroundColor ?? theme.cardTheme.color ?? theme.cardColor;
    // Grab the card border from the theme card shape
    ShapeBorder? border = theme.cardTheme.shape;
    // If we had one, copy in a border side to it.
    if (border is RoundedRectangleBorder) {
      border = border.copyWith(
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
      // If
    } else {
      // If border was null, make one matching Card default, but with border
      // side, if it was not null, we leave it as it was.
      border ??= RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(useMaterial3 ? 12 : 4)),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    }

    // Get the themed or default color of all shown components' colors.
    final Color elevatedButtonColor = theme
        .elevatedButtonTheme.style?.backgroundColor
        ?.resolve(<MaterialState>{}) ??
        (useMaterial3 ? colorScheme.surface : colorScheme.primary);
    final Color elevatedForegroundButtonColor = theme
        .elevatedButtonTheme.style?.foregroundColor
        ?.resolve(<MaterialState>{}) ??
        (useMaterial3 ? colorScheme.primary : colorScheme.onPrimary);
    final Color filledButtonColor = theme
        .filledButtonTheme.style?.backgroundColor
        ?.resolve(<MaterialState>{}) ??
        colorScheme.primary;
    final Color tonalButtonColor = theme
        .filledButtonTheme.style?.backgroundColor
        ?.resolve(<MaterialState>{}) ??
        colorScheme.secondaryContainer;
    final Color outlinedButtonColor = theme
        .outlinedButtonTheme.style?.foregroundColor
        ?.resolve(<MaterialState>{}) ??
        colorScheme.primary;
    final Color textButtonColor = theme.textButtonTheme.style?.foregroundColor
        ?.resolve(<MaterialState>{}) ??
        colorScheme.primary;
    final Color toggleButtonsColor =
        theme.toggleButtonsTheme.color ?? colorScheme.primary;
    final Color floatingActionButtonColor =
        theme.floatingActionButtonTheme.backgroundColor ??
            (theme.useMaterial3
                ? colorScheme.primaryContainer
                : colorScheme.secondary);
    final Color onFloatingActionButtonColor =
        theme.floatingActionButtonTheme.foregroundColor ??
            (useMaterial3
                ? theme.colorScheme.onPrimaryContainer
                : _onColor(floatingActionButtonColor, background));
    final Color switchColor = theme.switchTheme.thumbColor
        ?.resolve(<MaterialState>{MaterialState.selected}) ??
        (theme.useMaterial3 ? colorScheme.primary : colorScheme.secondary);
    final Color checkboxColor = theme.checkboxTheme.fillColor
        ?.resolve(<MaterialState>{MaterialState.selected}) ??
        (theme.useMaterial3 ? colorScheme.primary : colorScheme.secondary);
    final Color radioColor = theme.radioTheme.fillColor
        ?.resolve(<MaterialState>{MaterialState.selected}) ??
        (theme.useMaterial3 ? colorScheme.primary : colorScheme.secondary);
    final Color circleAvatarColor = useMaterial3
        ? theme.colorScheme.primaryContainer
        : isDark
        ? theme.primaryColorLight
        : theme.primaryColorDark;
    final Color onCircleAvatarColor = useMaterial3
        ? theme.colorScheme.onPrimaryContainer
        : _onColor(circleAvatarColor, background);
    final Color chipColor =
        theme.chipTheme.backgroundColor ?? colorScheme.primary;
    final Color inputDecoratorColor =
        theme.inputDecorationTheme.focusColor?.withAlpha(0xFF) ??
            colorScheme.primary;
    final Decoration? tooltipDecoration = theme.tooltipTheme.decoration;
    final Color tooltipColor = tooltipDecoration is BoxDecoration
        ? tooltipDecoration.color ??
        (isDark
            ? Colors.white.withOpacity(0.9)
            : Colors.grey[700]!.withOpacity(0.9))
        : (isDark
        ? Colors.white.withOpacity(0.9)
        : Colors.grey[700]!.withOpacity(0.9));
    final Color appBarColor = theme.appBarTheme.backgroundColor ??
        (isDark ? colorScheme.surface : colorScheme.primary);
    final Color tabBarColor = theme.tabBarTheme.labelColor ??
        (isDark ? colorScheme.onSurface : colorScheme.onPrimary);
    final Color dialogColor =
        theme.dialogTheme.backgroundColor ?? theme.dialogBackgroundColor;
    final Color defaultSnackBackgroundColor = isDark
        ? colorScheme.onSurface
        : Color.alphaBlend(
        colorScheme.onSurface.withOpacity(0.80), colorScheme.surface);
    final Color snackBarColor =
        theme.snackBarTheme.backgroundColor ?? defaultSnackBackgroundColor;
    final Color snackForeground = theme.snackBarTheme.contentTextStyle?.color ??
        (ThemeData.estimateBrightnessForColor(snackBarColor) == Brightness.light
            ? Colors.black
            : Colors.white);
    final Color bottomNavBarColor =
        theme.bottomNavigationBarTheme.backgroundColor ??
            colorScheme.background;
    final Color bottomNavBarItemColor =
        theme.bottomNavigationBarTheme.selectedItemColor ??
            (isDark ? colorScheme.secondary : colorScheme.primary);
    final Color navigationBarColor = theme.navigationBarTheme.backgroundColor ??
        (useMaterial3
            ? ElevationOverlay.colorWithOverlay(
            colorScheme.surface, colorScheme.primary, 3.0)
            : ElevationOverlay.colorWithOverlay(
            colorScheme.surface, colorScheme.onSurface, 3.0));
    final Color navigationBarItemColor = theme.navigationBarTheme.iconTheme
        ?.resolve(<MaterialState>{MaterialState.selected})?.color ??
        (useMaterial3
            ? colorScheme.onSecondaryContainer
            : colorScheme.onSurface);
    final Color navigationBarIndicatorColor =
        theme.navigationBarTheme.indicatorColor ??
            (useMaterial3
                ? colorScheme.secondaryContainer
                : colorScheme.secondary.withOpacity(.24));
    final Color navigationRailColor =
        theme.navigationRailTheme.backgroundColor ?? colorScheme.surface;
    final Color navigationRailItemColor = theme
        .navigationRailTheme.selectedIconTheme?.color ??
        (useMaterial3 ? colorScheme.onSecondaryContainer : colorScheme.primary);
    final Color navigationRailIndicatorColor =
        theme.navigationRailTheme.indicatorColor ??
            (useMaterial3
                ? colorScheme.onSecondaryContainer
                : colorScheme.secondary.withOpacity(.24));
    final Color textColor = theme.textTheme.titleMedium?.color ??
        (isDark ? Colors.white : Colors.black);
    final Color primTextColor = theme.primaryTextTheme.titleMedium?.color ??
        (ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
            Brightness.dark
            ? Colors.white
            : Colors.black);

    // Wrap this widget branch in a custom theme where card has a border outline
    // if it did not have one, but retains in ambient themed border radius.
    return Theme(
      data: theme.copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 0,
          shape: border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (showTitle)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                context.tr!.componentColors,
                style: theme.textTheme.titleMedium,
              ),
            ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: spacing,
            runSpacing: spacing,
            children: <Widget>[
              ColorCard(
                label: context.tr!.labelElevatedButton,
                color: elevatedButtonColor,
                textColor: elevatedForegroundButtonColor,
                elevation: useMaterial3 ? 2 : null,
                shadowColor: Colors.transparent,
              ),
              ColorCard(
                label: context.tr!.filledButton,
                color: filledButtonColor,
                textColor: _onColor(filledButtonColor, background),
              ),
              ColorCard(
                label: context.tr!.labelTonalButton,
                color: tonalButtonColor,
                textColor: _onColor(tonalButtonColor, background),
              ),
              ColorCard(
                label: context.tr!.labelOutlineButton,
                color: colorScheme.surface,
                textColor: outlinedButtonColor,
              ),
              ColorCard(
                label: context.tr!.labelTextButton,
                color: colorScheme.surface,
                textColor: textButtonColor,
              ),
              ColorCard(
                label: context.tr!.labelToggleButtons,
                color: toggleButtonsColor,
                textColor: _onColor(toggleButtonsColor, background),
              ),
              ColorCard(
                label: context.tr!.labelSwitch,
                color: switchColor,
                textColor: _onColor(switchColor, background),
              ),
              ColorCard(
                label: context.tr!.labelCheckbox,
                color: checkboxColor,
                textColor: _onColor(checkboxColor, background),
              ),
              ColorCard(
                label: context.tr!.labelRadio,
                color: radioColor,
                textColor: _onColor(radioColor, background),
              ),
              ColorCard(
                label: context.tr!.labelFloatingActionButton,
                color: floatingActionButtonColor,
                textColor: onFloatingActionButtonColor,
              ),
              ColorCard(
                label: context.tr!.labelCircleAvatar,
                color: circleAvatarColor,
                textColor: onCircleAvatarColor,
              ),
              ColorCard(
                label: context.tr!.labelChips,
                color: chipColor,
                textColor: _onColor(chipColor, background),
              ),
              ColorCard(
                label: context.tr!.labelInputDecorator,
                color: inputDecoratorColor,
                textColor: _onColor(inputDecoratorColor, background),
              ),
              ColorCard(
                label: context.tr!.labelTooltip,
                color: tooltipColor,
                textColor: _onColor(tooltipColor, background),
              ),
              ColorCard(
                label: context.tr!.appBar,
                color: appBarColor,
                textColor: _onColor(appBarColor, background),
              ),
              ColorCard(
                label: context.tr!.labelTabBarItem,
                color: tabBarColor,
                textColor: _onColor(tabBarColor, background),
              ),
              ColorCard(
                label: context.tr!.labelTabBarIndicator,
                color: theme.indicatorColor,
                textColor: _onColor(theme.indicatorColor, background),
              ),
              ColorCard(
                label: context.tr!.labelDialogBackground,
                color: dialogColor,
                textColor: _onColor(dialogColor, background),
              ),
              ColorCard(
                label: context.tr!.labelSnackBarBackground,
                color: snackBarColor,
                textColor: snackForeground,
              ),
              ColorCard(
                label: context.tr!.labelBottomNaviBarBackground,
                color: bottomNavBarColor,
                textColor: _onColor(bottomNavBarColor, background),
              ),
              ColorCard(
                label: context.tr!.labelBottomNaviBarSelected,
                color: bottomNavBarItemColor,
                textColor: _onColor(bottomNavBarItemColor, background),
              ),
              ColorCard(
                label: context.tr!.labelNavigationBarBackground,
                color: navigationBarColor,
                textColor: _onColor(navigationBarColor, background),
              ),
              ColorCard(
                label: context.tr!.labelNavigationBarSelected,
                color: navigationBarItemColor,
                textColor: _onColor(navigationBarItemColor, background),
              ),
              ColorCard(
                label: context.tr!.labelNavigationBarIndicator,
                color: navigationBarIndicatorColor,
                textColor: _onColor(navigationBarIndicatorColor, background),
              ),
              ColorCard(
                label: context.tr!.labelNavigationRailBackground,
                color: navigationRailColor,
                textColor: _onColor(navigationRailColor, background),
              ),
              ColorCard(
                label: context.tr!.labelNavigationRailSelected,
                color: navigationRailItemColor,
                textColor: _onColor(navigationRailItemColor, background),
              ),
              ColorCard(
                label: context.tr!.labelNavigationRailIndicator,
                color: navigationRailIndicatorColor,
                textColor: _onColor(navigationRailIndicatorColor, background),
              ),
              ColorCard(
                label: context.tr!.labelTextTheme,
                color: textColor,
                textColor: _onColor(textColor, background),
              ),
              ColorCard(
                label: context.tr!.labelPrimaryTextTheme,
                color: primTextColor,
                textColor: _onColor(primTextColor, background),
              ),
              ColorCard(
                label: context.tr!.labelCard,
                color: theme.cardColor,
                textColor: colorScheme.onSurface,
              ),
              ColorCard(
                label: context.tr!.labelDisabledColor,
                color: theme.disabledColor,
                textColor: _onColor(theme.disabledColor, background),
              ),
              ColorCard(
                label: context.tr!.labelHoverColor,
                color: theme.hoverColor,
                textColor: _onColor(theme.hoverColor, background),
              ),
              ColorCard(
                label: context.tr!.labelFocusColor,
                color: theme.focusColor,
                textColor: _onColor(theme.focusColor, background),
              ),
              ColorCard(
                label: context.tr!.labelHighlightColor,
                color: theme.highlightColor,
                textColor: _onColor(theme.highlightColor, background),
              ),
              ColorCard(
                label: context.tr!.labelSplashColor,
                color: theme.splashColor,
                textColor: _onColor(theme.splashColor, background),
              ),
            ],
          ),
        ],
      ),
    );
  }
}