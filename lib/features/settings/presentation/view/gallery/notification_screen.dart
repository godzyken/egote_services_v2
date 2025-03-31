import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../config/providers/permissions/device_permissions_providers.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenir l'état des permissions depuis le provider
    final permissionStatus = ref.watch(permissionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions de Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vérification des permissions des notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Afficher le statut de la permission de notification
            _buildPermissionStatus(
                'Notifications', Permission.notification, permissionStatus),
            const SizedBox(height: 20),
            // Boutons pour demander ou révoquer la permission
            ElevatedButton(
              onPressed: () {
                ref
                    .read(permissionNotifierProvider.notifier)
                    .requestPermission(Permission.notification);
              },
              child: const Text('Demander permission Notifications'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(permissionNotifierProvider.notifier)
                    .revokeNotificationPermission();
              },
              child: const Text('Révoquer permission Notifications'),
            ),
          ],
        ),
      ),
    );
  }

  // Afficher le statut de la permission pour chaque appareil
  Widget _buildPermissionStatus(String name, Permission permission,
      Map<Permission, PermissionStatus> permissionStatus) {
    final status = permissionStatus[permission] ?? PermissionStatus.denied;
    String statusText;

    switch (status) {
      case PermissionStatus.granted:
        statusText = 'Accordé';
        break;
      case PermissionStatus.denied:
        statusText = 'Non accordé';
        break;
      case PermissionStatus.permanentlyDenied:
        statusText = 'Permanemment refusé';
        break;
      case PermissionStatus.restricted:
        statusText = 'Restreint';
        break;
      case PermissionStatus.provisional:
        statusText = 'Indéterminé';
        break;
      case PermissionStatus.limited:
        statusText = 'limité';
        break;
    }

    return ListTile(
      leading: Icon(_getPermissionIcon(permission)),
      title: Text('$name : $statusText'),
    );
  }

  // Récupérer l'icône correspondante à chaque permission
  IconData _getPermissionIcon(Permission permission) {
    if (permission == Permission.notification) {
      return Icons.notifications;
    } else {
      return Icons.help;
    }
  }
}
