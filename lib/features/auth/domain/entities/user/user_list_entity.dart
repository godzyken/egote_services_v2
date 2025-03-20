import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_entity.dart';

part 'user_list_entity.freezed.dart';
part 'user_list_entity.g.dart';

@freezed
sealed class UserList with _$UserList {
  const factory UserList({required List<UserEntityModel> values}) = _UserList;

  const UserList._();

  operator [](final int index) => values[index];

  int get length => values.length;

  @FreezedUnionValue("addUser")
  UserList addUser(final UserEntityModel entity) =>
      copyWith(values: [...values, entity]);

  @FreezedUnionValue("updateUser")
  UserList updateUser(final UserEntityModel entity) {
    return copyWith(
        values: values
            .map((user) => entity.id == user.id ? entity : user)
            .toList());
  }

  @FreezedUnionValue("removeUser")
  UserList removeUserById(final UserId id) =>
      copyWith(values: values.where((user) => user.id == id).toList());

  @FreezedUnionValue("filterByComplete")
  UserList filterByComplete() =>
      copyWith(values: values.where((user) => user.name.isNotEmpty).toList());

  @FreezedUnionValue("filterByIncomplete")
  UserList filterByIncomplete() =>
      copyWith(values: values.where((user) => user.name.isEmpty).toList());

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);

  @override
  List<UserEntityModel> get values => [];
}
