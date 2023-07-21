import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

@immutable
class DarkSurfaceModePopupMenu extends ConsumerWidget {
  const DarkSurfaceModePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SurfaceModePopupMenu(
        title: Text(context.tr!.darkThemeSurfaceMode),
        index: ref.watch(Settings.darkSurfaceModeProvider).index,
        onChanged: (int index) {
          ref
              .read(Settings.darkSurfaceModeProvider.notifier)
              .set(FlexSurfaceMode.values[index]);
        });
  }
}