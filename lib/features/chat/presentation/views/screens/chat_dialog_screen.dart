import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app_shared/extensions/extensions.dart';

class ChatDialogScreen extends ConsumerWidget {
  const ChatDialogScreen({
    super.key,
    required this.cubeUser,
    required this.cubeDialog,
  });

  final CubeUser cubeUser;
  final CubeDialog cubeDialog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cubeDialog.name != null ? cubeDialog.name! : ""),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () => showChatDetails(context, cubeUser, cubeDialog),
              icon: const Icon(
                Icons.info_outline,
                color: Colors.white,)
          ),
        ],
      ),
      body: ChatScreen(cubeUser: cubeUser, cubeDialog: cubeDialog),
    );
  }
}

void showChatDetails(
    BuildContext context, CubeUser cubeUser, CubeDialog cubeDialog) async {
  log("_chatDetails= $cubeDialog");

  showModal(
      context: context,
      child: UpdateDialog(
          currentUser: cubeUser,
          currentDialog: cubeDialog));
}