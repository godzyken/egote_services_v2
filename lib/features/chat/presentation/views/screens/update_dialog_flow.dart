import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/config/app_shared/extensions/consts.dart';
import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/common/application/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateDialog extends ConsumerWidget {
  const UpdateDialog({
    Key? key,
    required this.currentUser,
    required this.currentDialog
  }) : super(key: key);

  final CubeUser currentUser;
  final CubeDialog currentDialog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: Navigation.updateDialogNavigation,
      initialRoute: 'dialog_info',
      onGenerateRoute: (settings) {
        Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;

        MaterialPageRoute pageRoute;

        switch(settings.name) {
          case 'dialog_info':
            pageRoute = MaterialPageRoute(
              builder: (context) =>
                  ChatDetailsScreen(
                      cubeUser: currentUser,
                      cubeDialog: currentDialog),
            );
            break;
          case 'search_users':
            pageRoute = MaterialPageRoute(
              builder: (context) =>
                  AddOccupantScreen(cubeUser: args![USER_ARG_NAME]),
            );
            break;
          default:
            pageRoute = MaterialPageRoute(
                builder: (context) => ChatDetailsScreen(
                    cubeUser: args![USER_ARG_NAME],
                    cubeDialog: args[DIALOG_ARG_NAME])
            );
            break;
        }

        return pageRoute;
      },
    );
  }
}
