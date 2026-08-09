import 'dart:async';

import 'package:connectycube_sdk/connectycube_chat.dart';

class ChatManager {
  static ChatManager? _instance;

  ChatManager._();

  static ChatManager get instance => _instance ??= ChatManager._();

  // Streams de messages envoyés, lus et livrés
  final StreamController<CubeMessage> sentMessagesController = StreamController<CubeMessage>.broadcast();
  Stream<CubeMessage> get sentMessagesStream => sentMessagesController.stream;

  final StreamController<MessageStatus> readMessagesController = StreamController<MessageStatus>.broadcast();
  Stream<MessageStatus> get readMessagesStream => readMessagesController.stream;

  final StreamController<MessageStatus> deliveredMessagesController = StreamController<MessageStatus>.broadcast();
  Stream<MessageStatus> get deliveredMessagesStream => deliveredMessagesController.stream;

  // Stream pour les messages entrants
  final StreamController<CubeMessage> chatMessagesController = StreamController<CubeMessage>.broadcast();
  Stream<CubeMessage> get chatMessagesStream => chatMessagesController.stream;

  // Stream pour le statut de frappe (typing)
  final StreamController<TypingStatus> typingStatusController = StreamController<TypingStatus>.broadcast();
  Stream<TypingStatus> get typingStatusStream => typingStatusController.stream;

  void dispose() {
    sentMessagesController.close();
    readMessagesController.close();
    deliveredMessagesController.close();
    chatMessagesController.close();
    typingStatusController.close();
  }
}