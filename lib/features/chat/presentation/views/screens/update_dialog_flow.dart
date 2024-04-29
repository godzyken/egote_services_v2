import 'package:egote_services_v2/features/chat/presentation/views/screens/chat_screens.dart';
import 'package:egote_services_v2/features/common/application/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/cube_config/cube_config.dart';
import '../../../domain/models/entities/cube_dialog/cube_dialog_mig.dart';
import '../../../domain/models/entities/cube_user/cube_user_mig.dart';

class UpdateDialog extends ConsumerWidget {
  const UpdateDialog(
      {super.key, required this.currentUser, required this.currentDialog});

  final CubeUserMig currentUser;
  final CubeDialogMig currentDialog;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      key: Navigation.updateDialogNavigation,
      initialRoute: 'dialog_info',
      onGenerateRoute: (settings) {
        Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;

        MaterialPageRoute pageRoute;

        switch (settings.name) {
          case 'dialog_info':
            pageRoute = MaterialPageRoute(
              builder: (context) => ChatDetailsScreen(
                  cubeUser: currentUser, cubeDialog: currentDialog),
            );
            break;
          case 'search_users':
            pageRoute = MaterialPageRoute(
              builder: (context) => AddOccupantScreen(
                cubeUser: args![USER_ARG_NAME],
                id: currentUser.id!,
              ),
            );
            break;
          default:
            pageRoute = MaterialPageRoute(
                builder: (context) => ChatDetailsScreen(
                    cubeUser: args![USER_ARG_NAME],
                    cubeDialog: args[DIALOG_ARG_NAME]));
            break;
        }

        return pageRoute;
      },
    );
  }
}
