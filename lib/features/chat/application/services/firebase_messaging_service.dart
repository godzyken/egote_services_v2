import 'package:egote_services_v2/features/chat/application/services/push_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/firebase/firebase_providers.dart';

class FirebaseMessagingService {
  late final FirebaseMessaging _firebaseMessaging;
  late final PushNotificationService _pushNotificationsManager;

  FirebaseMessagingService();

  BuildContext? applicationContext;

  Future<void> initialize(Ref ref) async {
    final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
    await _pushNotificationsManager.initialize(ref);

    _firebaseMessaging = ref.watch(firebaseMessagingProvider);
    _pushNotificationsManager = ref.watch(pushNotificationServiceProvider);

    await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true);

    await _firebaseMessaging.setAutoInitEnabled(true).whenComplete(
          () => ref.refresh(firebaseAuthProvider(firebaseApp)),
        );

    final token = await _firebaseMessaging.getToken();

    _pushNotificationsManager.subscribe(token);

    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      _pushNotificationsManager.subscribe(newToken);
    });

    gestionMessage();
  }

  void gestionMessage() {
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      _pushNotificationsManager.onNotificationReceived(remoteMessage);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      _pushNotificationsManager.onNotificationSelected(
          remoteMessage.data['payload'], applicationContext);
    });
  }

  Future<void> subscribe(String? token) async {
    await _pushNotificationsManager.subscribe(token);
  }

  Future<void> unsubscribe() async {
    await _pushNotificationsManager.unsubscribe();
  }

  Future<void> setApplicationContext(BuildContext context) async {
    applicationContext = context;
  }

  Future<void> removeApplicationContext() async {
    applicationContext = null;
  }

  Future<void> setToken(String? token) async {
    await _pushNotificationsManager.subscribe(token);
  }

  Future<void> removeToken() async {
    await _pushNotificationsManager.unsubscribe();
  }

  Future<void> onNotificationReceived(RemoteMessage remoteMessage) async {
    _pushNotificationsManager.onNotificationReceived(remoteMessage);
  }

  Future<void> onNotificationSelected(String? payload) async {
    _pushNotificationsManager.onNotificationSelected(
        payload, applicationContext);
  }

  Future<void> onBackgroundMessage(RemoteMessage remoteMessage) async {
    _pushNotificationsManager.onBackgroundMessage(remoteMessage);
  }
}
