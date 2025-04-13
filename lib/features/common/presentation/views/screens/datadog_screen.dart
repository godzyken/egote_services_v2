import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/providers/watchdog/datadog_config.dart';

class DatadogScreen extends ConsumerWidget {
  const DatadogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, watch, child) {
        final datadogStream = ref.watch(datadogStreamProvider);
        return datadogStream.when(
          data: (message) => Text('Message reçu : $message'),
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => Text('Erreur : $e'),
        );
      },
    );
  }
}
