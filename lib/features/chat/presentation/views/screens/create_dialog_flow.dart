import 'package:egote_services_v2/features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/cube_config/cube_config.dart';
import '../../../../common/application/navigation/navigation.dart';
import 'chat_screens.dart';

class CreateDialog extends ConsumerWidget {
  const CreateDialog({super.key, required this.currentUser});

  final CubeUserMig currentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
        key: Navigation.createDialogNavigation,
        initialRoute: 'search_users',
        onGenerateRoute: (RouteSettings settings) {
          Map<String, dynamic>? args =
              settings.arguments as Map<String, dynamic>?;

          Widget page;

          switch (settings.name) {
            case 'search_users':
              page = CreateChatScreen(cubeUser: currentUser);
              break;
            case 'configure_group_dialog':
              page = NewGroupDialogScreen(
                currentUser: args![USER_ARG_NAME],
                cubeDialog: args[DIALOG_ARG_NAME],
                users: args[SELECTED_USERS_ARG_NAME],
              );
              break;
            default:
              page = CreateChatScreen(cubeUser: args![USER_ARG_NAME]);
              break;
          }

          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
          );
        });
  }
}
