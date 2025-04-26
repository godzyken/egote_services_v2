import 'package:egote_services_v2/features/auth/application/providers/app_user_provider.dart';
import 'package:egote_services_v2/features/auth/application/wrapper/adapter/app_user.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum pour définir les permissions
enum Permissions { read, write, admin }

// State qui garde les permissions de l'utilisateur
class UserPermissions {
  final Set<Permissions> permissions;
  final UserLevel level;
  UserPermissions({required this.permissions, required this.level});

  bool hasPermission(Permissions permission) {
    return permissions.contains(permission);
  }
}

// Provider pour gérer les permissions
final permissionProvider = StateProvider<UserPermissions>((ref) {
  // Ici, vous pouvez initialiser les permissions de l'utilisateur
  final role = ref.watch(appUserProvider);
  if (role == null) {
    return UserPermissions(permissions: {}, level: UserLevel.guest);
  }
  // Par défaut, l'utilisateur n'a aucune permission.
  return UserPermissions(permissions: {}, level: role.level);
});

// Simulons une fonction qui récupère le rôle de l'utilisateur de manière asynchrone
Future<Permissions> fetchUserRole(UserModel user) async {
  // Simulons une requête qui récupère le rôle de l'utilisateur
  final permission = await Future.delayed(
      Duration(seconds: 1),
      () => user.userEntityModel.role == userRoleProvider.name
          ? Permissions.read
          : Permissions.write); // Simuler une attente
  return permission; // Exemple : l'utilisateur a le rôle "user"
}

// Provider qui renvoie le rôle de l'utilisateur
final userRoleProvider = FutureProvider<Permissions>((ref) async {
  final permission = ref.watch(userNotifierProvider.select((value) =>
      value.role == permissionProvider.name!
          ? Permissions.read
          : Permissions.write));

  return await Future.delayed(Duration(seconds: 1), () => permission);
});
