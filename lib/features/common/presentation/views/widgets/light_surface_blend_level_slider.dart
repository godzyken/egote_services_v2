import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../settings/controllers/settings.dart';

class LightSurfaceBlendLevelSlider extends ConsumerWidget {
  const LightSurfaceBlendLevelSlider({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextStyle style = Theme.of(context).textTheme.bodySmall!;
    final int level = ref.watch(Settings.lightBlendLevelProvider);
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Slider.adaptive(
              min: 0,
              max: 40,
              divisions: 40,
              label: level.toString(),
              value: level.toDouble(),
              onChanged: (double value) {
                ref.read(Settings.lightBlendLevelProvider.notifier).set(
                  value.toInt(),
                );
              }),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'Level',
              style: style,
            ),
            Text(
              level.toString(),
              style: style.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}