import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:connectycube_sdk/connectycube_pushnotifications.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/app_shared/extensions/platform_utils.dart';
import '../../../../config/providers/customer/shared_prefs_provider.dart';
import '../../../../config/providers/firebase/firebase_providers.dart';
import '../../data/data_sources/local/pref_util.dart';
import '../../domain/models/entities/cube_environment/cube_environment_mig.dart';
import 'firebase_messaging_service.dart';
import 'notification_utils.dart';

class PushNotificationService {
  static const TAG = "PushNotificationService";
  late final FirebaseMessagingService _firebaseMessagingService;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  final NotificationUtils _notificationUtils;

  late Ref _ref;

  PushNotificationService(
      this.flutterLocalNotificationsPlugin, this._notificationUtils);

  Future<void> initialize(Ref ref) async {
    await _firebaseMessagingService.initialize(ref);
    await _notificationUtils.initialize();
    _firebaseMessagingService = ref.read(firebaseMessagingServiceProvider);
  }

  subscribe(String? token) async {
    developer.log('[subscribe] token: $token, ${PushNotificationService.TAG}');

    SharedPrefs sharedPrefs = _ref.read(sharedPrefsProvider).requireValue!;
    if (sharedPrefs.getSubscriptionToken() == token) {
      developer.log(
          '[subscribe] skip subscription for same token, ${PushNotificationService.TAG}');
      return;
    }

    CreateSubscriptionParameters parameters = CreateSubscriptionParameters();
    parameters.pushToken = token;

    bool isProduction =
        kIsWeb ? true : const bool.fromEnvironment('dart.vm.product');
    parameters.environment = isProduction
        ? CubeEnvironmentMig.PRODUCTION
        : CubeEnvironmentMig.DEVELOPMENT;

    if (Platform.isAndroid || kIsWeb || Platform.isIOS || Platform.isMacOS) {
      parameters.channel = NotificationsChannels.GCM;
      parameters.platform = CubePlatform.ANDROID;
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

    String? newUuid = const Uuid().v4.toString();

    parameters.udid = deviceId ?? newUuid;

    var packageInfo = await PackageInfo.fromPlatform();
    parameters.bundleIdentifier = packageInfo.packageName;

    createSubscription(parameters.getRequestParameters())
        .then((cubeSubscription) {
      developer.log(
          '[subscribe] subscription SUCCESS, ${PushNotificationService.TAG}');
      sharedPrefs.saveSubscriptionToken(token!);
      for (var subscription in cubeSubscription) {
        if (subscription.clientIdentificationSequence == token) {
          sharedPrefs.saveSubscriptionId(subscription.id!);
        }
      }
    }).catchError((error) {
      developer.log(
          '[subscribe] subscription ERROR: $error, ${PushNotificationService.TAG}');
    });
  }

  Future<void> unsubscribe() {
    return _ref
        .read(sharedPrefsAsyncNotifierProvider.future)
        .then((sharedPrefs) {
      int subscriptionId = sharedPrefs.getSubscriptionId();
      if (subscriptionId != 0) {
        return deleteSubscription(subscriptionId).then((voidResult) {
          FirebaseMessaging.instance.deleteToken();
          sharedPrefs.saveSubscriptionId(0);
        });
      }
      return Future.value();
    }).catchError((onError) {
      developer
          .log('[unsubscribe] ERROR: $onError, ${PushNotificationService.TAG}');
    });
  }

  Future<void> onNotificationReceived(RemoteMessage message) async {
    _notificationUtils.showNotification(message);
  }

  Future<void> onNotificationSelected(
      String? payload, BuildContext? context) async {
    if (context != null && payload != null) {
      await _notificationUtils.handleNotificationSelection(payload, context);
    }
  }

  showNotification(RemoteMessage message) {
    developer.log(
        '[showNotification] message: ${message.data}, ${PushNotificationService.TAG}');
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
    var threadId =
        data['ios_thread_id'] ?? data['dialog_id'] ?? 'ios_thread_id';

    FlutterLocalNotificationsPlugin().show(
      6543,
      "Chat sample",
      data['message'].toString(),
      buildNotificationDetails(badge, threadId),
      payload: jsonEncode(data),
    );
  }

  @pragma('vm:entry-point')
  Future<void> onBackgroundMessage(RemoteMessage message) async {
    developer.log(
        '[onBackgroundMessage] message: ${message.data}, ${PushNotificationService.TAG}');
    showNotification(message);
    if (!Platform.isIOS) {
      updateBadgeCount(int.tryParse(message.data['badge'].toString()));
    }
    return Future.value();
  }

  @pragma('vm:entry-point')
  void notificationTapBackground(NotificationResponse notificationResponse) {
    developer.log(
        '[notificationTapBackground] payload: ${notificationResponse.payload}');
  }

  Future<void> getPackageInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      developer.log('App name: ${packageInfo.appName}');
      developer.log('App version: ${packageInfo.version}');
      developer.log('App build number: ${packageInfo.buildNumber}');
    } catch (e) {
      developer.log('Error: $e');
    }
  }

  Future<dynamic> onSelectNotification(String? payload) {
    developer.log(
        '[onSelectNotification] payload: $payload, ${PushNotificationService.TAG}');
    onNotificationClicked?.call(payload);
    return Future.value();
  }

  Future<dynamic> Function(String? payload)? onNotificationClicked;
}

final pushNotificationServiceProvider = Provider<PushNotificationService>(
  (ref) {
    final flutterLocalNotificationsPlugin =
        ref.watch(flutterLocalNotificationsServiceProvider);
    final notificationUtils = ref.watch(notificationUtilsProvider);
    return PushNotificationService(
        flutterLocalNotificationsPlugin, notificationUtils);
  },
);

final notificationUtilsProvider = Provider<NotificationUtils>(
  (ref) {
    final prefs = ref.watch(sharedPrefsProvider).maybeWhen(
          data: (sharedPrefs) => sharedPrefs,
          orElse: () => null,
        );
    if (prefs == null) {
      throw Exception('SharedPreferences not initialized');
    }
    final sharedPrefs = prefs;
    final flutterLocalNotificationsPlugin =
        ref.watch(flutterLocalNotificationsServiceProvider);
    return NotificationUtils(flutterLocalNotificationsPlugin, sharedPrefs);
  },
);

final flutterLocalNotificationsServiceProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
  return FlutterLocalNotificationsPlugin();
});
