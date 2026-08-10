enum AppMessageState { sent, delivered, read }

class AppMessageStatus {
  late int userId;
  late String messageId;
  String? dialogId;

  AppMessageStatus(this.userId, this.messageId, this.dialogId);
}
