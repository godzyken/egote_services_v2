import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';

part 'user_list_entity.freezed.dart';

@freezed
class UserList with _$UserList {
  const factory UserList({required List<UserEntityModel> values}) = _UserList;

  const UserList._();

  // Constructeur/factory pour créer une liste vide
  factory UserList.empty() => const UserList(values: []);

  UserEntityModel operator [](final int index) => values[index];

  int get length => values.length;

  UserList addUser(final UserEntityModel entity) =>
      copyWith(values: [...values, entity]);

  UserList updateUser(final UserEntityModel entity) {
    return copyWith(
      values: values.map((user) => entity.id == user.id ? entity : user).toList(),
    );
  }

  // Correction : garder les utilisateurs dont l'ID est DIFFÉRENT de celui supprimé
  UserList removeUserById(final UserId id) =>
      copyWith(values: values.where((user) => user.id != id).toList());

  UserList filterByComplete() =>
      copyWith(values: values.where((user) => user.isComplete).toList());

  UserList filterByIncomplete() =>
      copyWith(values: values.where((user) => !user.isComplete).toList());
}