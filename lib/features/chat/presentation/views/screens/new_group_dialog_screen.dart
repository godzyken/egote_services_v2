import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_chat_screen.dart';

class NewGroupDialogScreen extends ConsumerWidget {
  const NewGroupDialogScreen({
    Key? key,
    required this.currentUser,
    required this.cubeDialog,
    required this.users
  }) : super(key: key);

  final CubeUser currentUser;
  final CubeDialog cubeDialog;
  final List<CubeUser> users;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group configuration...'),
        centerTitle: true,
      ),
      body: NewChatScreen(currentUser: currentUser, cubeDialog: cubeDialog, users: users),
      resizeToAvoidBottomInset: false,
    );
  }
}
