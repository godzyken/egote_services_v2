//import 'dart:async';

// import 'package:connectycube_sdk/connectycube_chat.dart';

class ChatManager {
  static ChatManager? _instance;

  ChatManager._();

  static ChatManager get instance => _instance ??= ChatManager._();

/*StreamController<CubeMessage> sentMessagesController =
      StreamController.broadcast();

  Stream<CubeMessage> get sentMessagesStream {
    return sentMessagesController.stream;
  }

  StreamController<MessageStatus> readMessagesController =
      StreamController.broadcast();

  Stream<MessageStatus> get readMessagesStream {
    return readMessagesController.stream;
  }*/
}
