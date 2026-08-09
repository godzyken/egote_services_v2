import 'dart:async';
import 'dart:developer' as dev;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:file_picker/file_picker.dart' as fp;
import 'package:flutter/foundation.dart' as fd;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

import '../../../application/managers/chat_manager.dart';
import '../../../infrastructure/repositories/cube_repository.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    super.key,
    required this.cubeUser,
    required this.cubeDialog,
  });

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final Map<int?, CubeUser?> _occupants = {};

  late bool isLoading;
  late StreamSubscription<List<ConnectivityResult>> connectivityStateSubscription;
  String? imageUrl;

  List<CubeMessage> listMessage = [];
  Timer? typingTimer;
  bool isTyping = false;
  String userStatus = '';

  static const int messagesPerPage = 50;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  StreamSubscription<CubeMessage>? msgSubscription;
  StreamSubscription<MessageStatus>? deliveredSubscription;
  StreamSubscription<MessageStatus>? readSubscription;
  StreamSubscription<TypingStatus>? typingSubscription;

  final List<CubeMessage> _unreadMessages = [];

  late FocusNode _editMessageFocusNode;

  @override
  void initState() {
    super.initState();

    _initCubeChat();

    isLoading = false;
    imageUrl = '';
    listScrollController.addListener(onScrollChanged);

    connectivityStateSubscription = Connectivity()
        .onConnectivityChanged
        .listen(onConnectivityChanged);

    _editMessageFocusNode = FocusNode();
  }

  @override
  void dispose() {
    msgSubscription?.cancel();
    deliveredSubscription?.cancel();
    readSubscription?.cancel();
    typingSubscription?.cancel();
    textEditingController.dispose();
    listScrollController.dispose();
    _editMessageFocusNode.dispose();
    connectivityStateSubscription.cancel();
    super.dispose();
  }

  void _initCubeChat() {
    msgSubscription = ChatManager.instance.chatMessagesStream.listen((message) {
      if (message.dialogId == widget.cubeDialog.dialogId) {
        addMessageToListView(message);
      }
    });

    deliveredSubscription = ChatManager.instance.deliveredMessagesStream.listen((status) {
      if (status.dialogId == widget.cubeDialog.dialogId) {
        onDeliveredMessage(status);
      }
    });

    readSubscription = ChatManager.instance.readMessagesStream.listen((status) {
      if (status.dialogId == widget.cubeDialog.dialogId) {
        onReadMessage(status);
      }
    });

    typingSubscription = ChatManager.instance.typingStatusStream.listen((status) {
      if (status.dialogId == widget.cubeDialog.dialogId) {
        onTypingMessage(status);
      }
    });
  }

  void onConnectivityChanged(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      dev.log('[Connectivity] Connexion perdue');
    } else {
      dev.log('[Connectivity] Connexion rétablie');
      _resendUnreadMessages();
    }
  }

  void _resendUnreadMessages() {
    if (_unreadMessages.isNotEmpty &&
        CubeChatConnection.instance.chatConnectionState == CubeChatConnectionState.Ready) {
      for (var msg in List<CubeMessage>.from(_unreadMessages)) {
        widget.cubeDialog.readMessage(msg);
        _unreadMessages.remove(msg);
      }
    }
  }

  void onScrollChanged() {
    if (listScrollController.position.pixels == listScrollController.position.maxScrollExtent) {
      // Charger la page suivante si nécessaire
    }
  }

  void openGallery() async {
    fp.FilePickerResult? result = await fp.FilePicker.pickFiles(
      type: fp.FileType.image,
    );

    if (result == null) return;

    setState(() {
      isLoading = true;
    });

    final uploadImageFuture = ref.read(cubeRepositoryProvider).getUploadingImageFuture(result);
    Uint8List imageData;

    if (fd.kIsWeb) {
      imageData = result.files.single.bytes!;
    } else {
      imageData = File(result.files.single.path!).readAsBytesSync();
    }

    final decodedImage = await decodeImageFromList(imageData);
    uploadImageFile(uploadImageFuture, decodedImage);
  }

  Future<void> uploadImageFile(Future<CubeFile> uploadAction, dynamic imageData) async {
    try {
      final cubeFile = await uploadAction;
      onSendChatAttachment(cubeFile, imageData);
    } catch (ex) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        context.showAlert('Impossible de charger ce fichier image');
      }
    }
  }

  void onDeliveredMessage(MessageStatus status) {
    dev.log("onDeliveredMessage message= $status");
    updateReadDeliveredStatusMessage(status, false);
  }

  void onReadMessage(MessageStatus status) {
    dev.log("onReadMessage message= ${status.messageId}");
    updateReadDeliveredStatusMessage(status, true);
  }

  void onTypingMessage(TypingStatus status) {
    dev.log("TypingStatus message= ${status.userId}");
    if (status.userId == widget.cubeUser.id ||
        (status.dialogId != null && status.dialogId != widget.cubeDialog.dialogId)) {
      return;
    }
    userStatus = _occupants[status.userId]?.fullName ??
        _occupants[status.userId]?.login ??
        _occupants[status.userId]?.email ??
        '';
    if (userStatus.isEmpty) return;
    userStatus = "$userStatus est en train d'écrire...";

    if (!isTyping) {
      setState(() {
        isTyping = true;
      });
    }
    startTypingTimer();
  }

  void startTypingTimer() {
    typingTimer?.cancel();
    typingTimer = Timer(const Duration(milliseconds: 900), () {
      if (mounted) {
        setState(() {
          isTyping = false;
        });
      }
    });
  }

  void onSendChatMessage(String content) {
    if (content.trim().isNotEmpty) {
      final message = createCubeMsg();
      message.body = content.trim();
      onSendMessage(message);
    } else {
      context.showAlert('Aucun texte à envoyer');
    }
  }

  void onSendChatAttachment(CubeFile cubeFile, dynamic imageData) async {
    final attachment = CubeAttachment();
    attachment.id = cubeFile.uid;
    attachment.type = CubeAttachmentType.IMAGE_TYPE;
    attachment.url = cubeFile.getPublicUrl();
    attachment.height = imageData.height;
    attachment.width = imageData.width;

    final message = createCubeMsg();
    message.body = "Pièce jointe";
    message.attachments = [attachment];
    onSendMessage(message);
  }

  CubeMessage createCubeMsg() {
    final message = CubeMessage();
    message.dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    message.markable = true;
    message.saveToHistory = true;
    return message;
  }

  void onSendMessage(CubeMessage message) async {
    dev.log("onSendMessage message= $message");
    textEditingController.clear();
    await widget.cubeDialog.sendMessage(message);
    message.senderId = widget.cubeUser.id;
    addMessageToListView(message);
    if (listScrollController.hasClients) {
      listScrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    if (widget.cubeDialog.type == CubeDialogType.PRIVATE) {
      ChatManager.instance.sentMessagesController.add(
        message..dialogId = widget.cubeDialog.dialogId,
      );
    }
  }

  void updateReadDeliveredStatusMessage(MessageStatus status, bool isRead) {
    dev.log('[updateReadDeliveredStatusMessage]');
    setState(() {
      final index = listMessage.indexWhere((msg) => msg.messageId == status.messageId);
      if (index != -1) {
        final msg = listMessage[index];
        if (isRead) {
          msg.readIds == null ? msg.readIds = [status.userId] : msg.readIds?.add(status.userId);
        } else {
          msg.deliveredIds == null ? msg.deliveredIds = [status.userId] : msg.deliveredIds?.add(status.userId);
        }
      }
    });
  }

  void addMessageToListView(CubeMessage message) {
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
    void markAsReadIfNeed() {
      var isOpponentMsgRead = message.readIds != null && message.readIds!.contains(widget.cubeUser.id);
      if (message.senderId != widget.cubeUser.id && !isOpponentMsgRead) {
        if (message.readIds == null) {
          message.readIds = [widget.cubeUser.id!];
        } else {
          message.readIds!.add(widget.cubeUser.id!);
        }

        if (CubeChatConnection.instance.chatConnectionState == CubeChatConnectionState.Ready) {
          widget.cubeDialog.readMessage(message);
        } else {
          _unreadMessages.add(message);
        }

        ChatManager.instance.readMessagesController.add(
          MessageStatus(widget.cubeUser.id!, message.messageId!, widget.cubeDialog.dialogId!),
        );
      }
    }

    Widget getDateWidget() {
      return Text(
        DateFormat('HH:mm').format(
          DateTime.fromMillisecondsSinceEpoch((message.dateSent ?? 0) * 1000),
        ),
        style: const TextStyle(color: Colors.grey, fontSize: 12.0, fontStyle: FontStyle.italic),
      );
    }

    if (message.senderId == widget.cubeUser.id) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0, right: 10.0),
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                message.body ?? '',
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
            getDateWidget(),
          ],
        ),
      );
    } else {
      markAsReadIfNeed();
      return Container(
        margin: const EdgeInsets.only(bottom: 10.0, left: 10.0),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              child: Text(
                (_occupants[message.senderId]?.fullName ?? '?')[0].toUpperCase(),
              ),
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    message.body ?? '',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                getDateWidget(),
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget buildTyping() {
    return Visibility(
      visible: isTyping,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(16.0),
        child: Text(
          userStatus,
          style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
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
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.image),
              onPressed: openGallery,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Flexible(
            child: TextField(
              autofocus: true,
              focusNode: _editMessageFocusNode,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Saisissez votre message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => onSendChatMessage(textEditingController.text),
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListMessage() {
    return Flexible(
      child: FutureBuilder<List<CubeMessage>>(
        future: getMessagesList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            listMessage = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) => buildItem(index, listMessage[index]),
              itemCount: listMessage.length,
              reverse: true,
              controller: listScrollController,
            );
          }
        },
      ),
    );
  }

  Future<List<CubeMessage>> getMessagesList() async {
    if (listMessage.isNotEmpty) return listMessage;

    try {
      final pagedResult = await getMessages(
        widget.cubeDialog.dialogId!,
        {
          'limit': messagesPerPage,
          'sort_desc': 'date_sent',
        },
      );
      listMessage = pagedResult?.items.cast<CubeMessage>() ?? [];
      return listMessage;
    } catch (error) {
      dev.log("Erreur de récupération des messages : $error");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  buildListMessage(),
                  buildTyping(),
                  buildInput(),
                ],
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}