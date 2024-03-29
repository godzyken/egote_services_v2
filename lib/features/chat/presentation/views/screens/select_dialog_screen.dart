import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/app_shared/extensions/platform_utils.dart';

class SelectDialogScreen extends ConsumerWidget {
  const SelectDialogScreen({
    super.key,
    required this.currentUser,
    this.onDialogSelectedCallback,
    this.selectedDialog,
  });

  final CubeUser currentUser;
  final Function(CubeDialog)? onDialogSelectedCallback;
  final CubeDialog? selectedDialog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
              title: Text(
                'Logged in as ${currentUser.fullName ?? currentUser.login ?? currentUser.email}',
              ),
            actions: [
              IconButton(
                  onPressed: () => _openSettings(context),
                  icon: const Icon(Icons.settings, color: Colors.white,)
              ),
            ],
          ),
          body: BodySelectedDialogLayout(
              currentUser: currentUser,
              selectedDialog: selectedDialog,
              onDialogSelectedCallback: onDialogSelectedCallback
          ),
        ),
        onWillPop: () => _onBackPressed(),
    );
  }


  Future<bool> _onBackPressed() {
    return Future.value(true);
  }

  _openSettings(BuildContext context) {
    showModal(
        context: context,
        child: ChatSettingsScreen(currentUser: currentUser)
    );
  }
}
