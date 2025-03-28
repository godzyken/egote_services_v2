import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/entities_extension.dart';
import '../../models/userlist/user_list_view_model.dart';
import '../../widgets/widgets_extensions.dart';

class UserListScreen extends ConsumerWidget {
  UserListScreen({super.key});

  final _filteredUserListProvider = filteredUserListProvider;
  final _userListProvider = userListViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(_userListProvider.notifier).testAdd();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.selectUserGuess),
      ),
      body: Column(
        children: [
          ChipsBarWidget(),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          Consumer(
            builder: (context, ref, _) =>
                ref.watch(_filteredUserListProvider).maybeWhen(
                      success: (data) =>
                          _buildUserListContainerWidget(context, ref, data),
                      error: (exception) => Expanded(
                          child: Center(
                        child: ErrorWidget(exception),
                      )),
                      orElse: () => const Expanded(
                          child: Center(
                        child: CircularProgressIndicator(),
                      )),
                    ),
          )
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildUserListContainerWidget(
      BuildContext context, WidgetRef ref, final UserList userList) {
    return Expanded(child: _buildUserListWidget(context, ref, userList));
  }

  Widget _buildUserListWidget(final BuildContext context, final WidgetRef ref,
      final UserList userList) {
    if (userList.length == 0) {
      return Center(
        child: Text(context.tr!.noData),
      );
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

  Widget _buildUserItemCardWidget(final BuildContext context,
          final WidgetRef ref, final UserEntityModel userEntityModel) =>
      InkWell(
        onTap: () => context.goNamed('userForm'),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(context, userEntityModel.name),
                    _buildText(
                        context,
                        DateFormat('yyyy/MM/dd')
                            .format(userEntityModel.createdAt)),
                  ],
                )),
                const SizedBox(
                  width: 8,
                ),
                _buildCheckedIcon(ref, userEntityModel),
              ],
            ),
          ),
        ),
      );

  Widget _buildText(final BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.displaySmall,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCheckedIcon(
      final WidgetRef ref, final UserEntityModel userEntityModel) {
    final bool isAvailable = userEntityModel.name.isNotEmpty;
    return InkResponse(
      onTap: () {
        if (isAvailable) {
          ref.watch(_userListProvider.notifier).availableUser(userEntityModel);
        } else {
          ref
              .watch(_userListProvider.notifier)
              .unavailableUser(userEntityModel);
        }
      },
      splashColor: Colors.transparent,
      child: Icon(
        isAvailable ? Icons.done : Icons.radio_button_checked_rounded,
        size: 24,
        color: isAvailable ? Colors.lightGreen : Colors.grey,
      ),
    );
  }

  Widget _buildFloatingActionButton(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.goNamed('userForm'),
      child: const Icon(Icons.add),
    );
  }
}
