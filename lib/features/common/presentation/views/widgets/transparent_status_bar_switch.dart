import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class TransparentStatusBarSwitch extends ConsumerWidget {
  const TransparentStatusBarSwitch({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return SwitchListTile(
      title: Text(context.tr!.switchNoStatusBar),
      subtitle: Text(context.tr!.switchOnlyAndroid),
      value: ref.watch(Settings.transparentStatusBarProvider),
      onChanged: ref.read(Settings.transparentStatusBarProvider.notifier).set,
    );
  }
}