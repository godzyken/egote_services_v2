import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class LightColorsSwapSwitch extends ConsumerWidget {
  const LightColorsSwapSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      title: Text(context.tr!.swapColors),
      subtitle: Text(context.tr!.swapPrimarySecondaryLightColors),
      value: ref.watch(Settings.lightSwapColorsProvider),
      onChanged: ref.read(Settings.lightSwapColorsProvider.notifier).set,
    );
  }
}