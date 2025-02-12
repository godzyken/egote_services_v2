import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum pour définir les permissions
enum Permission { read, write, admin }

// State qui garde les permissions de l'utilisateur
class UserPermissions {
  final Set<Permission> permissions;
  UserPermissions({required this.permissions});

  bool hasPermission(Permission permission) {
    return permissions.contains(permission);
  }
}

// Provider pour gérer les permissions
final permissionProvider = StateProvider<UserPermissions>((ref) {
  // Par défaut, l'utilisateur n'a aucune permission.
  return UserPermissions(permissions: {});
});

// Simulons une fonction qui récupère le rôle de l'utilisateur de manière asynchrone
Future<Permission> fetchUserRole(UserModel user) async {
  // Simulons une requête qui récupère le rôle de l'utilisateur
  final permission = await Future.delayed(
      Duration(seconds: 1),
      () => user.userEntityModel.role == userRoleProvider.name
          ? Permission.read
          : Permission.write); // Simuler une attente
  return permission; // Exemple : l'utilisateur a le rôle "user"
}

// Provider qui renvoie le rôle de l'utilisateur
final userRoleProvider = FutureProvider<Permission>((ref) async {
  final permission = ref.watch(userNotifierProvider.select((value) =>
      value.role == permissionProvider.name!
          ? Permission.read
          : Permission.write));

  return await Future.delayed(Duration(seconds: 1), () => permission);
});
