import 'dart:developer' as devtools;

import 'package:egote_services_v2/config/routes/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/chat/application/services/notification_utils.dart';
import '../../providers.dart';

class FirebaseNotificationHandler {
  final Ref ref;
  final NotificationUtils notificationUtils;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  FirebaseNotificationHandler({
    required this.ref,
    required this.notificationUtils,
  });

  Future<void> initialize() async {
    // Demander les permissions
    await messaging.requestPermission();

    // Gérer token
    final token = await messaging.getToken();
    devtools.log('Firebase Token: $token', name: 'FirebaseMessaging');

    // Foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      devtools.log('Foreground notification received',
          name: 'FirebaseMessaging');
      notificationUtils.showNotification(message);
    });

    // Quand app est en background et notification cliquée
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final payload = message.data;
      if (payload.isNotEmpty) {
        notificationUtils.handleNotificationSelection(
            payload.toString(), rootRouterKey.currentContext!);
      } else {
        devtools.log('Payload is empty', name: 'FirebaseMessaging');
      }
    });

    // App démarrée via une notification
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      final payload = initialMessage.data;
      if (payload.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notificationUtils.handleNotificationSelection(
              payload.toString(), rootRouterKey.currentContext!);
        });
      }
    }
  }
}

final firebaseNotificationHandlerProvider =
    Provider<FirebaseNotificationHandler>((ref) {
  final plugin = FlutterLocalNotificationsPlugin();
  final sharedPrefs = ref.watch(sharedPrefsProvider);
  final utils = NotificationUtils(plugin, sharedPrefs);
  return FirebaseNotificationHandler(
    ref: ref,
    notificationUtils: utils,
  );
});

final flutterLocalNotificationsProvider =
    Provider<FlutterLocalNotificationsPlugin>(
  (ref) => FlutterLocalNotificationsPlugin(),
);
