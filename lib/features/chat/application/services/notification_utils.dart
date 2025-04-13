import 'dart:convert';
import 'dart:developer' as develope;

import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

import '../../data/data_sources/local/pref_util.dart';

class NotificationUtils {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final SharedPrefs _sharedPrefs;

  NotificationUtils(this.flutterLocalNotificationsPlugin, this._sharedPrefs);

  Future<void> initialize() async {
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

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
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
    Map<String, dynamic> payloadObject = {};
    try {
      develope.log('Payload: $payload');
      payloadObject = jsonDecode(payload);
      develope.log('Payload: $payloadObject');
      String? dialogId = payloadObject['dialog_id'];

      user ??= await _sharedPrefs.getUser();
      if (dialogId != null) {
        var dialogs = await getDialogs({'id': dialogId});
        develope.log('Dialogs: $dialogs');
        if (dialogs?.items != null && dialogs!.items.isNotEmpty) {
          CubeDialog dialog = dialogs.items.first;
          develope.log('Dialog: $dialog');
          if (context.mounted) {
            context.goNamed('chat_dialog',
                pathParameters: {'dialogId': dialog.id.toString()});
          }
        }
      }
    } catch (e) {
      develope.log('Error: $e');
      return;
    }
  }

  Future<void> _onNotificationResponse(
      NotificationResponse notificationResponse) async {
    try {
      var data = notificationResponse.payload;
      if (data != null) {
        String? dialogId = jsonDecode(data)['dialog_id'];
        _sharedPrefs.saveSelectedDialogId(dialogId ?? '');
      }
    } catch (e) {
      develope.log('Error: $e');
      return;
    }
  }
}
