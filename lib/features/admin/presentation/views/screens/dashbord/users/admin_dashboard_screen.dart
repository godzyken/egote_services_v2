import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../auth/domain/entities/admin/admin_user.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final admin = ref.watch(adminUserProvider);

    return Center(
      child: Text('Dashboard 🧠- Welcome ${admin.name}'),
    );
  }
}
