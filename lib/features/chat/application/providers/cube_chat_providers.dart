import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/chat/application/managers/chat_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagesProvider =
    StateNotifierProvider<MessageNotifier, List<CubeMessage>>(
  (ref) => MessageNotifier(),
);

class MessageNotifier extends StateNotifier<List<CubeMessage>> {
  MessageNotifier() : super([]);

  void addMessage(CubeMessage msg) {
    state = [...state, msg];
    ChatManager.instance.sendMessage(msg);
  }

  void updateMessage(CubeMessage updateMsg) {
    state = [
      for (final msg in state)
        if (msg.updatedAt == updateMsg.createdAt) updateMsg else msg
    ];
  }

  void deleteMessage(CubeMessage msg) {
    state =
        state.where((element) => element.messageId != msg.messageId).toList();
  }

  Future<void> markAsSent(CubeMessage msg) async {
    try {
      final updatedMessage = CubeMessage()
        ..messageId = msg.messageId
        ..dialogId = msg.dialogId
        ..body = msg.body
        ..dateSent = msg.dateSent
        ..senderId = msg.senderId
        ..recipientId = msg.recipientId
        ..deliveredIds = [...(msg.deliveredIds ?? []), msg.senderId!]
        ..readIds = msg.readIds
        ..viewsCount = msg.viewsCount
        ..attachments = msg.attachments
        ..saveToHistory = msg.saveToHistory
        ..destroyAfter = msg.destroyAfter
        ..isRead = false
        ..reactions = msg.reactions;

      state = [
        for (final m in state)
          if (m.messageId == msg.messageId) updatedMessage else m
      ];

      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      developer.log('Erreur lors de la mise à jour du message: $e');
    }
  }

  void markAsRead(MessageStatus msg) {
    ChatManager.instance.markMessageAsRead(msg);
  }

  void addMessages(List<CubeMessage> msgs) {
    state = [...state, ...msgs];
  }
}
