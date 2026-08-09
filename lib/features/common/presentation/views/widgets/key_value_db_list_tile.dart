import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/controllers/used_key_value_db_provider.dart';
import '../../../domain/values/used_key_value_db.dart';

class KeyValueDbListTile extends ConsumerWidget {
  const KeyValueDbListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Écoute de l'état actuel de l'implémentation KeyValueDb
    final UsedKeyValueDb currentDb = ref.watch(usedKeyValueDbNotifierProvider);

    return ListTile(
      title: Text('${context.tr?.storage}'),
      subtitle: Text(currentDb.describe),
      trailing: const KeyValueDbToggleButtons(),
      onTap: () {
        // Obtenir le Notifier pour modifier l'état
        final notifier = ref.read(usedKeyValueDbNotifierProvider.notifier);

        // Définir la valeur suivante lors d'un appui (cycle à travers les options)
        switch (currentDb) {
          case UsedKeyValueDb.memory:
            notifier.selectDb(UsedKeyValueDb.sharedPreferences);
            break;
          case UsedKeyValueDb.sharedPreferences:
            notifier.selectDb(UsedKeyValueDb.hive);
            break;
          case UsedKeyValueDb.hive:
            notifier.selectDb(UsedKeyValueDb.memory);
            break;
        }
      },
    );
  }
}