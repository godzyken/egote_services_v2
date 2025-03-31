import 'package:egote_services_v2/config/providers/permissions/device_permissions_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends ConsumerWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionState = ref.watch(permissionNotifierProvider);

    return Scaffold(
        appBar: AppBar(title: Text('Demander des autorisations')),
        body: ListView(
          children: permissionState.entries.map((entry) {
            return ListTile(
              title: Text(entry.key.toString().split('.').last),
              subtitle: Text(entry.value.toString()),
              trailing: Icon(entry.value == PermissionStatus.granted
                  ? Icons.check
                  : Icons.close),
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Demande de toutes les permissions
            await ref
                .read(permissionNotifierProvider.notifier)
                .requestAllPermissions();
          },
          child: Text('Demander toutes les autorisations'),
        ));
  }
}
