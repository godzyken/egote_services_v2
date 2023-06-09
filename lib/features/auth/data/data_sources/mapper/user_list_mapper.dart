import 'package:egote_services_v2/features/auth/data/data_sources/mapper/user_mapper.dart';
import 'package:egote_services_v2/features/auth/data/entities/users_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_list_entity.dart';


class UserListMapper {
  static UserList transformToModel(final UserListEntity entities) {
    final values = entities.map((e) => UserMapper.transformToModel(e)).toList();
    return UserList(values: values);
  }

  static UserListEntity transformToMap(final UserList model) =>
      model.values.map((e) => UserMapper.transformToMap(e)).toList();
}
