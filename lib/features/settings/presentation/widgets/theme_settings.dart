
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/app_shared/universal/animated_hide.dart';
import '../../../common/presentation/extensions/extensions.dart';
import '../../../theme/models/flex_tone.dart';
import '../../controllers/settings.dart';

/// A Column widget that allows us to change all app used theme settings.
///
/// The widgets we use to control the theme use Riverpod StateNotifierProviders.
/// The StateNotifierProviders persist their settings with selected
/// KeyValueDb implementation. They also modify the theme provider and thus
/// change the theme interactively.
///
/// The Flutter SDK theme handles the animation between theme changes, its
/// properties lerp between values and use animated theme automatically.
class ThemeSettings extends ConsumerWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final bool useSubThemes = ref.watch(Settings.useSubThemesProvider);
    final bool useSeed = ref.watch(Settings.usePrimaryKeyColorProvider);
    final int flexTone = ref.watch(Settings.usedFlexToneProvider);
    final int usedFlexTone =
    flexTone < 0 || flexTone >= FlexTone.values.length || !useSeed
        ? 0
        : flexTone;

    final String explainM3Surface = useSeed
        ? context.tr!.useLevelZero
        : '';

    return Column(
      children: <Widget>[
        ThemeModeListTile(title: Text(context.tr!.themeModeTitle)),
        const UseMaterial3Switch(),
        UseSubThemesListTile(
          title: Text(context.tr!.useSubThemesTitle),
          subtitle: Text(context.tr!.useSubThemesSubTitle),
        ),
        AnimatedHide(
          hide: !useSubThemes,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(context.tr!.useThemesTitle),
                subtitle: Text(
                    context.tr!.useThemesSubTitle),
              ),
              const DefaultBorderRadiusSlider(),
            ],
          ),
        ),
        const Divider(),
        const ThemePopupMenu(),
        if (isLight)
          const LightColorsSwapSwitch()
        else
          const DarkColorsSwapSwitch(),
        const Divider(),

        const ListTileExplainUsedSeed(),
        const ListTile(trailing: UseKeyColorsToggleButtons()),
        AnimatedHide(
          hide: !useSeed,
          child: Column(
            children: <Widget>[
              ListTile(
                subtitle: Text(
                    context.tr!.useSeedSubTitle),
              ),
              FlexToneConfigPopupMenu(
                title: context.tr!.flexTonesTitle1,
                index: useSeed ? usedFlexTone : 0,
                onChanged: useSeed
                    ? ref.read(Settings.usedFlexToneProvider.notifier).set
                    : null,
              ),
              ListTile(
                title: Text('${FlexTone.values[usedFlexTone].tone}'
                    ' ${context.tr!.flexTonesTitle2}'),
                subtitle: Text(FlexTone.values[usedFlexTone].setup),
              ),
            ],
          ),
        ),
        // Hide the extra dark mode controls in light theme.
        AnimatedHide(
          hide: isLight,
          child: Column(
            children: <Widget>[
              const DarkIsTrueBlackSwitch(),
              AnimatedHide(
                hide: useSeed,
                child: const DarkComputeThemeSwitch(),
              ),
              const DarkLevelSlider(),
            ],
          ),
        ),
        const Divider(),
        if (isLight) ...<Widget>[
          const LightSurfaceModePopupMenu(),
          const LightSurfaceModeListTile(),
          ListTile(
            title: Text(context.tr!.lightThemeSurfaceBlend),
            //TODO: verify
            subtitle: Text('${context.tr!.lightThemeSurfaceBlendSubTitle}$explainM3Surface'),
          ),
          const LightSurfaceBlendLevelSlider(),
        ] else ...<Widget>[
          const DarkSurfaceModePopupMenu(),
          const DarkSurfaceModeListTile(),
          ListTile(
            title: Text(context.tr!.darkSurfaceBlendTitle),
            subtitle: Text('${context.tr!.darkSurfaceBlendSubTitle}$explainM3Surface'),
          ),
          const DarkSurfaceBlendLevelSlider(),
        ],
        const Divider(),
        const AppBarElevationSlider(),
        if (isLight) ...<Widget>[
          const LightAppBarStylePopupMenu(),
          const LightAppBarOpacitySlider(),
        ] else ...<Widget>[
          const DarkAppBarStylePopupMenu(),
          const DarkAppBarOpacitySlider(),
        ],
        const TransparentStatusBarSwitch(),
      ],
    );
  }
}