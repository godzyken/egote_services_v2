import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/entities_extension.dart';
import '../../models/userlist/user_list_view_model.dart';
import '../../widgets/widgets_extensions.dart';


class UserListScreen extends ConsumerWidget {
  UserListScreen({Key? key}) : super(key: key);

  final _filteredUserListProvider = filteredUserListProvider;
  final _userListProvider = userListViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(_userListProvider.notifier).testAdd();
    return Scaffold(
      appBar: AppBar(title: Text(context.tr!.selectUserGuess),),
      body: Column(
        children: [
          ChipsBarWidget(),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          Consumer(builder:
              (context, ref, _) => ref
                  .watch(_filteredUserListProvider)
                  .maybeWhen(
                success: (data) => _buildUserListContainerWidget(context, ref, data),
                error: (exception) => Expanded(child: Center(child: ErrorWidget(exception),)),
                orElse: () => const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),)),
              ),
          )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
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

  Widget _buildUserItemCardWidget(final BuildContext context, final WidgetRef ref, final UserEntityModel userEntityModel) => InkWell(
    onTap: () => context.go('/userForm'),
    child: Card(child: Padding(padding: const EdgeInsets.all(8.0), child: Row(
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
            Text(
              DateFormat('yyyy/MM/dd').format(userEntityModel.createdAt),
              style: context.textTheme.displaySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
        const SizedBox(width: 8,),
        userEntityModel.name.isNotEmpty ? _buildCheckedIcon(ref, userEntityModel) : _buildUncheckedIcon(ref, userEntityModel),
      ],
    ),),),
  );

  Widget _buildCheckedIcon(final WidgetRef ref, final UserEntityModel userEntityModel) {
    return InkResponse(
      onTap: () => ref.watch(_userListProvider.notifier).availableUser(userEntityModel),
      splashColor: Colors.transparent,
      child: const Icon(
        Icons.done,
        size: 24,
        color: Colors.lightGreen,
      ),
    );
  }

  Widget _buildUncheckedIcon(final WidgetRef ref, final UserEntityModel userEntityModel) {
    return InkResponse(
      onTap: () => ref.watch(_userListProvider.notifier).unavailableUser(userEntityModel),
      splashColor: Colors.transparent,
      child: const Icon(
        Icons.radio_button_off_rounded,
        size: 24,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildFloatingActionButton(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.go('/userForm'),
      child: const Icon(Icons.add),
    );
  }

}
