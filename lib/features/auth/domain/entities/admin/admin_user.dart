import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminUser {
  final String id;
  final String name;
  final String email;

  AdminUser({
    required this.id,
    required this.name,
    required this.email,
  });
}

final adminUserProvider = Provider<AdminUser>((ref) {
  return AdminUser(
    id: 'admin_001',
    name: 'Admin Master',
    email: 'john.archibald.campbell@example-pet-store.com',
  );
});
