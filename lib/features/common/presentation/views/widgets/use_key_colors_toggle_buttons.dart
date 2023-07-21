import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class UseKeyColorsToggleButtons extends ConsumerWidget {
  const UseKeyColorsToggleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool useSeed = ref.watch(Settings.usePrimaryKeyColorProvider);
    final bool useSecondary = ref.watch(Settings.useSecondaryKeyColorProvider);
    final bool useTertiary = ref.watch(Settings.useTertiaryKeyColorProvider);
    final List<bool> isSelected = <bool>[
      useSeed,
      useSeed && useSecondary,
      useSeed && useTertiary,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int index) {
        if (index == 0) {
          ref
              .read(Settings.usePrimaryKeyColorProvider.notifier)
              .set(!ref.read(Settings.usePrimaryKeyColorProvider));
        }
        if (index == 1 && useSeed) {
          ref
              .read(Settings.useSecondaryKeyColorProvider.notifier)
              .set(!ref.read(Settings.useSecondaryKeyColorProvider));
        }
        if (index == 2 && useSeed) {
          ref
              .read(Settings.useTertiaryKeyColorProvider.notifier)
              .set(!ref.read(Settings.useTertiaryKeyColorProvider));
        }
      },
      children: <Widget>[
        Tooltip(
          message: context.tr!.ukctbTooltipMessP,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(context.tr!.labelPrimary, style: const TextStyle(fontSize: 12)),
          ),
        ),
        Visibility(
          visible: useSeed,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: Tooltip(
            message: context.tr!.ukctbTooltipMessS,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(context.tr!.labelSecondary, style: const TextStyle(fontSize: 12)),
            ),
          ),
        ),
        Visibility(
          visible: useSeed,
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          child: Tooltip(
            message: context.tr!.ukctbTooltipMessT,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(context.tr!.labelTertiary, style: const TextStyle(fontSize: 12)),
            ),
          ),
        ),
      ],
    );
  }
}

/// A list tile to explain the currently used M3 seeded ColorScheme mode.
class ListTileExplainUsedSeed extends ConsumerWidget {
  const ListTileExplainUsedSeed({
    super.key,
  });

  /// Explain the current selection of key colors used to
  /// generate the ColorScheme, when it is activated.
  String explainUsedColors(BuildContext context, WidgetRef ref) {
    final bool useSeed = ref.watch(Settings.usePrimaryKeyColorProvider);
    final bool useSecondary = ref.watch(Settings.useSecondaryKeyColorProvider);
    final bool useTertiary = ref.watch(Settings.useTertiaryKeyColorProvider);
    if (!useSeed) {
      return context.tr!.explainUsedColors1;
    }
    if (!useSecondary && !useTertiary) {
      return context.tr!.explainUsedColors2;
    }
    if (useSecondary && !useTertiary) {
      return context.tr!.explainUsedColors3;
    }
    if (!useSecondary && useTertiary) {
      return context.tr!.explainUsedColors4;
    }
    return context.tr!.explainUsedColors5;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(context.tr!.useLightThemeColors),
      subtitle: Text(explainUsedColors(context, ref)),
    );
  }
}