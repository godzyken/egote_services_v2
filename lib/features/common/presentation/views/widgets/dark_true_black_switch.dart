import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class DarkIsTrueBlackSwitch extends ConsumerWidget {
  const DarkIsTrueBlackSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      title: Text(context.tr!.useTrueBlack),
      value: ref.watch(Settings.darkIsTrueBlackProvider),
      onChanged: ref.read(Settings.darkIsTrueBlackProvider.notifier).set,
    );
  }
}