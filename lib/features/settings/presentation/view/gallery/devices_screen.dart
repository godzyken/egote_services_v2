import 'package:egote_services_v2/config/providers/permissions/device_permissions_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class DevicesScreen extends ConsumerWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtenir l'état des permissions depuis le provider
    final permissionStatus = ref.watch(permissionNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions des appareils'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Vérification des permissions des appareils',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Afficher les statuts des permissions
            _buildPermissionStatus(
                'Caméra', Permission.camera, permissionStatus),
            _buildPermissionStatus(
                'Microphone', Permission.microphone, permissionStatus),
            _buildPermissionStatus(
                'Stockage', Permission.storage, permissionStatus),
            const SizedBox(height: 20),
            // Boutons pour demander les permissions
            ElevatedButton(
              onPressed: () {
                ref
                    .read(permissionNotifierProvider.notifier)
                    .requestAllPermissions();
              },
              child: const Text('Demander toutes les permissions'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(permissionNotifierProvider.notifier)
                    .requestPermission(Permission.camera);
              },
              child: const Text('Demander permission Caméra'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(permissionNotifierProvider.notifier)
                    .requestPermission(Permission.microphone);
              },
              child: const Text('Demander permission Microphone'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(permissionNotifierProvider.notifier)
                    .requestPermission(Permission.storage);
              },
              child: const Text('Demander permission Stockage'),
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
        statusText = "limited";
        break;
    }

    return ListTile(
      leading: Icon(_getPermissionIcon(permission)),
      title: Text('$name : $statusText'),
    );
  }

  // Récupérer l'icône correspondante à chaque permission
  IconData _getPermissionIcon(Permission permission) {
    if (permission == Permission.camera) {
      return Icons.camera_alt;
    } else if (permission == Permission.microphone) {
      return Icons.mic;
    } else if (permission == Permission.storage) {
      return Icons.storage;
    } else {
      return Icons.help;
    }
  }
}
