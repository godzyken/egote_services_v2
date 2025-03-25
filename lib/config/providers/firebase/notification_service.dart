import 'dart:developer' as devtools;

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../permissions/device_permissions_providers.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> requestPermissions(Ref ref) async {
    try {
      final permissionStatus = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      if (permissionStatus == true) {
        // Notification permissions granted
        ref.read(notificationPermissionProvider.notifier).state =
            PermissionStatus.granted;
      } else {
        // Notification permissions denied
        ref.read(notificationPermissionProvider.notifier).state =
            PermissionStatus.denied;
      }
    } on PlatformException catch (e) {
      // Handle platform exception
      ref.read(notificationPermissionProvider.notifier).state =
          PermissionStatus.denied;
      devtools.log('Error requesting notification permissions: $e');
    }
  }
}

final notificationPermissionProvider = StateProvider((ref) {
  final notificationService = ref.read(notificationPermissionsProvider);
  return notificationService.value;
});
