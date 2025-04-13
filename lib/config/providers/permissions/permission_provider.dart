import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider = Provider<List<Permission>>((ref) {
  final allPermissions = Permission.values;

  return allPermissions.where((permission) {
    if (Platform.isAndroid) {
      return permission != Permission.manageExternalStorage &&
          permission != Permission.systemAlertWindow &&
          permission != Permission.requestInstallPackages &&
          permission != Permission.accessNotificationPolicy &&
          permission != Permission.bluetoothScan &&
          permission != Permission.bluetoothAdvertise &&
          permission != Permission.bluetoothConnect &&
          permission != Permission.nearbyWifiDevices &&
          permission != Permission.videos &&
          permission != Permission.audio &&
          permission != Permission.scheduleExactAlarm &&
          permission != Permission.sensorsAlways;
    } else {
      return permission != Permission.unknown &&
          permission != Permission.mediaLibrary &&
          permission != Permission.photosAddOnly &&
          permission != Permission.reminders &&
          permission != Permission.bluetooth &&
          permission != Permission.appTrackingTransparency &&
          permission != Permission.criticalAlerts &&
          permission != Permission.assistant;
    }
  }).toList();
});
