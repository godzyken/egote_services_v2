import 'dart:developer' as devtools show log;

import 'package:battery_plus/battery_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

// Un provider pour suivre l'état de la permission de la caméra
final cameraPermissionsProvider = FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.camera.status;
  return status;
});

// Un provider pour demander la permission de la caméra
final requestCameraPermissionProvider = FutureProvider<bool>((ref) async {
  final status = await Permission.camera.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission de l'emplacement
final locationPermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.location.status;
  return status;
});

// Un provider pour demander la permission de l'emplacement
final requestLocationPermissionProvider = FutureProvider<bool>((ref) async {
  final status = await Permission.location.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du microphone
final microphonePermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.microphone.status;
  return status;
});

// Un provider pour demander la permission du microphone
final requestMicrophonePermissionProvider = FutureProvider<bool>((ref) async {
  final status = await Permission.microphone.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du stockage externe
final storagePermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.storage.status;
  return status;
});

// Un provider pour demander la permission du stockage externe
final requestStoragePermissionProvider = FutureProvider<bool>((ref) async {
  final status = await Permission.storage.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du stockage externe
final manageExternalStoragePermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.manageExternalStorage.status;
  return status;
});

// Un provider pour demander la permission du stockage externe
final requestManageExternalStoragePermissionProvider =
    FutureProvider<bool>((ref) async {
  final status = await Permission.manageExternalStorage.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission de la notification
final notificationPermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.notification.status;
  return status;
});

// Un provider pour demander la permission de la notification
final requestNotificationPermissionProvider = FutureProvider<bool>((ref) async {
  final status = await Permission.notification.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du Bluetooth
final bluetoothPermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.bluetooth.status;
  return status;
});

// Un provider pour demander la permission du Bluetooth
final requestBluetoothPermissionProvider = FutureProvider<bool>((ref) async {
  final status = await Permission.bluetooth.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du Bluetooth Connect
final bluetoothConnectPermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.bluetoothConnect.status;
  return status;
});

// Un provider pour demander la permission du Bluetooth Connect
final requestBluetoothConnectPermissionProvider =
    FutureProvider<bool>((ref) async {
  final status = await Permission.bluetoothConnect.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du Bluetooth Scan
final bluetoothScanPermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.bluetoothScan.status;
  return status;
});

// Un provider pour demander la permission du Bluetooth Scan
final requestBluetoothScanPermissionProvider =
    FutureProvider<bool>((ref) async {
  final status = await Permission.bluetoothScan.request();
  return status.isGranted;
});

// Un provider pour suivre l'état de la permission du Bluetooth Advertise
final bluetoothAdvertisePermissionsProvider =
    FutureProvider<PermissionStatus>((ref) async {
  final status = await Permission.bluetoothAdvertise.status;
  return status;
});

// Un provider pour demander la permission du Bluetooth Advertise
final requestBluetoothAdvertisePermissionProvider =
    FutureProvider<bool>((ref) async {
  final status = await Permission.bluetoothAdvertise.request();
  return status.isGranted;
});

final batteryProvider = Provider<BatteryStateNotifier>((ref) {
  return BatteryStateNotifier();
});

class BatteryStateNotifier extends StateNotifier<BatteryState> {
  BatteryStateNotifier() : super(BatteryState.unknown) {
    _updateBatteryState();
  }

  final Battery _battery = Battery();

  Future<void> _updateBatteryState() async {
    final battery = await Battery().batteryState;
    state = battery;

    await _battery.batteryLevel;
    await _battery.isInBatterySaveMode;
  }

  onBatteryStateChanged(BatteryState batteryState) {
    _battery.onBatteryStateChanged.listen(
      (event) => _updateBatteryState(),
    );
  }
}

Future<void> _checkPermissions() async {
  var status = await Permission.bluetooth.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Bluetooth Permission disabled: ${status.toString()}');
  }
  status = await Permission.bluetoothConnect.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Bluetooth Connect Permission disabled: ${status.toString()}');
  }

  status = await Permission.bluetoothScan.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Bluetooth Scan Permission disabled: ${status.toString()}');
  }

  status = await Permission.location.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Location Permission disabled: ${status.toString()}');
  }

  status = await Permission.locationAlways.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Location Always Permission disabled: ${status.toString()}');
  }

  status = await Permission.locationWhenInUse.request();
  if (status.isPermanentlyDenied) {
    devtools
        .log('Location When In Use Permission disabled: ${status.toString()}');
  }

  status = await Permission.microphone.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Microphone Permission disabled: ${status.toString()}');
  }

  status = await Permission.phone.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Phone Permission disabled: ${status.toString()}');
  }

  status = await Permission.storage.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Storage Permission disabled: ${status.toString()}');
  }

  status = await Permission.camera.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Camera Permission disabled: ${status.toString()}');
  }

  status = await Permission.manageExternalStorage.request();
  if (status.isPermanentlyDenied) {
    devtools.log(
        'Manage External Storage Permission disabled: ${status.toString()}');
  }

  status = await Permission.manageExternalStorage.request();
  if (status.isPermanentlyDenied) {
    devtools.log(
        'Manage External Storage Permission disabled: ${status.toString()}');
  }

  status = await Permission.notification.request();
  if (status.isPermanentlyDenied) {
    devtools.log('Notification Permission disabled: ${status.toString()}');
  }

  status = await Permission.bluetoothAdvertise.request();
  if (status.isPermanentlyDenied) {
    devtools
        .log('Bluetooth Advertise Permission disabled: ${status.toString()}');
  }
}
