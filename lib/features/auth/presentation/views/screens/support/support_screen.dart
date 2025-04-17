import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/admin/admin_user.dart';

class SupportScreen extends ConsumerWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final admin = ref.watch(adminUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Support - Connected as ${admin.name}')),
      body: const Center(child: Text('How can we help you?')),
    );
  }
}
