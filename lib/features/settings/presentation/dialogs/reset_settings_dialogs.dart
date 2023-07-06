import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/application/controllers/used_key_value_db_provider.dart';

class ResetSettingsDialog extends ConsumerWidget {
  const ResetSettingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String usedDb =
        ref.watch(usedKeyValueDbProvider.notifier).state.describe;
    return AlertDialog(
      title: const Text('Reset Theme Settings'),
      content: Text('Reset all $usedDb theme settings back to their '
          'default values?\n'
          'Persisted theme settings will also be updated to default '
          'values.'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              context.pop(false);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              context.pop(true);
            },
            child: const Text('Reset')),
      ],
    );
  }
}