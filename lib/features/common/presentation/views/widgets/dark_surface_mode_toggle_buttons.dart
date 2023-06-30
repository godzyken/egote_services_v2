import 'package:egote_services_v2/features/common/presentation/views/widgets/surface_mode_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class DarkSurfaceModeToggleButtons extends ConsumerWidget {
  const DarkSurfaceModeToggleButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SurfaceModeToggleButtons(
      mode: ref.watch(Settings.darkSurfaceModeProvider),
      onChanged: ref.read(Settings.darkSurfaceModeProvider.notifier).set,
    );
  }
}