import 'dart:developer';

import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app_shared/extensions/extensions.dart';
import '../../../domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import '../../../domain/models/entities/cube_user/cube_user_mig.dart';

class ChatDialogScreen extends ConsumerWidget {
  const ChatDialogScreen({
    super.key,
    required this.cubeUser,
    required this.cubeDialog,
  });

  final CubeUserMig cubeUser;
  final CubeDialogMig cubeDialog;

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
                color: Colors.white,
              )),
        ],
      ),
      body: ChatScreen(cubeUser: cubeUser, cubeDialog: cubeDialog),
    );
  }
}

void showChatDetails(BuildContext context, CubeUserMig cubeUser,
    CubeDialogMig cubeDialog) async {
  log("_chatDetails= $cubeDialog");

  showModal(
      context: context,
      child: UpdateDialog(currentUser: cubeUser, currentDialog: cubeDialog));
}
