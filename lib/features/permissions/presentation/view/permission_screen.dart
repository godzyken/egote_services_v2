import 'package:egote_services_v2/config/providers/permissions/device_permissions_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends ConsumerWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*   final permissionsController = ref.watch(permissionsControllerProvider);
    final permissionsState = ref.watch(permissionsStateProvider);*/

    final cameraPermissionStatus = ref.watch(cameraPermissionsProvider);
/*    final microphonePermissionStatus = ref.watch(microphonePermissionsProvider);
    final locationPermissionStatus = ref.watch(locationPermissionsProvider);
    final storagePermissionStatus = ref.watch(storagePermissionsProvider);*/

    return Scaffold(
        appBar: AppBar(
          title: Text('Gestion des Permissions'),
        ),
        body: buildWhenCamera(cameraPermissionStatus, ref, context));
  }

  Widget? buildWhenCamera(AsyncValue<PermissionStatus> cameraPermissionStatus,
      WidgetRef ref, BuildContext context) {
    return cameraPermissionStatus.when(
        data: (status) {
          if (status.isGranted) {
            return Text('La permission de la caméra a été accordée.');
          } else if (status.isDenied || status.isPermanentlyDenied) {
            return Center(
                child: ElevatedButton(
              onPressed: () async {
                final requestStatus =
                    await ref.read(requestCameraPermissionProvider.future);
                if (requestStatus && context.mounted) {
                  context
                      .showAlert('La permission de la caméra a été accordée.');
                }
              },
              child: Text("Demander la permission caméra"),
            ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        error: (error, stack) => Center(
              child: Text("Erreur: $error"),
            ),
        loading: () => Center(child: CircularProgressIndicator()));
  }
}
