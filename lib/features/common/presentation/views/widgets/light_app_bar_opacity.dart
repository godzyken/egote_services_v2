import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class LightAppBarOpacitySlider extends ConsumerWidget {
  const LightAppBarOpacitySlider({super.key});
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final double opacity = ref.watch(Settings.lightAppBarOpacityProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      title: Text(context.tr!.lightAppBarOpacity),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Slider.adaptive(
              min: 0,
              max: 100,
              divisions: 100,
              label: (opacity * 100.0).floor().toString(),
              value: opacity * 100.0,
              onChanged: (final double value) {
                ref
                    .read(Settings.lightAppBarOpacityProvider.notifier)
                    .set(value / 100);
              }),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '%',
              style: textTheme.bodySmall,
            ),
            Text(
              (opacity * 100).floor().toString(),
              style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}