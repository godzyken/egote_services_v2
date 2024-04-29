enum MessageState { sent, delivered, read }

class MessageStatus {
  late int userId;
  late String messageId;
  String? dialogId;
}
