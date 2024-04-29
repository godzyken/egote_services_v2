import 'package:egote_services_v2/features/chat/domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import 'package:egote_services_v2/features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_chat_screen.dart';

class NewGroupDialogScreen extends ConsumerWidget {
  const NewGroupDialogScreen(
      {super.key,
      required this.currentUser,
      required this.cubeDialog,
      required this.users});

  final CubeUserMig currentUser;
  final CubeDialogMig cubeDialog;
  final List<CubeUserMig> users;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.groupConf),
        centerTitle: true,
      ),
      body: NewChatScreen(
          currentUser: currentUser, cubeDialog: cubeDialog, users: users),
      resizeToAvoidBottomInset: false,
    );
  }
}
