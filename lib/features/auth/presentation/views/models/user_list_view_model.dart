import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_list_entity.dart';
import 'package:egote_services_v2/features/auth/domain/providers/usecases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/domain/entities/states/state.dart';
import '../../../domain/usecases/usescases_extention.dart';
import 'filter_status_view.dart';

class UserListViewModel extends StateNotifier<State<UserList>> {
  final GetUserListCase _getUserListCase;
  final CreateUserCase _createUserCase;
  final UpdateUserCase _updateUserCase;
  final DeleteUserCase _deleteUserCase;

  UserListViewModel(
      this._getUserListCase,
      this._createUserCase,
      this._updateUserCase,
      this._deleteUserCase
      ) : super(const State.init()) {
    _getUserList();
  }

  _getUserList() async {
    try {
      state = const State.loading();
      final userList = await _getUserListCase.execute();
      state = State.success(userList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  createUser(
      final String name,
      final DateTime createdAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      final String role,
      ) async {
    try {
      developer.log('CreateUser() : start try with name: $name');

      state = const State.loading();
      final newUser = await _createUserCase.execute(
          name,
          createdAt,
          updateAt,
          emailConfirmedAt,
          phoneConfirmedAt,
          lastSignInAt,
          role
      );
      developer.log('New User from CreateUser() : $newUser');

      state.maybeWhen(
        success: (data) {
          state = State.success(UserList(values: [
            UserEntityModel.create(
                name,
                createdAt,
                role
            )
          ]));
        },
        loading: () => const State.loading(),
        error: (err) => State.error(err),
        init: () => State.init,
        orElse: () {},
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  updateUser(final UserEntityModel newUser) async {
    try {
      await _updateUserCase.execute(
          UserId(value: int.parse(newUser.id.toString())),
          newUser.name
          // newUser.createdAt,
          // newUser.updateAt!,
          // newUser.emailConfirmedAt!,
          // newUser.phoneConfirmedAt,
          // newUser.lastSignInAt,
          // newUser.role
      );

      state = State.success(state.data!.updateUser(newUser));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteUser(final UserId id) async {
    try {
      await _deleteUserCase.execute(id);
      state = State.success(state.data!.removeUserById(id));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}

final filteredUserListProvider = Provider.autoDispose<State<UserList>>(
  (ref) {
    final fiterKind = ref.watch(filterKindViewModelStateNotifierProvider);
    final userListState = ref.watch(userListViewModelStateNotifierProvider);

    return userListState.when(
        init: () => const State.init(),
        loading: () => const State.loading(),
        success: (data) {
          switch (fiterKind) {
            case FilterKind.all:
              return State.success(data);
            case FilterKind.available:
              return State.success(data.filterByComplete());
            case FilterKind.unavailable:
              return State.success(data.filterByIncomplete());
            case FilterKind.byId:
              return State.success(data.filterByIncomplete());
          }
        },
        error: (exception) => State.error(exception),
    );
  },
);

final userListViewModelStateNotifierProvider = StateNotifierProvider
    .autoDispose<UserListViewModel, State<UserList>>(
        (ref) => UserListViewModel(
            ref.watch(getUserListUseCaseProvider),
            ref.watch(createUserUseCaseProvider),
            ref.watch(updateUserUseCaseProvider),
            ref.watch(deleteUserUseCaseProvider),
        ),
    dependencies: [
      getUserListUseCaseProvider,
      createUserUseCaseProvider,
      updateUserUseCaseProvider,
      deleteUserUseCaseProvider,
    ],
    name: 'User List View Model State Notifier Provider'
);