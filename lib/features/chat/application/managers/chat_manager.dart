import 'dart:async';

import 'package:connectycube_sdk/connectycube_chat.dart';

class ChatManager {
  static ChatManager? _instance;

  ChatManager._();

  static ChatManager get instance => _instance ??= ChatManager._();

  StreamController<CubeMessage> sentMessagesController =
      StreamController<CubeMessage>.broadcast();

  Stream<CubeMessage> get sentMessagesStream {
    return sentMessagesController.stream;
  }

  StreamController<MessageStatus> readMessagesController =
      StreamController<MessageStatus>.broadcast();

  Stream<MessageStatus> get readMessagesStream {
    return readMessagesController.stream;
  }

  void sendMessage(CubeMessage message) {
    if (!sentMessagesController.isClosed) {
      sentMessagesController.add(message);
    }
  }

  void markMessageAsRead(MessageStatus messageStatus) {
    if (!readMessagesController.isClosed) {
      readMessagesController.add(messageStatus);
    }
  }

  void dispose(CubeMessage message) {
    sentMessagesController.close();
    readMessagesController.close();
  }
}
