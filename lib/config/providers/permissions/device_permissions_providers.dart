import 'dart:developer' as devtools show log;

import 'package:egote_services_v2/config/providers/permissions/permission_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

// Provider générique pour gérer les permissions
final permissionProvider = FutureProvider.family<PermissionStatus, Permission>(
    (ref, permission) async {
  final status = await permission.status;
  return status;
});

// Provider générique pour demander des permissions
final requestPermissionProvider =
    FutureProvider.family<bool, Permission>((ref, permission) async {
  final status = await permission.request();
  return status.isGranted;
});

// Exemple de gestion de la permission de la caméra
final cameraPermissionsProvider = permissionProvider(Permission.camera);
final requestCameraPermissionProvider =
    requestPermissionProvider(Permission.camera);

// Exemple de gestion de la permission de localisation
final locationPermissionsProvider = permissionProvider(Permission.location);
final requestLocationPermissionProvider =
    requestPermissionProvider(Permission.location);

// Exemple de gestion de la permission du microphone
final microphonePermissionsProvider = permissionProvider(Permission.microphone);
final requestMicrophonePermissionProvider =
    requestPermissionProvider(Permission.microphone);

// Exemple de gestion de la permission du stockage
final storagePermissionsProvider = permissionProvider(Permission.storage);
final requestStoragePermissionProvider =
    requestPermissionProvider(Permission.storage);

// Exemple de gestion de la permission du Bluetooth
final bluetoothPermissionsProvider = permissionProvider(Permission.bluetooth);
final requestBluetoothPermissionProvider =
    requestPermissionProvider(Permission.bluetooth);

// Exemple de gestion de la permission de notification
final notificationPermissionsProvider =
    permissionProvider(Permission.notification);
final requestNotificationPermissionProvider =
    requestPermissionProvider(Permission.notification);

// Fonction pour vérifier et demander toutes les permissions nécessaires
Future<void> _checkPermissions() async {
  await _checkPermissionStatus(Permission.bluetooth);
  await _checkPermissionStatus(Permission.bluetoothConnect);
  await _checkPermissionStatus(Permission.bluetoothScan);
  await _checkPermissionStatus(Permission.location);
  await _checkPermissionStatus(Permission.locationAlways);
  await _checkPermissionStatus(Permission.locationWhenInUse);
  await _checkPermissionStatus(Permission.microphone);
  await _checkPermissionStatus(Permission.phone);
  await _checkPermissionStatus(Permission.storage);
  await _checkPermissionStatus(Permission.camera);
  await _checkPermissionStatus(Permission.manageExternalStorage);
  await _checkPermissionStatus(Permission.notification);
  await _checkPermissionStatus(Permission.bluetoothAdvertise);
  await _checkPermissionStatus(Permission.videos);
  await _checkPermissionStatus(Permission.audio);
  await _checkPermissionStatus(Permission.accessMediaLocation);
  await _checkPermissionStatus(Permission.contacts);
  await _checkPermissionStatus(Permission.mediaLibrary);
  await _checkPermissionStatus(Permission.sms);
  await _checkPermissionStatus(Permission.systemAlertWindow);
  devtools.log('All permissions checked');
}

// Vérifier et demander une permission spécifique
Future<void> _checkPermissionStatus(Permission permission) async {
  final status = await permission.request();

  switch (status) {
    case PermissionStatus.granted:
      devtools.log(
          '${permission.toString()} Permission granted: ${status.toString()}');
      break;
    case PermissionStatus.denied:
      devtools.log(
          '${permission.toString()} Permission denied: ${status.toString()}');
      break;
    case PermissionStatus.restricted:
      devtools.log(
          '${permission.toString()} Permission restricted: ${status.toString()}');
      break;
    case PermissionStatus.limited:
      devtools.log(
          '${permission.toString()} Permission limited: ${status.toString()}');
      break;
    case PermissionStatus.permanentlyDenied:
      devtools.log(
          '${permission.toString()} Permission permanently denied: ${status.toString()}');
      break;
    case PermissionStatus.provisional:
      devtools.log(
          '${permission.toString()} Permission provisional: ${status.toString()}');
      break;
  }
}

class PermissionStateNotifier extends StateNotifier<PermissionStatus> {
  final PermissionService permissionService;

  PermissionStateNotifier(this.permissionService)
      : super(PermissionStatus.provisional) {
    _initPermissions();
  }

  /* ------- Permet de vérifier les permissions avec le service ------------ */

