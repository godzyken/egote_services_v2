import 'dart:async';
import 'dart:developer' as dev;

//import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../config/app_shared/extensions/extensions.dart';
import '../../../../../config/cube_config/cube_config.dart';
import '../../../domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import '../../../domain/models/entities/cube_user/cube_user_mig.dart';
import '../../../domain/models/entities/message_state/message_state.dart';
import 'chat_screens.dart';

class BodySelectedDialogLayout extends ConsumerStatefulWidget {
  const BodySelectedDialogLayout(
      {super.key,
      required this.currentUser,
      this.selectedDialog,
      this.onDialogSelectedCallback});

  final CubeUserMig currentUser;
  final Function(CubeDialogMig)? onDialogSelectedCallback;
  final CubeDialogMig? selectedDialog;

  @override
  ConsumerState createState() => _BodySelectedDialogLayoutState();
}

class _BodySelectedDialogLayoutState
    extends ConsumerState<BodySelectedDialogLayout> {
  List<ListItem<CubeDialogMig>> dialogList = [];
  var _isDialogContinues = true;

  //StreamSubscription<CubeMessage>? msgSubscription;
  StreamSubscription<MessageStatus>? msgDeliveringSubscription;
  StreamSubscription<MessageStatus>? msgReadingSubscription;
  StreamSubscription<MessageStatus>? msgLocalReadingSubscription;

  //StreamSubscription<CubeMessage>? msgSendingSubscription;
  // final ChatMessagesManager? chatMessagesManager =
  //     CubeChatConnection.instance.chatMessagesManager;
  Function(CubeDialogMig)? onDialogSelectedCallback;
  CubeDialogMig? selectedDialog;

  Map<String, Set<String>> unreadMessages = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 2),
        child: Column(
          children: [
            Visibility(
                child: Container(
              margin: const EdgeInsets.all(40),
              alignment: FractionalOffset.center,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )),
            Expanded(child: _getDialogsList(context))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: context.tr!.newDialog,
        backgroundColor: Colors.blue,
        onPressed: () => _createNewDialog(context),
        child: const Icon(
          Icons.add_comment,
          color: Colors.white,
        ),
      ),
    );
  }

  void _createNewDialog(BuildContext context) async {
    showModal(
        context: context, child: CreateDialog(currentUser: widget.currentUser));
  }

  void _processGetDialogError(exception) {
    dev.log("GetDialog error $exception");
    setState(() {
      _isDialogContinues = false;
    });
    ErrorScreen(error: exception.toString(), key: context.widget.key);
  }

  Widget _getDialogsList(BuildContext context) {
    /*if (_isDialogContinues) {
      getDialogs().then((dialogs) {
        _isDialogContinues = false;
        dev.log("getDialogs: $dialogs");
        setState(() {
          dialogList.clear();
          dialogList.addAll(
              dialogs?.items.map((dialog) => ListItem(dialog)).toList() ?? []);
        });
      }).catchError((exception) {
        _processGetDialogError(exception);
      });
    }*/
    if (_isDialogContinues && dialogList.isEmpty) {
      return const SizedBox.shrink();
    } else if (dialogList.isEmpty) {
      return Center(
        child: Text(
          context.tr!.noDialogYet,
          style: const TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView.separated(
        itemCount: dialogList.length,
        itemBuilder: _getListItemTile,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            indent: 68,
            height: 1,
          );
        },
      );
    }
  }

  Widget _getListItemTile(BuildContext context, int index) {
    Widget getDialogIcon() {
      var dialog = dialogList[index].data;
      if (dialog.type == CubeDialogTypeMig.PRIVATE) {
        return const Icon(
          Icons.person,
          size: 40.0,
          color: Colors.grey,
        );
      } else {
        return const Icon(
          Icons.group,
          size: 40.0,
          color: Colors.grey,
        );
      }
    }

    getDialogAvatar() {
      var dialog = dialogList[index].data;

      return getDialogAvatarWidget(dialog, 25,
          placeholder: getDialogIcon(), errorWidget: getDialogIcon());
    }

    return Container(
      color: selectedDialog != null &&
              selectedDialog!.dialogId == dialogList[index].data.dialogId
          ? const Color.fromARGB(100, 168, 228, 160)
          : null,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: <Widget>[
            getDialogAvatar(),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dialogList[index].data.name ??
                            context.tr!.dialogUnknown,
                        style: TextStyle(
                            color: Colors.primaries.single,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dialogList[index].data.lastMessage ?? '',
                        style: TextStyle(
                            color: Colors.primaries.single,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: dialogList[index].isSelected,
              child: IconButton(
                iconSize: 25.0,
                icon: const Icon(
                  Icons.delete,
                  color: FlexColor.amberDarkPrimary,
                ),
                onPressed: () {
                  _deleteDialog(context, dialogList[index].data);
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    getMessageStateWidget(dialogList[index]
                        .data
                        .lastMessageDateSent as MessageState),
                    Text(
                      DateFormat('MMM dd').format(
                          dialogList[index].data.lastMessageDateSent != null
                              ? DateTime.fromMillisecondsSinceEpoch(
                                  dialogList[index].data.lastMessageDateSent! *
                                      1000)
                              : dialogList[index].data.updatedAt!),
                      style: TextStyle(color: Colors.primaries.single),
                    ),
                  ],
                ),
                if (dialogList[index].data.unreadMessageCount != null &&
                    dialogList[index].data.unreadMessageCount != 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        dialogList[index].data.unreadMessageCount.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        onLongPress: () {
          setState(() {
            dialogList[index].isSelected = !dialogList[index].isSelected;
          });
        },
        onTap: () {
          _selectDialog(context, dialogList[index].data);
        },
      ),
    );
  }

  void _deleteDialog(BuildContext context, CubeDialogMig dialog) async {
    dev.log("_deleteDialog= $dialog");
    context.showAlert('Coming soon');
  }

  void _selectDialog(BuildContext context, CubeDialogMig dialog) async {
    if (onDialogSelectedCallback != null) {
      onDialogSelectedCallback?.call(dialog);
      setState(() {
        selectedDialog = dialog;
      });
    } else {
      context.pushNamed('chat_dialog',
          extra: {USER_ARG_NAME: widget.currentUser, DIALOG_ARG_NAME: dialog});
    }
  }

  void refresh() {
    setState(() {
      _isDialogContinues = true;
    });
  }

/*  void onReceiveMessage(CubeMessage message) {
    dev.log("onReceiveMessage global message= $message");
    updateDialog(message);
  }*/

/*  updateDialog(CubeMessage msg) {
    ref.watch(cubeRepositoryProvider).refreshBadgeCount();

    ListItem<CubeDialogMig>? dialogItem =
        dialogList.firstWhere((dlg) => dlg.data.dialogId == msg.dialogId);

    setState(() {
      dialogItem.data.lastMessage = msg.body;
      dialogItem.data.lastMessageUserId = msg.viewsCount;

      if (msg.senderId != widget.currentUser.id) {
        dialogItem.data.unreadMessageCount =
            dialogItem.data.unreadMessageCount == null
                ? 1
                : dialogItem.data.unreadMessageCount! + 1;

        unreadMessages[msg.dialogId!] = <String>{
          ...unreadMessages[msg.dialogId] ?? [],
          msg.messageId!
        };

        dialogItem.data.lastMessage = null;
      } else {
        dialogItem.data.lastMessage = MessageState.sent as String?;
      }

      dialogItem.data.lastMessageDateSent = msg.dateSent;
      dialogList.sort((a, b) {
        DateTime dateA;
        if (a.data.lastMessageDateSent != null) {
          dateA = DateTime.fromMillisecondsSinceEpoch(
              a.data.lastMessageDateSent! * 1000);
        } else {
          dateA = a.data.updatedAt!;
        }

        DateTime dateB;
        if (b.data.lastMessageDateSent != null) {
          dateB = DateTime.fromMillisecondsSinceEpoch(
              b.data.lastMessageDateSent! * 1000);
        } else {
          dateB = b.data.updatedAt!;
        }

        if (dateA.isAfter(dateB)) {
          return -1;
        } else if (dateA.isBefore(dateB)) {
          return 1;
        } else {
          return 0;
        }
      });
    });
  }*/

  void onMessageDelivered(MessageStatus messageStatus) {
    //_updateLastMessageState(messageStatus, MessageState.delivered);
  }

  void onMessageRead(MessageStatus messageStatus) {
    //_updateLastMessageState(messageStatus, MessageState.read);

    if (messageStatus.userId == widget.currentUser.id &&
        unreadMessages.containsKey(messageStatus.dialogId)) {
      if (unreadMessages[messageStatus.dialogId]
              ?.remove(messageStatus.messageId) ??
          false) {
/*        setState(() {
          var dialog = dialogList
              .firstWhere((dlg) => dlg.data.dialogId == messageStatus.dialogId)
              .data;

          dialog.unreadMessageCount = dialog.unreadMessageCount == null ||
                  dialog.unreadMessageCount == 0
              ? 0
              : dialog.unreadMessageCount! - 1;
        });*/
      }
    }
  }

/*  void _updateLastMessageState(
      MessageStatus messageStatus, MessageState state) {
    var dialog = dialogList
        .firstWhere((dlg) => dlg.data.dialogId == messageStatus.dialogId)
        .data;

    if (messageStatus.messageId == dialog.lastMessageUserId!.toString() &&
        messageStatus.userId != widget.currentUser.id) {
      if (dialog.lastMessage != state.value) {
        setState(() {
          dialog.lastMessage = state.toString();
        });
      }
    }
  }*/
}
