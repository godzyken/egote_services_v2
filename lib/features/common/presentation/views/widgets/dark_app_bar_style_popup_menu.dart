import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';
import '../../../../theme/models/custom_themes.dart';
import 'app_bar_style_popup_menu.dart';

@immutable
class DarkAppBarStylePopupMenu extends ConsumerWidget {
  const DarkAppBarStylePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBarStylePopupMenu(
      title: Text(context.tr!.darkAppBarStyle),
      labelForDefault: context.tr!.defaultLabel,
      index: ref.watch(Settings.darkAppBarStyleProvider)?.index ?? -1,
      onChanged: (int index) {
        if (index < 0 || index >= FlexAppBarStyle.values.length) {
          ref.read(Settings.darkAppBarStyleProvider.notifier).set(null);
        } else {
          ref
              .read(Settings.darkAppBarStyleProvider.notifier)
              .set(FlexAppBarStyle.values[index]);
        }
      },
      customAppBarColor: CustomThemes
          .schemes[ref.watch(Settings.schemeIndexProvider)].dark.appBarColor,
      customScaffoldColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}