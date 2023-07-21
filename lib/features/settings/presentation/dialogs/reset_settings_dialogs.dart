import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
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
      title: Text('${context.tr!.reset} ${context.tr!.themeSettings}'),
      content: Text('${context.tr!.resetAll} $usedDb ${context.tr!.alertDialogContent}'),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              context.pop(false);
            },
            child: Text(context.tr!.cancel)),
        TextButton(
            onPressed: () {
              context.pop(true);
            },
            child: Text(context.tr!.reset)),
      ],
    );
  }
}