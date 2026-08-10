import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/domain/providers/usecases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/entities_extension.dart';
import '../../../../domain/usecases/usescases_extention.dart';
import 'filter_status_view.dart';

class UserListViewModel extends AsyncNotifier<UserList> {
  late final GetUserListCase _getUserListCase;
  late final CreateUserCase _createUserCase;
  late final UpdateUserCase _updateUserCase;
  late final DeleteUserCase _deleteUserCase;

  @override
  Future<UserList> build() async {
    _getUserListCase = ref.watch(getUserListUseCaseProvider);
    _createUserCase = ref.watch(createUserUseCaseProvider);
    _updateUserCase = ref.watch(updateUserUseCaseProvider);
    _deleteUserCase = ref.watch(deleteUserUseCaseProvider);

    return await _getUserListCase.execute();
  }

  /// Méthode utilitaire pour ajouter un utilisateur de test rapide
  Future<void> testAdd() async {
    final now = DateTime.now();
    final testId = DateTime.now().millisecondsSinceEpoch % 10000;

    developer.log('Ajout d\'un utilisateur de test (Test User $testId)', name: 'UserListViewModel');

    await createUser(
      'Test User $testId',
      'tester',
      true,
      now,
      now,
      now,
      now,
      now,
    );
  }

  Future<void> createUser(
      final String name,
      final String role,
      final bool isComplete,
      final DateTime createdAt,
      final DateTime updatedAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      ) async {
    state = await AsyncValue.guard(() async {
      final currentList = state.value ?? UserList.empty();
      final newUser = await _createUserCase.execute(
        name,
        role,
        isComplete,
        createdAt,
        updatedAt,
        emailConfirmedAt ?? createdAt,
        phoneConfirmedAt ?? createdAt,
        lastSignInAt ?? createdAt,
      );
      return currentList.addUser(newUser);
    });
  }

  Future<void> updateEntityUser(final UserEntityModel newUser) async {
    state = await AsyncValue.guard(() async {
      final currentList = state.value ?? UserList.empty();
      await _updateUserCase.execute(
        newUser.id,
        newUser.name,
        newUser.role,
        newUser.isComplete,
        newUser.createdAt,
        newUser.updatedAt,
        newUser.emailConfirmedAt ?? newUser.createdAt,
        newUser.phoneConfirmedAt ?? newUser.createdAt,
        newUser.lastSignInAt ?? newUser.createdAt,
      );
      return currentList.updateUser(newUser);
    });
  }

  Future<void> deleteUser(final UserId id) async {
    state = await AsyncValue.guard(() async {
      final currentList = state.value ?? UserList.empty();
      await _deleteUserCase.execute(id);
      return currentList.removeUserById(id);
    });
  }

  /// Rend un utilisateur disponible (isComplete = true)
  Future<void> availableUser(UserEntityModel userEntityModel) async {
    await _setUserAvailability(userEntityModel, isAvailable: true);
  }

  /// Rend un utilisateur indisponible (isComplete = false)
  Future<void> unavailableUser(UserEntityModel userEntityModel) async {
    await _setUserAvailability(userEntityModel, isAvailable: false);
  }

  /// Méthode privée générique pour mettre à jour l'état de disponibilité
  Future<void> _setUserAvailability(
      UserEntityModel userEntityModel, {
        required bool isAvailable,
      }) async {
    state = await AsyncValue.guard(() async {
      final currentList = state.value ?? UserList.empty();

      final updatedUser = userEntityModel.copyWith(
        isComplete: isAvailable,
        updatedAt: DateTime.now(),
      );

      developer.log(
        'Changement de disponibilité pour ${updatedUser.name}: $isAvailable',
        name: 'UserListViewModel',
      );

      await _updateUserCase.execute(
        updatedUser.id,
        updatedUser.name,
        updatedUser.role,
        updatedUser.isComplete,
        updatedUser.createdAt,
        updatedUser.updatedAt,
        updatedUser.emailConfirmedAt ?? updatedUser.createdAt,
        updatedUser.phoneConfirmedAt ?? updatedUser.createdAt,
        updatedUser.lastSignInAt ?? updatedUser.createdAt,
      );

      return currentList.updateUser(updatedUser);
    });
  }
}

// Provider Riverpod 3
final userListViewModelNotifierProvider =
AsyncNotifierProvider<UserListViewModel, UserList>(
  UserListViewModel.new,
  name: 'User List View Model Notifier Provider',
);

final filteredUserListProvider = Provider<AsyncValue<UserList>>((ref) {
  final userListAsync = ref.watch(userListViewModelNotifierProvider);
  final filter = ref.watch(filterKindNotifierProvider);

  return userListAsync.whenData((userList) {
    switch (filter) {
      case FilterKind.all:
        return userList;
      case FilterKind.available:
        return userList.filterByComplete();
      case FilterKind.unavailable:
        return userList.filterByIncomplete();
      case FilterKind.byId:
        return userList;
    }
  });
});