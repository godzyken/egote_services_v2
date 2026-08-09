import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/platform/platform_provider.dart';
import '../../../../common/presentation/controller/providers/custom_drawer/drawer_width_provider.dart';
import '../../../../settings/controllers/settings.dart';
import '../../../models/custom_themes.dart';
import '../../../models/flex_tone.dart';

/// Le provider pour le thème clair [ThemeData].
///
/// Il écoute réactivement l'ensemble des paramètres [Settings] pour régénérer
/// le [ThemeData] clair dès qu'un réglage est modifié.
final lightThemeProvider = Provider<ThemeData>(
      (ref) {
    // Calcul sécurisé de la configuration FlexTones à partir de l'index
    final bool useSeed = ref.watch(Settings.usePrimaryKeyColorProvider);
    final int flexTone = ref.watch(Settings.usedFlexToneProvider);
    final int usedFlexTone =
    flexTone < 0 || flexTone >= FlexTone.values.length || !useSeed
        ? 0
        : flexTone;

    return CustomThemes.light(
      useMaterial3: ref.watch(Settings.useMaterial3Provider),
      usedTheme: ref.watch(Settings.schemeIndexProvider),
      swapColors: ref.watch(Settings.lightSwapColorsProvider),
      surfaceMode: ref.watch(Settings.lightSurfaceModeProvider),
      blendLevel: ref.watch(Settings.lightBlendLevelProvider),
      //
      usePrimaryKeyColor: useSeed,
      useSecondaryKeyColor: ref.watch(Settings.useSecondaryKeyColorProvider),
      useTertiaryKeyColor: ref.watch(Settings.useTertiaryKeyColorProvider),
      usedFlexTone: usedFlexTone,
      //
      drawerWidth: ref.watch(drawerWidthProvider),
      //
      appBarElevation: ref.watch(Settings.appBarElevationProvider),
      appBarStyle: ref.watch(Settings.lightAppBarStyleProvider),
      appBarOpacity: ref.watch(Settings.lightAppBarOpacityProvider),
      transparentStatusBar: ref.watch(Settings.transparentStatusBarProvider),
      //
      useSubTheme: ref.watch(Settings.useSubThemesProvider),
      defaultRadius: ref.watch(Settings.defaultRadiusProvider),
      //
      platform: ref.watch(platformNotifierProvider),
    );
  },
  name: 'lightThemeProvider',
);

/// Le provider pour le thème sombre [ThemeData].
final darkThemeProvider = Provider<ThemeData>(
      (ref) {
    // Calcul sécurisé de la configuration FlexTones à partir de l'index
    final bool useSeed = ref.watch(Settings.usePrimaryKeyColorProvider);
    final int flexTone = ref.watch(Settings.usedFlexToneProvider);
    final int usedFlexTone =
    flexTone < 0 || flexTone >= FlexTone.values.length || !useSeed
        ? 0
        : flexTone;

    return CustomThemes.dark(
      useMaterial3: ref.watch(Settings.useMaterial3Provider),
      usedTheme: ref.watch(Settings.schemeIndexProvider),
      swapColors: ref.watch(Settings.darkSwapColorsProvider),
      surfaceMode: ref.watch(Settings.darkSurfaceModeProvider),
      blendLevel: ref.watch(Settings.darkBlendLevelProvider),
      //
      usePrimaryKeyColor: useSeed,
      useSecondaryKeyColor: ref.watch(Settings.useSecondaryKeyColorProvider),
      useTertiaryKeyColor: ref.watch(Settings.useTertiaryKeyColorProvider),
      usedFlexTone: usedFlexTone,
      //
      drawerWidth: ref.watch(drawerWidthProvider),
      //
      appBarElevation: ref.watch(Settings.appBarElevationProvider),
      appBarStyle: ref.watch(Settings.darkAppBarStyleProvider),
      appBarOpacity: ref.watch(Settings.darkAppBarOpacityProvider),
      transparentStatusBar: ref.watch(Settings.transparentStatusBarProvider),
      //
      darkIsTrueBlack: ref.watch(Settings.darkIsTrueBlackProvider),
      computeDark: ref.watch(Settings.darkComputeThemeProvider),
      darkLevel: ref.watch(Settings.darkComputeLevelProvider),
      //
      useSubTheme: ref.watch(Settings.useSubThemesProvider),
      defaultRadius: ref.watch(Settings.defaultRadiusProvider),
      //
      platform: ref.watch(platformNotifierProvider),
    );
  },
  name: 'darkThemeProvider',
);