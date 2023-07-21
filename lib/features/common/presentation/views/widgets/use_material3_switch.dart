import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class UseMaterial3Switch extends ConsumerWidget {
  const UseMaterial3Switch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      title: Text(context.tr!.useMaterial3Title),
      value: ref.watch(Settings.useMaterial3Provider),
      onChanged: ref.read(Settings.useMaterial3Provider.notifier).set,
    );
  }
}