import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

void main() {
  late MockFirebaseMessaging mockFirebaseMessaging;
  late MockFlutterLocalNotificationsPlugin mockLocalNotifications;

  setUpAll(() {
    registerFallbackValue(
      const NotificationDetails(
        android: AndroidNotificationDetails('channel_id', 'channel_name'),
      ),
    );
  });

  setUp(() {
    mockFirebaseMessaging = MockFirebaseMessaging();
    mockLocalNotifications = MockFlutterLocalNotificationsPlugin();
  });

  group('FCM Messaging - Entrée (Incoming Notifications)', () {
    test('Entrée - Processes foreground RemoteMessage data and payload', () {
      final message = RemoteMessage(
        notification: const RemoteNotification(
          title: 'Nouveau Message',
          body: 'Vous avez reçu une proposition de devis.',
        ),
        data: {
          'dialog_id': 'dialog_123',
          'message': 'Bonjour, voici le devis.',
          'badge': '1',
        },
      );

      expect(message.notification?.title, equals('Nouveau Message'));
      expect(
        message.notification?.body,
        equals('Vous avez reçu une proposition de devis.'),
      );
      expect(message.data['dialog_id'], equals('dialog_123'));
      expect(message.data['badge'], equals('1'));
    });

    test(
      'Entrée - Triggers FlutterLocalNotificationsPlugin show on incoming message',
      () async {
        when(
          () => mockLocalNotifications.show(
            id: any(named: 'id'),
            title: any(named: 'title'),
            body: any(named: 'body'),
            notificationDetails: any(named: 'notificationDetails'),
            payload: any(named: 'payload'),
          ),
        ).thenAnswer((_) async {});

        await mockLocalNotifications.show(
          id: 6543,
          title: 'Nouveau Message',
          body: 'Bonjour, voici le devis.',
          notificationDetails: const NotificationDetails(
            android: AndroidNotificationDetails(
              'chat_channel',
              'Chat notifications',
            ),
          ),
          payload: '{"dialog_id": "dialog_123"}',
        );

        verify(
          () => mockLocalNotifications.show(
            id: 6543,
            title: 'Nouveau Message',
            body: 'Bonjour, voici le devis.',
            notificationDetails: any(named: 'notificationDetails'),
            payload: '{"dialog_id": "dialog_123"}',
          ),
        ).called(1);
      },
    );

    test('Entrée - Stream listened on message app opened', () async {
      final messageStream = Stream.value(
        RemoteMessage(data: {'dialog_id': 'dialog_456', 'action': 'open_chat'}),
      );

      when(
        () => mockFirebaseMessaging.getInitialMessage(),
      ).thenAnswer((_) async => null);

      final message = await messageStream.first;

      expect(message.data['dialog_id'], equals('dialog_456'));
      expect(message.data['action'], equals('open_chat'));
    });
  });

  group('FCM Messaging - Sortie (Outgoing Token & Subscription)', () {
    test('Sortie - Fetches FCM token successfully', () async {
      const String expectedToken = 'fcm_device_token_xyz_123';
      when(
        () => mockFirebaseMessaging.getToken(),
      ).thenAnswer((_) async => expectedToken);

      final token = await mockFirebaseMessaging.getToken();

      expect(token, equals('fcm_device_token_xyz_123'));
      verify(() => mockFirebaseMessaging.getToken()).called(1);
    });

    test(
      'Sortie - Listens to onTokenRefresh stream for new device tokens',
      () async {
        final tokenStream = Stream.fromIterable([
          'token_old_111',
          'token_new_222',
        ]);

        when(
          () => mockFirebaseMessaging.onTokenRefresh,
        ).thenAnswer((_) => tokenStream);

        final tokens = await mockFirebaseMessaging.onTokenRefresh.toList();

        expect(tokens.length, equals(2));
        expect(tokens.last, equals('token_new_222'));
        verify(() => mockFirebaseMessaging.onTokenRefresh).called(1);
      },
    );

    test(
      'Sortie - Requests notification permissions for iOS / Android 13+',
      () async {
        const settings = NotificationSettings(
          authorizationStatus: AuthorizationStatus.authorized,
          alert: AppleNotificationSetting.enabled,
          badge: AppleNotificationSetting.enabled,
          sound: AppleNotificationSetting.enabled,
          announcement: AppleNotificationSetting.disabled,
          carPlay: AppleNotificationSetting.disabled,
          criticalAlert: AppleNotificationSetting.disabled,
          lockScreen: AppleNotificationSetting.enabled,
          notificationCenter: AppleNotificationSetting.enabled,
          showPreviews: AppleShowPreviewSetting.always,
          timeSensitive: AppleNotificationSetting.disabled,
        );

        when(
          () => mockFirebaseMessaging.requestPermission(
            alert: any(named: 'alert'),
            badge: any(named: 'badge'),
            sound: any(named: 'sound'),
          ),
        ).thenAnswer((_) async => settings);

        final result = await mockFirebaseMessaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        expect(
          result.authorizationStatus,
          equals(AuthorizationStatus.authorized),
        );
        verify(
          () => mockFirebaseMessaging.requestPermission(
            alert: true,
            badge: true,
            sound: true,
          ),
        ).called(1);
      },
    );

    test('Sortie - Subscribes to Firebase Messaging topic', () async {
      when(
        () => mockFirebaseMessaging.subscribeToTopic('devis_updates'),
      ).thenAnswer((_) async {});

      await mockFirebaseMessaging.subscribeToTopic('devis_updates');

      verify(
        () => mockFirebaseMessaging.subscribeToTopic('devis_updates'),
      ).called(1);
    });

    test('Sortie - Unsubscribes from Firebase Messaging topic', () async {
      when(
        () => mockFirebaseMessaging.unsubscribeFromTopic('devis_updates'),
      ).thenAnswer((_) async {});

      await mockFirebaseMessaging.unsubscribeFromTopic('devis_updates');

      verify(
        () => mockFirebaseMessaging.unsubscribeFromTopic('devis_updates'),
      ).called(1);
    });
  });
}
