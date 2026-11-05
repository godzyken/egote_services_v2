import 'dart:developer' as developer;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../config/providers/supabase/supabase_providers.dart';
import '../../../config/providers/talker/talker_providers.dart';
import '../../chat/application/managers/push_notifications_manager.dart';

final notificationBridgeServiceProvider = Provider<NotificationBridgeService>((
  ref,
) {
  return NotificationBridgeService(ref);
});

class NotificationBridgeService {
  final Ref _ref;
  bool _isListening = false;

  NotificationBridgeService(this._ref);

  void startListening() {
    if (_isListening) return;
    _isListening = true;

    try {
      final client = _ref.read(supabaseClientProvider);
      final talker = _ref.read(talkerProvider);

      talker.info(
        'NotificationBridgeService: Starting real-time listeners for Emap / Hub ecosystem...',
      );

      // 1. Listen to Devis changes (Quotations)
      client
          .channel('public:devis')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'devis',
            callback: (payload) {
              talker.info(
                'Realtime Devis Event: ${payload.eventType} - New: ${payload.newRecord}',
              );
              _handleDevisEvent(payload);
            },
          )
          .subscribe();

      // 2. Listen to Rendez-vous changes (Appointments)
      client
          .channel('public:rendez_vous')
          .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'rendez_vous',
            callback: (payload) {
              talker.info(
                'Realtime RDV Event: ${payload.eventType} - New: ${payload.newRecord}',
              );
              _handleRdvEvent(payload);
            },
          )
          .subscribe();

      // 3. Listen to Messages changes (Chat)
      client
          .channel('public:messages')
          .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            table: 'messages',
            callback: (payload) {
              talker.info('Realtime Message Event: ${payload.newRecord}');
              _handleMessageEvent(payload);
            },
          )
          .subscribe();
    } catch (e, st) {
      developer.log(
        'Error starting NotificationBridgeService: $e',
        error: e,
        stackTrace: st,
      );
    }
  }

  void _handleDevisEvent(PostgresChangePayload payload) {
    final newRecord = payload.newRecord;
    if (newRecord.isNotEmpty && newRecord['status'] == 'accepted') {
      PushNotificationsManager.instance.flutterLocalNotificationsPlugin.show(
        id: 0,
        title: 'Devis Validé !',
        body:
            'Le devis ${newRecord['service_type']} a été accepté. Projet créé.',
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'devis_channel',
            'Devis & Projets',
            channelDescription: 'Devis notifications channel',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
      );
    }
  }

  void _handleRdvEvent(PostgresChangePayload payload) {
    final newRecord = payload.newRecord;
    if (newRecord.isNotEmpty) {
      PushNotificationsManager.instance.flutterLocalNotificationsPlugin.show(
        id: 1,
        title: 'Nouveau Rendez-vous',
        body: 'RDV prévu le ${newRecord['scheduled_at']}',
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'rdv_channel',
            'Rendez-vous',
            channelDescription: 'Rendez-vous notifications channel',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
      );
    }
  }

  void _handleMessageEvent(PostgresChangePayload payload) {
    final newRecord = payload.newRecord;
    if (newRecord.isNotEmpty) {
      PushNotificationsManager.instance.flutterLocalNotificationsPlugin.show(
        id: 2,
        title: 'Nouveau Message',
        body: newRecord['content'] ?? 'Vous avez reçu un nouveau message.',
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'chat_channel',
            'Messages Chat',
            channelDescription: 'Chat notifications channel',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
      );
    }
  }
}
