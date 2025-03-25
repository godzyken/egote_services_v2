import 'dart:convert';

import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/cube_config/cube_config.dart';
import '../../data/data_sources/local/pref_util.dart';

class NotificationUtils {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final SharedPrefs _sharedPrefs;

  NotificationUtils(this.flutterLocalNotificationsPlugin, this._sharedPrefs);

  Future<void> initialize(FlutterLocalNotificationsPlugin plugin) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher_foreground');
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true);

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await plugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onNotificationResponse);
  }

  void showNotification(RemoteMessage message) {
    Map<String, dynamic> data = message.data;
    NotificationDetails buildNotificationDetails(
        int? badge, String threadIdentifier) {
      return NotificationDetails(
          android: AndroidNotificationDetails(
            'messages_channel_id',
            'Chat messages',
            channelDescription: 'Chat messages will be received here',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: true,
          ),
          iOS: DarwinNotificationDetails(
            badgeNumber: badge,
            threadIdentifier: threadIdentifier,
          ));
    }

    var badge = int.tryParse(data['badge'].toString());
    var threadId =
        data['ios_thread_id'] ?? data['dialog_id'] ?? 'ios_thread_id';

    flutterLocalNotificationsPlugin.show(
      6543,
      "Chat sample",
      data['message'].toString(),
      buildNotificationDetails(badge, threadId),
      payload: jsonEncode(data),
    );
  }

  Future<void> handleNotificationSelection(
      String payload, BuildContext context) async {
    CubeUser? user = await _sharedPrefs.getUser();
    Map<String, dynamic> payloadObject = jsonDecode(payload);
    String? dialogId = payloadObject['dialog_id'];

    if (dialogId != null) {
      var dialogs = await getDialogs({'id': dialogId});
      if (dialogs?.items != null && dialogs!.items.isNotEmpty) {
        CubeDialog dialog = dialogs.items.first;
        if (context.mounted) {
          context.pushNamed('chat_dialog',
              extra: {USER_ARG_NAME: user, DIALOG_ARG_NAME: dialog});
        }
      }
    }
  }

  Future<void> _onNotificationResponse(
      NotificationResponse notificationResponse) async {
    var data = notificationResponse.payload;
    if (data != null) {
      String? dialogId = jsonDecode(data)['dialog_id'];
      _sharedPrefs.saveSelectedDialogId(dialogId ?? '');
    }
  }
}
