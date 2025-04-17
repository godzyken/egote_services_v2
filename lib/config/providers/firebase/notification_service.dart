import 'dart:developer' as devtools;

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  NotificationService(this.ref) {
    init();
  }

  final Ref ref;
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  final androidSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  Future<void> requestPermissions() async {
    try {
      final androidPlugin =
          notificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final iosPlugin =
          notificationsPlugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();

      final granted = await androidPlugin?.requestNotificationsPermission();

      final grantedIOS = await iosPlugin?.requestPermissions();

      final newStatus = (granted == true || grantedIOS == true)
          ? PermissionStatus.granted
          : PermissionStatus.denied;

      // Update state
      ref.read(notificationPermissionProvider.notifier).state = newStatus;

      devtools.log(
        'Notification permission status: $newStatus',
        name: 'NotificationService',
      );
    } on PlatformException catch (e, stackTrace) {
      ref.read(notificationPermissionProvider.notifier).state =
          PermissionStatus.denied;

      devtools.log(
        'Error requesting notification permissions: $e',
        name: 'NotificationService',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<bool> isPermissionGranted() async {
    final status = ref.read(notificationPermissionProvider);
    return status == PermissionStatus.granted;
  }

  Future<bool> isPermissionDenied() async {
    final status = ref.read(notificationPermissionProvider);
    return status == PermissionStatus.denied;
  }

  Future<bool> isPermissionRestricted() async {
    final status = ref.read(notificationPermissionProvider);
    return status == PermissionStatus.restricted;
  }

  Future<bool> isPermissionLimited() async {
    final status = ref.read(notificationPermissionProvider);
    return status == PermissionStatus.limited;
  }

  Future<bool> isPermissionPermanentlyDenied() async {
    final status = ref.read(notificationPermissionProvider);
    return status == PermissionStatus.permanentlyDenied;
  }

  Future<void> init() async {
    await notificationsPlugin.initialize(
      InitializationSettings(
        android: androidSettings,
        iOS: const DarwinInitializationSettings(),
        macOS: const DarwinInitializationSettings(),
        linux: const LinuxInitializationSettings(defaultActionName: 'Open App'),
        windows: const WindowsInitializationSettings(
            appName: 'Egote Services',
            appUserModelId: 'app.egote.services',
            guid: ''),
      ),
    );
  }

  Future<void> notifyIfGranted({
    required String title,
    required String body,
  }) async {
    final granted = await isPermissionGranted();
    if (granted) {
      await showNotification(title: title, body: body);
    }
  }

  Future<void> showNotification(
      {required String title, required String body}) async {
    const androidDetails = AndroidNotificationDetails(
      'default_channel_id',
      'Default Channel',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
      linux: LinuxNotificationDetails(),
      windows: WindowsNotificationDetails(),
    );

    await notificationsPlugin.show(
      0, // ID
      title,
      body,
      payload: 'default_payload',
      notificationDetails,
    );
  }
}

final notificationPermissionProvider = StateProvider<PermissionStatus>((ref) {
  return PermissionStatus.denied;
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref);
});
