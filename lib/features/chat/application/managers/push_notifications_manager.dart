import 'dart:convert';
import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/app_shared/extensions/extensions.dart';
import '../../data/data_sources/local/pref_util.dart';

class PushNotificationsManager {
  static const TAG = "PushNotificationsManager";

  static final PushNotificationsManager _instance =
  PushNotificationsManager._internal();

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  PushNotificationsManager._internal() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  BuildContext? applicationContext;

  static PushNotificationsManager get instance => _instance;

  Future<dynamic> Function(String? payload)? onNotificationClicked;

  Ref? _ref;

  /// Permet d'injecter la référence Riverpod
  void setRef(Ref ref) {
    _ref = ref;
  }

  Future<void> init([Ref? ref]) async {
    if (ref != null) _ref = ref;

    developer.log('[init], $TAG');

    if (_ref == null) {
      developer.log('[init] ERROR: Ref is null. Call setRef() or pass ref to init()', name: TAG);
      return;
    }

    final firebaseMessaging = _ref!.read(firebaseMessagingProvider);

    await firebaseMessaging.setAutoInitEnabled(true).whenComplete(() {
      return _ref?.refresh(firebaseAuthProvider);
    });

    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher_foreground');

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: const DarwinInitializationSettings(),
    );

    // Correction de la signature initialize()
    await flutterLocalNotificationsPlugin.initialize(
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        developer.log(
            '[onDidReceiveNotificationResponse] payload: ${notificationResponse.payload}, $TAG');
        var data = notificationResponse.payload;
        if (data != null) {
          if (onNotificationClicked != null) {
            onNotificationClicked?.call(data);
          } else {
            String? dialogId = jsonDecode(data)['dialog_id'];
            SharedPrefs.instance.saveSelectedDialogId(dialogId ?? '');
          }
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground, settings: initializationSettings,
    );

    // Obtention du token FCM de manière asynchrone
    if (Platform.isAndroid || kIsWeb || Platform.isIOS || Platform.isMacOS) {
      try {
        final token = await firebaseMessaging.getToken();
        developer.log('[getToken] token: $token, $TAG');
        if (token != null && token.isNotEmpty) {
          await subscribe(token);
        }
      } catch (onError) {
        developer.log('[getToken] onError: $onError, $TAG');
      }
    }

    firebaseMessaging.onTokenRefresh.listen((newToken) {
      subscribe(newToken);
    });

    FirebaseMessaging.onMessage.listen((remoteMessage) {
      developer.log('[onMessage] message: ${remoteMessage.data}, $TAG');
      showNotification(remoteMessage);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      developer.log('[onMessageOpenedApp] remoteMessage: $remoteMessage, $TAG');
      onNotificationClicked?.call(jsonEncode(remoteMessage.data));
    });
  }

  Future<void> subscribe(String? token) async {
    developer.log('[subscribe] token: $token, ${PushNotificationsManager.TAG}');
    if (token == null) return;

    SharedPrefs sharedPrefs = await SharedPrefs.instance.init();
    if (sharedPrefs.getSubscriptionToken() == token) {
      developer.log(
          '[subscribe] skip subscription for same token, ${PushNotificationsManager.TAG}');
      return;
    }

    var deviceInfoPlugin = DeviceInfoPlugin();
    String? deviceId;

    if (kIsWeb) {
      var webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      deviceId = base64Encode(utf8.encode(webBrowserInfo.userAgent ?? ''));
    } else if (Platform.isAndroid) {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    } else if (Platform.isMacOS) {
      var macOsInfo = await deviceInfoPlugin.macOsInfo;
      deviceId = macOsInfo.computerName;
    }

    String? newUuid = const Uuid().v4();
    developer.log('[subscribe] deviceId: ${deviceId ?? newUuid}', name: TAG);
  }

  Future<void> unsubscribe() {
    return SharedPrefs.instance.init().then((sharedPrefs) {
      int subscriptionId = sharedPrefs.getSubscriptionId();
      if (subscriptionId != 0) {
        // Logique de désabonnement ConnectyCube
      }
      return Future.value();
    }).catchError((onError) {
      developer.log(
          '[unsubscribe] ERROR: $onError, ${PushNotificationsManager.TAG}');
    });
  }

  Future<dynamic> onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    developer.log(
        '[onDidReceiveLocalNotification] id: $id , title: $title, body: $body, payload: $payload, ${PushNotificationsManager.TAG}');
    return Future.value();
  }

  Future<dynamic> onSelectNotification(String? payload) {
    developer.log(
        '[onSelectNotification] payload: $payload, ${PushNotificationsManager.TAG}');
    onNotificationClicked?.call(payload);
    return Future.value();
  }
}

void showNotification(RemoteMessage message) {
  developer.log(
      '[showNotification] message: ${message.data}, ${PushNotificationsManager.TAG}');
  Map<String, dynamic> data = message.data;

  NotificationDetails buildNotificationDetails(
      int? badge,
      String threadIdentifier,
      ) {
    final DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails(
      badgeNumber: badge,
      threadIdentifier: threadIdentifier,
    );

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'messages_channel_id',
      'Chat messages',
      channelDescription: 'Chat messages will be received here',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      color: Colors.green,
    );

    return NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: darwinNotificationDetails,
        macOS: darwinNotificationDetails);
  }

  var badge = int.tryParse(data['badge'].toString());
  var threadId = data['ios_thread_id'] ?? data['dialog_id'] ?? 'ios_thread_id';

  FlutterLocalNotificationsPlugin().show(
    id: 6543,
    title: "Chat sample",
    body: data['message'].toString(),
    notificationDetails: buildNotificationDetails(badge, threadId),
    payload: jsonEncode(data),
  );
}

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {
  developer.log(
      '[onBackgroundMessage] message: ${message.data}, ${PushNotificationsManager.TAG}');
  showNotification(message);
  if (!Platform.isIOS) {
    updateBadgeCount(int.tryParse(message.data['badge'].toString()));
  }
  return Future.value();
}

Future<dynamic> onNotificationSelected(String? payload, BuildContext? context) {
  developer.log(
      '[onSelectNotification] payload: $payload, ${PushNotificationsManager.TAG}');

  if (context == null) return Future.value();

  if (payload != null) {
    return SharedPrefs.instance.init().then((sharedPrefs) async {
      CubeUser? user = await sharedPrefs.getUser();

      Map<String, dynamic> payloadObject = jsonDecode(payload);
      String? dialogId = payloadObject['dialog_id'];

      developer.log(
          "[onSelectNotification] dialog_id: $dialogId, ${PushNotificationsManager.TAG}");
    });
  } else {
    return Future.value();
  }
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  developer.log(
      '[notificationTapBackground] payload: ${notificationResponse.payload}');
}