  Future<void> requestPermissionWithService(
      PermissionWithService permission) async {
    await Future.delayed(Duration(seconds: 1));
    final result =
        await permissionService.requestPermissionWithServiceHandler(permission);

    switch (state) {
      case PermissionStatus.granted:
        state = result ? PermissionStatus.granted : PermissionStatus.denied;
        break;
      case PermissionStatus.denied:
        state = result ? PermissionStatus.denied : PermissionStatus.granted;
        break;
      case PermissionStatus.restricted:
        state = result ? PermissionStatus.restricted : PermissionStatus.denied;
        break;
      case PermissionStatus.limited:
        state = result ? PermissionStatus.limited : PermissionStatus.denied;
        break;
      case PermissionStatus.permanentlyDenied:
        state = result
            ? PermissionStatus.permanentlyDenied
            : PermissionStatus.denied;
        break;
      case PermissionStatus.provisional:
        state = result ? PermissionStatus.provisional : PermissionStatus.denied;
        break;
    }
  }

  /* ------- Permet de vérifier les permissions sans le service ------------ */

  Future<void> requestPermission(Permission permission) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await permissionService.requestPermissionHandler(permission);
    if (result) {
      state = PermissionStatus.granted;
    } else {
      state = PermissionStatus.denied;
    }
  }

  // Fonction appelée pour initialiser la vérification des permissions
  Future<void> _initPermissions() async {
    // Demande de toutes les permissions

    await requestPermissionWithService(Permission.bluetooth);
    await requestPermissionWithService(Permission.locationAlways);
    await requestPermissionWithService(Permission.location);
    await requestPermissionWithService(Permission.locationWhenInUse);
    await requestPermissionWithService(Permission.phone);

    await requestPermission(Permission.camera);
    await requestPermission(Permission.location);
    await requestPermission(Permission.microphone);
    await requestPermission(Permission.storage);
    await requestPermission(Permission.bluetooth);
    await requestPermission(Permission.notification);
    await requestPermission(Permission.bluetoothConnect);
    await requestPermission(Permission.bluetoothScan);
    await requestPermission(Permission.locationAlways);
    await requestPermission(Permission.locationWhenInUse);
    await requestPermission(Permission.phone);
    await requestPermission(Permission.manageExternalStorage);
    await requestPermission(Permission.videos);
    await requestPermission(Permission.audio);
    await requestPermission(Permission.accessMediaLocation);
    await requestPermission(Permission.contacts);
    await requestPermission(Permission.mediaLibrary);
    await requestPermission(Permission.sms);
    await requestPermission(Permission.systemAlertWindow);
    await requestPermission(Permission.bluetoothAdvertise);

    // Vérification des permissions
    await _checkPermissions();
  }
}

final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService();
});

final permissionStateNotifierProvider =
    StateNotifierProvider<PermissionStateNotifier, PermissionStatus>((ref) {
  final permissionService = ref.read(permissionServiceProvider);
  return PermissionStateNotifier(permissionService);
});

class PermissionNotifier
    extends StateNotifier<Map<Permission, PermissionStatus>> {
  PermissionNotifier() : super({});

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    state = {...state, permission: status};
  }

  // Demander toutes les permissions nécessaires.
  Future<void> requestAllPermissions() async {
    final statuses = await Future.wait([
      Permission.camera.request(),
      Permission.microphone.request(),
      Permission.storage.request(),
      Permission.bluetooth.request(),
      Permission.audio.request(),
      Permission.phone.request(),
      Permission.location.request(),
      Permission.mediaLibrary.request(),
      Permission.notification.request(),
    ]);

    // Mettre à jour l'état avec toutes les permissions demandées et leur statut.
    state = {
      Permission.camera: statuses[0],
      Permission.microphone: statuses[1],
      Permission.storage: statuses[2],
      Permission.bluetooth: statuses[3],
      Permission.audio: statuses[4],
      Permission.phone: statuses[5],
      Permission.location: statuses[6],
      Permission.mediaLibrary: statuses[7],
      Permission.notification: statuses[8],
    };
  }

  // Révoquer une permission spécifique (notamment pour les notifications).
  Future<void> revokeNotificationPermission() async {
    // La révocation d'une permission nécessite souvent des actions manuelles dans les paramètres.
    // Cependant, nous pouvons mettre à jour l'état comme s'il n'y avait plus de permission.
    state = {...state, Permission.notification: PermissionStatus.denied};
  }
}

final permissionNotifierProvider = StateNotifierProvider<PermissionNotifier,
    Map<Permission, PermissionStatus>>((ref) => PermissionNotifier());
