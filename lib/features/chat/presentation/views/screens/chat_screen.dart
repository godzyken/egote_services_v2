import 'dart:async';
import 'dart:developer' as dev;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/app_shared/extensions/extensions.dart'
    as platform_utils;
import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

import '../../../../../config/cube_config/cube_config.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../application/managers/chat_manager.dart';
import '../../../infrastructure/repositories/cube_repository.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.cubeUser, required this.cubeDialog});

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  ConsumerState createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final Map<int?, CubeUser?> _occupants = {};

  late bool isLoading;
  late StreamSubscription<ConnectivityResult> connectivityStateSubscription;
  String? imageUrl;
  List<CubeMessage> listMessage = [];
  Timer? typingTimer;
  bool isTyping = false;
  String userStatus = '';

  static const int messagesPerPage = 50;
  static const int TYPING_TIMEOUT = 700;
  static const int STOP_TYPING_TIMEOUT = 2000;

  int _sendIsTypingTime = DateTime.now().millisecondsSinceEpoch;
  int lastPartSize = 0;
  Timer? _sendStopTypingTimer;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  StreamSubscription<CubeMessage>? msgSubscription;
  StreamSubscription<MessageStatus>? deliveredSubscription;
  StreamSubscription<MessageStatus>? readSubscription;
  StreamSubscription<TypingStatus>? typingSubscription;
  StreamSubscription<MessageReaction>? reactionsSubscription;

  List<CubeMessage> oldMessages = [];

  final List<CubeMessage> _unreadMessages = [];
  final List<CubeMessage> _unsentMessages = [];

  late FocusNode _editMessageFocusNode;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                // List of messages
                buildListMessage(),
                //Typing content
                buildTyping(),
                // Input content
                buildInput(),
              ],
            ),

            // Loading
            buildLoading()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _initCubeChat();

    isLoading = false;
    imageUrl = '';
    listScrollController.addListener(onScrollChanged);
    connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen(onConnectivityChanged);
    _editMessageFocusNode = createEditMessageFocusNode();
  }

  @override
  void dispose() {
    msgSubscription?.cancel();
    deliveredSubscription?.cancel();
    readSubscription?.cancel();
    typingSubscription?.cancel();
    reactionsSubscription?.cancel();
    textEditingController.dispose();
    connectivityStateSubscription.cancel();
    super.dispose();
  }

  void openGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result == null) return;

    setState(() {
      isLoading = true;
    });

    var uploadImageFuture =
        ref.watch(cubeRepositoryProvider).getUploadingImageFuture(result);
    Uint8List imageData;

    if (kIsWeb) {
      imageData = result.files.single.bytes!;
    } else {
      imageData = File(result.files.single.path!).readAsBytesSync();
    }

    var decodedImage = await decodeImageFromList(imageData);

    uploadImageFile(uploadImageFuture, decodedImage);
  }

  Future uploadImageFile(Future<CubeFile> uploadAction, imageData) async {
    uploadAction.then((cubeFile) {
      onSendChatAttachment(cubeFile, imageData);
    }).catchError((ex) {
      setState(() {
        isLoading = false;
      });
      context.showAlert('This file is not an image');
    });
  }

  void onReceiveMessage(CubeMessage message) {
    log("onReceiveMessage message= $message");
    if (message.dialogId != widget.cubeDialog.dialogId) return;

    addMessageToListView(message);
  }

  void onDeliveredMessage(MessageStatus status) {
    log("onDeliveredMessage message= $status");
    updateReadDeliveredStatusMessage(status, false);
  }

  void onReadMessage(MessageStatus status) {
    log("onReadMessage message= ${status.messageId}");
    updateReadDeliveredStatusMessage(status, true);
  }

  void onReactionReceived(MessageReaction reaction) {
    log("onReactionReceived message= ${reaction.messageId}");
    _updateMessageReactions(reaction);
  }

  void onTypingMessage(TypingStatus status) {
    log("TypingStatus message= ${status.userId}");
    if (status.userId == widget.cubeUser.id ||
        (status.dialogId != null &&
            status.dialogId != widget.cubeDialog.dialogId)) {
      return;
    }
    userStatus = _occupants[status.userId]?.fullName ??
        _occupants[status.userId]?.login ??
        _occupants[status.userId]?.email ??
        '';
    if (userStatus.isEmpty) return;
    userStatus = "$userStatus is typing ...";

    if (isTyping != true) {
      setState(() {
        isTyping = true;
      });
    }
    startTypingTimer();
  }

  startTypingTimer() {
    typingTimer?.cancel();
    typingTimer = Timer(const Duration(milliseconds: 900), () {
      setState(() {
        isTyping = false;
      });
    });
  }

  void onSendChatMessage(String content) {
    if (content.trim() != '') {
      final message = createCubeMsg();
      message.body = content.trim();
      onSendMessage(message);
    } else {
      context.showAlert('Nothing to send');
    }
  }

  void onSendChatAttachment(CubeFile cubeFile, imageData) async {
    final attachment = CubeAttachment();
    attachment.id = cubeFile.uid;
    attachment.type = CubeAttachmentType.IMAGE_TYPE;
    attachment.url = cubeFile.getPublicUrl();
    attachment.height = imageData.height;
    attachment.width = imageData.width;
    final message = createCubeMsg();
    message.body = "Attachment";
    message.attachments = [attachment];
    onSendMessage(message);
  }

  CubeMessage createCubeMsg() {
    var message = CubeMessage();
    message.dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    message.markable = true;
    message.saveToHistory = true;
    return message;
  }

  void onSendMessage(CubeMessage message) async {
    log("onSendMessage message= $message");
    textEditingController.clear();
    await widget.cubeDialog.sendMessage(message);
    message.senderId = widget.cubeUser.id;
    addMessageToListView(message);
    listScrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    if (widget.cubeDialog.type == CubeDialogType.PRIVATE) {
      ChatManager.instance.sentMessagesController
          .add(message..dialogId = widget.cubeDialog.dialogId);
    }
  }

  updateReadDeliveredStatusMessage(MessageStatus status, bool isRead) {
    log('[updateReadDeliveredStatusMessage]');
    setState(() {
      CubeMessage? msg =
          listMessage.firstWhere((msg) => msg.messageId == status.messageId);
      if (isRead) {
        msg.readIds == null
            ? msg.readIds = [status.userId]
            : msg.readIds?.add(status.userId);
      } else {
        msg.deliveredIds == null
            ? msg.deliveredIds = [status.userId]
            : msg.deliveredIds?.add(status.userId);
      }

      log('[updateReadDeliveredStatusMessage] status updated for $msg');
    });
  }

  addMessageToListView(CubeMessage message) {
    setState(() {
      isLoading = false;
      int existMessageIndex = listMessage.indexWhere((cubeMessage) {
        return cubeMessage.messageId == message.messageId;
      });

      if (existMessageIndex != -1) {
        listMessage[existMessageIndex] = message;
      } else {
        listMessage.insert(0, message);
      }
    });
  }

  Widget buildItem(int index, CubeMessage message) {
    markAsReadIfNeed() {
      var isOpponentMsgRead = message.readIds != null &&
          message.readIds!.contains(widget.cubeUser.id);
      dev.log(
          "markAsReadIfNeed message= $message, isOpponentMsgRead= $isOpponentMsgRead");
      if (message.senderId != widget.cubeUser.id && !isOpponentMsgRead) {
        if (message.readIds == null) {
          message.readIds = [widget.cubeUser.id!];
        } else {
          message.readIds!.add(widget.cubeUser.id!);
        }

        if (CubeChatConnection.instance.chatConnectionState ==
            CubeChatConnectionState.Ready) {
          widget.cubeDialog.readMessage(message);
          // } else {
          //   _unreadMessages.add(message);
        }

        ChatManager.instance.readMessagesController.add(MessageStatus(
            widget.cubeUser.id!,
            message.messageId!,
            widget.cubeDialog.dialogId!));
      }
    }

    Widget getReadDeliveredWidget() {
      log("[getReadDeliveredWidget]");
      bool messageIsRead() {
        log("[getReadDeliveredWidget] messageIsRead");
        if (widget.cubeDialog.type == CubeDialogType.PRIVATE) {
          return message.readIds != null &&
              (message.recipientId == null ||
                  message.readIds!.contains(message.recipientId));
        }
        return message.readIds != null &&
            message.readIds!.any((int id) =>
                id != widget.cubeUser.id && _occupants.keys.contains(id));
      }

      bool messageIsDelivered() {
        log("[getReadDeliveredWidget] messageIsDelivered");
        if (widget.cubeDialog.type == CubeDialogType.PRIVATE) {
          return message.deliveredIds != null &&
              (message.recipientId == null ||
                  message.deliveredIds!.contains(message.recipientId));
        }
        return message.deliveredIds != null &&
            message.deliveredIds!.any((int id) =>
                id != widget.cubeUser.id && _occupants.keys.contains(id));
      }

      if (messageIsRead()) {
        log("[getReadDeliveredWidget] if messageIsRead");
        return getMessageStateWidget(MessageState.read);
      } else if (messageIsDelivered()) {
        log("[getReadDeliveredWidget] if messageIsDelivered");
        return getMessageStateWidget(MessageState.delivered);
      } else {
        log("[getReadDeliveredWidget] sent");
        return getMessageStateWidget(MessageState.sent);
      }
    }

    Widget getDateWidget() {
      return Text(
        DateFormat('HH:mm').format(
            DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)),
        style: const TextStyle(
            color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
      );
    }

    Widget getHeaderDateWidget() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10.0),
        child: Text(
          DateFormat('dd MMMM').format(
              DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)),
          style: TextStyle(
              color: Colors.primaries.single,
              fontSize: 20.0,
              fontStyle: FontStyle.italic),
        ),
      );
    }

    bool isHeaderView() {
      int headerId = int.parse(DateFormat('ddMMyyyy').format(
          DateTime.fromMillisecondsSinceEpoch(message.dateSent! * 1000)));
      if (index >= listMessage.length - 1) {
        return false;
      }
      var msgPrev = listMessage[index + 1];
      int nextItemHeaderId = int.parse(DateFormat('ddMMyyyy').format(
          DateTime.fromMillisecondsSinceEpoch(msgPrev.dateSent! * 1000)));
      var result = headerId != nextItemHeaderId;
      return result;
    }

    if (message.senderId == widget.cubeUser.id) {
      // Right (own message)
      return Column(
        children: <Widget>[
          isHeaderView() ? getHeaderDateWidget() : const SizedBox.shrink(),
          GestureDetector(
            onLongPress: () => _reactOnMessage(message),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                      right: 4.0),
                  child: GestureDetector(
                    onTap: () => _reactOnMessage(message),
                    child: const Icon(Icons.add_reaction_outlined,
                        size: 16, color: Colors.grey),
                  ),
                ),
                message.attachments?.isNotEmpty ?? false
                    // Image
                    ? Container(
                        margin: EdgeInsets.only(
                            bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                            right: 10.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // TODO: regler se shit
                                  context.push('fullPhoto',
                                      extra: MaterialPageRoute(
                                          builder: (context) => FullPhoto(
                                              url: message
                                                  .attachments!.first.url!)));
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => Container(
                                      width: 200.0,
                                      height: 200.0,
                                      padding: const EdgeInsets.all(70.0),
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.grey),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Material(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Assets.lottie.image.imgNotAvailable
                                          .image(
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    imageUrl: message.attachments!.first.url!,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (message.reactions != null &&
                                  message.reactions!.total.isNotEmpty)
                                getReactionsWidget(message),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  getDateWidget(),
                                  getReadDeliveredWidget(),
                                ],
                              ),
                            ]),
                      )
                    : message.body != null && message.body!.isNotEmpty
                        // Text
                        ? Flexible(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 480),
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 15.0, 10.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0)),
                              margin: EdgeInsets.only(
                                  bottom:
                                      isLastMessageRight(index) ? 20.0 : 10.0,
                                  right: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      message.body!,
                                      style: TextStyle(
                                          color: Colors.primaries.single),
                                    ),
                                    if (message.reactions != null &&
                                        message.reactions!.total.isNotEmpty)
                                      getReactionsWidget(message),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        getDateWidget(),
                                        getReadDeliveredWidget(),
                                      ],
                                    ),
                                  ]),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 10.0, 15.0, 10.0),
                            width: 200.0,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0)),
                            margin: EdgeInsets.only(
                                bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                                right: 10.0),
                            child: Text(
                              context.tr!.empty,
                              style: TextStyle(color: Colors.primaries.single),
                            ),
                          ),
              ],
            ),
          ),
        ],
      );
    } else {
      // Left (opponent message)
      markAsReadIfNeed();
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isHeaderView() ? getHeaderDateWidget() : const SizedBox.shrink(),
            GestureDetector(
              onLongPress: () => _reactOnMessage(message),
              child: Row(
                children: <Widget>[
                  getUserAvatarWidget(_occupants[message.senderId], 30),
                  message.attachments?.isNotEmpty ?? false
                      ? Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //TODO: fix this shit
                                    context.push('fullPhoto',
                                        extra: MaterialPageRoute(
                                            builder: (context) => FullPhoto(
                                                url: message
                                                    .attachments!.first.url!)));
                                  },
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0)),
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) => Container(
                                        width: 200.0,
                                        height: 200.0,
                                        padding: const EdgeInsets.all(70.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                        child: const CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.grey),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Material(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.asset(
                                          'images/img_not_available.jpeg',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      imageUrl: message.attachments!.first.url!,
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (message.reactions != null &&
                                    message.reactions!.total.isNotEmpty)
                                  getReactionsWidget(message),
                                getDateWidget(),
                              ]),
                        )
                      : message.body != null && message.body!.isNotEmpty
                          ? Flexible(
                              child: Container(
                                constraints: const BoxConstraints(
                                    minWidth: 0.0, maxWidth: 480),
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 10.0, 15.0, 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.primaries.single,
                                    borderRadius: BorderRadius.circular(8.0)),
                                margin: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        message.body!,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      if (message.reactions != null &&
                                          message.reactions!.total.isNotEmpty)
                                        getReactionsWidget(message),
                                      getDateWidget(),
                                    ]),
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 15.0, 10.0),
                              width: 200.0,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0)),
                              margin: EdgeInsets.only(
                                  bottom:
                                      isLastMessageRight(index) ? 20.0 : 10.0,
                                  right: 10.0),
                              child: Text(
                                "Empty",
                                style:
                                    TextStyle(color: Colors.primaries.single),
                              ),
                            ),
                  Padding(
                    padding: const EdgeInsets.only(
                        // bottom: isLastMessageRight(index) ? 20.0 : 10.0,
                        left: 4.0),
                    child: GestureDetector(
                      onTap: () => _reactOnMessage(message),
                      child: Icon(Icons.add_reaction_outlined,
                          size: 16, color: Colors.primaries.single),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 && listMessage[index - 1].id == widget.cubeUser.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 && listMessage[index - 1].id != widget.cubeUser.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(),
    );
  }

  Widget buildTyping() {
    return Visibility(
      visible: isTyping,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(16.0),
        child: Text(
          userStatus,
          style: TextStyle(color: Colors.primaries.single),
        ),
      ),
    );
  }

  Widget buildInput() {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: const Icon(Icons.image),
                onPressed: () {
                  openGallery();
                },
                color: Colors.primaries.single,
              ),
            ),
          ),

          // Edit text
          Flexible(
            child: TextField(
              autofocus: platform_utils.isDesktop(),
              focusNode: _editMessageFocusNode,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: Colors.primaries.single, fontSize: 15.0),
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (text) {
                sendIsTypingStatus();
              },
            ),
          ),

          // Button send message
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => onSendChatMessage(textEditingController.text),
                color: Colors.primaries.single,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListMessage() {
    getWidgetMessages(listMessage) {
      return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) => buildItem(index, listMessage[index]),
        itemCount: listMessage.length,
        reverse: true,
        controller: listScrollController,
      );
    }

    return Flexible(
      child: StreamBuilder<List<CubeMessage>>(
        stream: getMessagesList().asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey)));
          } else {
            listMessage = snapshot.data ?? [];
            return getWidgetMessages(listMessage);
          }
        },
      ),
    );
  }

  Future<List<CubeMessage>> getMessagesList() async {
    if (listMessage.isNotEmpty) return Future.value(listMessage);

    Completer<List<CubeMessage>> completer = Completer();
    List<CubeMessage>? messages;
    try {
      await Future.wait<void>([
        getMessagesByDate(0, false).then((loadedMessages) {
          isLoading = false;
          messages = loadedMessages;
        }),
        getAllUsersByIds(widget.cubeDialog.occupantsIds!.toSet()).then(
            (result) => _occupants
                .addAll({for (var item in result!.items) item.id: item}))
      ]);
      completer.complete(messages);
    } catch (error) {
      completer.completeError(error);
    }
    return completer.future;
  }

  void onScrollChanged() {
    if ((listScrollController.position.pixels ==
            listScrollController.position.maxScrollExtent) &&
        messagesPerPage >= lastPartSize) {
      setState(() {
        isLoading = true;

        if (oldMessages.isNotEmpty) {
          getMessagesBetweenDates(
                  oldMessages.first.dateSent ?? 0,
                  listMessage.last.dateSent ??
                      DateTime.now().millisecondsSinceEpoch ~/ 1000)
              .then((newMessages) {
            setState(() {
              isLoading = false;

              listMessage.addAll(newMessages);

              if (newMessages.length < messagesPerPage) {
                oldMessages.insertAll(0, listMessage);
                listMessage = List.from(oldMessages);
                oldMessages.clear();
              }
            });
          });
        } else {
          getMessagesByDate(listMessage.last.dateSent ?? 0, false)
              .then((messages) {
            setState(() {
              isLoading = false;
              listMessage.addAll(messages);
            });
          });
        }
      });
    }
  }

  Future<bool> onBackPress() {
    //TODO: fix that too
    return Navigator.pushNamedAndRemoveUntil<bool>(
        context, 'select_dialog', (r) => false,
        arguments: {USER_ARG_NAME: widget.cubeUser}).then((value) {
      return true;
    });
  }

  _initChatListeners() {
    log("[_initChatListeners]");
    msgSubscription = CubeChatConnection
        .instance.chatMessagesManager!.chatMessagesStream
        .listen(onReceiveMessage);
    deliveredSubscription = CubeChatConnection
        .instance.messagesStatusesManager!.deliveredStream
        .listen(onDeliveredMessage);
    readSubscription = CubeChatConnection
        .instance.messagesStatusesManager!.readStream
        .listen(onReadMessage);
    typingSubscription = CubeChatConnection
        .instance.typingStatusesManager!.isTypingStream
        .listen(onTypingMessage);
    reactionsSubscription = CubeChatConnection
        .instance.messagesReactionsManager?.reactionsStream
        .listen(onReactionReceived);
  }

  void _initCubeChat() {
    log("_initCubeChat");
    if (ref.watch(cubeChatConnectionProvider).isAuthenticated()) {
      log("[_initCubeChat] isAuthenticated");
      _initChatListeners();
    } else {
      log("[_initCubeChat] not authenticated");
      ref
          .watch(cubeChatConnectionProvider)
          .connectionStateStream
          .listen((state) {
        log("[_initCubeChat] state $state");
        if (CubeChatConnectionState.Ready == state) {
          _initChatListeners();

          if (_unreadMessages.isNotEmpty) {
            for (var cubeMessage in _unreadMessages) {
              widget.cubeDialog.readMessage(cubeMessage);
            }
            _unreadMessages.clear();
          }

          if (_unsentMessages.isNotEmpty) {
            for (var cubeMessage in _unsentMessages) {
              widget.cubeDialog.sendMessage(cubeMessage);
            }

            _unsentMessages.clear();
          }
        }
      });
    }
  }

  void sendIsTypingStatus() {
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var isTypingTimeout = currentTime - _sendIsTypingTime;
    if (isTypingTimeout >= TYPING_TIMEOUT) {
      _sendIsTypingTime = currentTime;
      widget.cubeDialog.sendIsTypingStatus();
      _startStopTypingStatus();
    }
  }

  void _startStopTypingStatus() {
    _sendStopTypingTimer?.cancel();
    _sendStopTypingTimer =
        Timer(const Duration(milliseconds: STOP_TYPING_TIMEOUT), () {
      widget.cubeDialog.sendStopTypingStatus();
    });
  }

  Future<List<CubeMessage>> getMessagesByDate(int date, bool isLoadNew) async {
    var params = GetMessagesParameters();
    params.sorter = RequestSorter(SORT_DESC, '', 'date_sent');
    params.limit = messagesPerPage;
    params.filters = [
      RequestFilter('', 'date_sent', isLoadNew || date == 0 ? 'gt' : 'lt', date)
    ];

    return getMessages(
            widget.cubeDialog.dialogId!, params.getRequestParameters())
        .then((result) {
          lastPartSize = result!.items.length;

          return result.items;
        })
        .whenComplete(() {})
        .catchError((onError) {
          return List<CubeMessage>.empty(growable: true);
        });
  }

  Future<List<CubeMessage>> getMessagesBetweenDates(
      int startDate, int endDate) async {
    var params = GetMessagesParameters();
    params.sorter = RequestSorter(SORT_DESC, '', 'date_sent');
    params.limit = messagesPerPage;
    params.filters = [
      RequestFilter('', 'date_sent', 'gt', startDate),
      RequestFilter('', 'date_sent', 'lt', endDate)
    ];

    return getMessages(
            widget.cubeDialog.dialogId!, params.getRequestParameters())
        .then((result) {
      return result!.items;
    });
  }

  void onConnectivityChanged(ConnectivityResult connectivityType) {
    log("[ChatScreenState] connectivityType changed to '$connectivityType'");
    setState(() {
      isLoading = true;
    });

    switch (connectivityType) {
      case ConnectivityResult.bluetooth:
      // TODO: Handle this case.
      case ConnectivityResult.wifi:
        getMessagesBetweenDates(listMessage.first.dateSent ?? 0,
                DateTime.now().millisecondsSinceEpoch ~/ 1000)
            .then((newMessages) {
          setState(() {
            if (newMessages.length == messagesPerPage) {
              oldMessages = List.from(listMessage);
              listMessage = newMessages;
            } else {
              listMessage.insertAll(0, newMessages);
            }
          });
        }).whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
      case ConnectivityResult.ethernet:
      // TODO: Handle this case.
      case ConnectivityResult.mobile:
        getMessagesBetweenDates(listMessage.first.dateSent ?? 0,
                DateTime.now().millisecondsSinceEpoch ~/ 1000)
            .then((newMessages) {
          setState(() {
            if (newMessages.length == messagesPerPage) {
              oldMessages = List.from(listMessage);
              listMessage = newMessages;
            } else {
              listMessage.insertAll(0, newMessages);
            }
          });
        }).whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
      case ConnectivityResult.none:
      // TODO: Handle this case.
      case ConnectivityResult.vpn:
        getMessagesBetweenDates(listMessage.first.dateSent ?? 0,
                DateTime.now().millisecondsSinceEpoch ~/ 1000)
            .then((newMessages) {
          setState(() {
            if (newMessages.length == messagesPerPage) {
              oldMessages = List.from(listMessage);
              listMessage = newMessages;
            } else {
              listMessage.insertAll(0, newMessages);
            }
          });
        }).whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
      case ConnectivityResult.other:
      // TODO: Handle this case.
    }
  }

  getReactionsWidget(CubeMessage message) {
    if (message.reactions == null) return Container();

    var isOwnMessage = message.senderId == widget.cubeUser.id;

    return LayoutBuilder(builder: (context, constraints) {
      var widgetWidth =
          constraints.maxWidth == double.infinity ? 240 : constraints.maxWidth;
      var maxColumns = (widgetWidth / 60).round();
      if (message.reactions!.total.length < maxColumns) {
        maxColumns = message.reactions!.total.length;
      }

      return SizedBox(
          width: maxColumns * 56,
          child: GridView.count(
            primary: false,
            crossAxisCount: maxColumns,
            mainAxisSpacing: 4,
            childAspectRatio: 2,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 4),
            children: <Widget>[
              ...message.reactions!.total.keys.map((reaction) {
                return GestureDetector(
                    onTap: () => _performReaction(Emoji(reaction, ''), message),
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: isOwnMessage ? 4 : 0,
                          right: isOwnMessage ? 0 : 4,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              color: message.reactions!.own.contains(reaction)
                                  ? Colors.green
                                  : Colors.grey,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(reaction,
                                      style: kIsWeb
                                          ? const TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'NotoColorEmoji')
                                          : null),
                                  Text(
                                      ' ${message.reactions!.total[reaction].toString()}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                ],
                              )),
                        )));
              })
            ],
          ));
    });
  }

  _reactOnMessage(CubeMessage message) {
    showDialog<Emoji>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  width: 400,
                  height: 400,
                  child: EmojiPicker(
                    config: const Config(
                      emojiTextStyle: kIsWeb
                          ? TextStyle(
                              color: Colors.green, fontFamily: 'NotoColorEmoji')
                          : null,
                      iconColorSelected: Colors.green,
                      indicatorColor: Colors.green,
                      bgColor: Colors.white,
                    ),
                    onEmojiSelected: (category, emoji) {
                      context.pop(emoji);
                    },
                  )));
        }).then((emoji) {
      log("onEmojiSelected emoji: ${emoji?.emoji}");
      if (emoji != null) {
        _performReaction(emoji, message);
      }
    });
  }

  void _performReaction(Emoji emoji, CubeMessage message) {
    if ((message.reactions?.own.isNotEmpty ?? false) &&
        (message.reactions?.own.contains(emoji.emoji) ?? false)) {
      removeMessageReaction(message.messageId!, emoji.emoji);
      _updateMessageReactions(MessageReaction(
          widget.cubeUser.id!, widget.cubeDialog.dialogId!, message.messageId!,
          removeReaction: emoji.emoji));
    } else {
      addMessageReaction(message.messageId!, emoji.emoji);
      _updateMessageReactions(MessageReaction(
          widget.cubeUser.id!, widget.cubeDialog.dialogId!, message.messageId!,
          addReaction: emoji.emoji));
    }
  }

  void _updateMessageReactions(MessageReaction reaction) {
    log('[_updateMessageReactions]');
    setState(() {
      CubeMessage? msg = listMessage
          .firstWhereOrNull((msg) => msg.messageId == reaction.messageId);
      if (msg == null) return;

      if (msg.reactions == null) {
        msg.reactions = CubeMessageReactions.fromJson({
          'own': {
            if (reaction.userId == widget.cubeUser.id) reaction.addReaction
          },
          'total': {reaction.addReaction: 1}
        });
      } else {
        if (reaction.addReaction != null) {
          if (reaction.userId != widget.cubeUser.id ||
              !(msg.reactions?.own.contains(reaction.addReaction) ?? false)) {
            if (reaction.userId == widget.cubeUser.id) {
              msg.reactions!.own.add(reaction.addReaction!);
            }

            msg.reactions!.total[reaction.addReaction!] =
                msg.reactions!.total[reaction.addReaction] == null
                    ? 1
                    : msg.reactions!.total[reaction.addReaction]! + 1;
          }
        }

        if (reaction.removeReaction != null) {
          if (reaction.userId != widget.cubeUser.id ||
              (msg.reactions?.own.contains(reaction.removeReaction) ?? false)) {
            if (reaction.userId == widget.cubeUser.id) {
              msg.reactions!.own.remove(reaction.removeReaction!);
            }

            msg.reactions!.total[reaction.removeReaction!] =
                msg.reactions!.total[reaction.removeReaction] != null &&
                        msg.reactions!.total[reaction.removeReaction]! > 0
                    ? msg.reactions!.total[reaction.removeReaction]! - 1
                    : 0;
          }

          msg.reactions!.total.removeWhere((key, value) => value == 0);
        }
      }
    });
  }

  FocusNode createEditMessageFocusNode() {
    return FocusNode(
      onKey: (FocusNode node, RawKeyEvent evt) {
        if (!evt.isShiftPressed && evt.logicalKey == LogicalKeyboardKey.enter) {
          if (evt is RawKeyDownEvent) {
            onSendChatMessage(textEditingController.text);
          }
          _editMessageFocusNode.requestFocus();
          return KeyEventResult.handled;
        } else if (evt.logicalKey == LogicalKeyboardKey.enter) {
          if (evt is RawKeyDownEvent) {
            setState(() {
              textEditingController.text = '${textEditingController.text}\n';
              textEditingController.selection = TextSelection.collapsed(
                  offset: textEditingController.text.length);
            });
          }
          _editMessageFocusNode.requestFocus();
          return KeyEventResult.handled;
        } else {
          return KeyEventResult.ignored;
        }
      },
    );
  }
}
