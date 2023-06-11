import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_list_entity.dart';
import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/profile_widget.dart';

class UserHomeScreen extends ConsumerWidget {
  final String pid;

  const UserHomeScreen({Key? key, required this.pid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authStreamProvider);
    if (user.asData?.value!.uid == pid) {
      return user.when(data: (data) => Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: LocalImages.venomJpg,
              onClicked: () async {},
            ),
            const SizedBox(),
            buildName(data!.uid),
            const SizedBox(),
            //Consumer(builder: (context, ref, _) => ref.watch(_usersOnTable),)
          ],
        ),
      ),
        error: (error, stackTrace) => ErrorScreen(error: user.error.toString()),
        loading: () => const CircularProgressIndicator(),);
    } else {
      return ErrorScreen(error: user.error.toString());
    }
  }

  Widget buildName(String name) {
    return Column(
    children: [
      Text(
        name,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
        ),
      ),
    ],
  );
  }

  Widget _buildUserListContainerWidget(
      BuildContext context,
      WidgetRef ref,
      final UserList userList
      ) {
    return Expanded(child: _buildUserListWidget(context, ref, userList));
  }

  Widget _buildUserListWidget(
      final BuildContext context,
      final WidgetRef ref,
      final UserList userList) {
    if (userList.length == 0) {
      return Center(child: Text(context.tr!.noBoat),);
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: userList.length,
          itemBuilder: (final BuildContext context, final int index) =>
              _buildUserItemCardWidget(context, ref, userList[index]),
      );
    }
  }

  Widget _buildUserItemCardWidget(
      final BuildContext context,
      final WidgetRef ref,
      final UserEntityModel userEntityModel
      ) => InkWell(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userEntityModel.name,
                  style: context.textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis,
                ),
                // TODO: List of args...
              ],
            ))
          ],
        ),
      ),
    ),
  );

}


