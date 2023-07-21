import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

@immutable
class LightSurfaceModePopupMenu extends ConsumerWidget {
  const LightSurfaceModePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SurfaceModePopupMenu(
        title: Text(context.tr!.lightThemeSurfaceMode),
        index: ref.watch(Settings.lightSurfaceModeProvider).index,
        onChanged: (int index) {
          ref
              .read(Settings.lightSurfaceModeProvider.notifier)
              .set(FlexSurfaceMode.values[index]);
        });
  }
}