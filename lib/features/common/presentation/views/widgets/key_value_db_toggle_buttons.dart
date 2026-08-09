import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/controllers/used_key_value_db_provider.dart';
import '../../../domain/values/used_key_value_db.dart';

@immutable
class KeyValueDbToggleButtons extends ConsumerWidget {
  const KeyValueDbToggleButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Écoute de l'état sélectionné
    final UsedKeyValueDb keyValueDb = ref.watch(usedKeyValueDbNotifierProvider);

    final List<bool> isSelected = <bool>[
      keyValueDb == UsedKeyValueDb.memory,
      keyValueDb == UsedKeyValueDb.sharedPreferences,
      keyValueDb == UsedKeyValueDb.hive,
    ];

    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        // Mise à jour de l'état via la méthode dédiée du Notifier
        ref
            .read(usedKeyValueDbNotifierProvider.notifier)
            .selectDb(UsedKeyValueDb.values[newIndex]);
      },
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(context.tr!.mem),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(context.tr!.prefs),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(context.tr!.hive),
        ),
      ],
    );
  }
}