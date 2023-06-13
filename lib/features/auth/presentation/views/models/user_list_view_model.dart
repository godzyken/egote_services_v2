import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/domain/providers/usecases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/domain/entities/states/state.dart';
import '../../../domain/entities/entities_extension.dart';
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

  availableUser(final UserEntityModel userEntityModel) async {
    final newUser = userEntityModel.copyWith(isComplete: true);
    updateEntityUser(newUser);
  }

  unavailableUser(final UserEntityModel userEntityModel) {
    final newUser = userEntityModel.copyWith(isComplete: false);
    updateEntityUser(newUser);
  }

  createUser(
      final String name,
      final String role,
      final bool isComplete,
      final DateTime createdAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      ) async {
    try {
      developer.log('CreateUser() : start try with name: $name');

      state = const State.loading();
      final newUser = await _createUserCase.execute(
          name,
          role,
          isComplete,
          createdAt,
          updateAt,
          emailConfirmedAt,
          phoneConfirmedAt,
          lastSignInAt
      );
      developer.log('New User from CreateUser() : $newUser');

      state = State.success(state.data!.addUser(newUser));
    } on Exception catch (e) {
      developer.log('Error during createUser(): $e');
      state = State.error(e);
    }
  }

  updateEntityUser(final UserEntityModel newUser) async {
    try {
      developer.log('CreateUser() : start try with name: $newUser');

      state = const State.loading();

      await _updateUserCase.execute(
        newUser.id,
        newUser.name,
        newUser.role,
        newUser.isComplete,
        newUser.createdAt,
        newUser.updatedAt,
        newUser.emailConfirmedAt,
        newUser.phoneConfirmedAt,
        newUser.lastSignInAt,
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
    final filterKind = ref.watch(filterKindViewModelStateNotifierProvider);
    final userListState = ref.watch(userListViewModelStateNotifierProvider);

    return userListState.when(
        init: () => const State.init(),
        loading: () => const State.loading(),
        success: (data) {
          switch (filterKind) {
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