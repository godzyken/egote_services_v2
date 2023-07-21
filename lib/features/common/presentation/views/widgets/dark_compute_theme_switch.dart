import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';


class DarkComputeThemeSwitch extends ConsumerWidget {
  const DarkComputeThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      title: Text(context.tr!.computeDarkSchemeColors),
      subtitle: Text(
        context.tr!.darkSchemeText + context.tr!.darkSchemeTextSuit
      ),
      value: ref.watch(Settings.darkComputeThemeProvider),
      onChanged: ref.read(Settings.darkComputeThemeProvider.notifier).set,
    );
  }
}