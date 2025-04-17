import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../auth/domain/entities/admin/admin_user.dart';

class AdminSupportScreen extends ConsumerWidget {
  const AdminSupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final admin = ref.watch(adminUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Support - ${admin.name}')),
      body: const Center(child: Text('Manage Support Tickets')),
    );
  }
}
