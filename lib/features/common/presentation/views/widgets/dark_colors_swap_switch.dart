import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class DarkColorsSwapSwitch extends ConsumerWidget {
  const DarkColorsSwapSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      title: Text(context.tr!.swapColors),
      subtitle: Text(context.tr!.swapPrimarySecondaryDarkColors),
      value: ref.watch(Settings.darkSwapColorsProvider),
      onChanged: ref.read(Settings.darkSwapColorsProvider.notifier).set,
    );
  }
}