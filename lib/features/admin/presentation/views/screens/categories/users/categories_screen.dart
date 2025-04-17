import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../auth/domain/entities/admin/admin_user.dart';

class AdminCategoriesScreen extends ConsumerWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final admin = ref.watch(adminUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Categories - ${admin.name}')),
      body: const Center(child: Text('Manage Categories')),
    );
  }
}
