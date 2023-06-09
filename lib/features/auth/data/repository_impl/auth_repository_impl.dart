import 'package:egote_services_v2/features/auth/data/data_sources/database/source_base.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/mapper/user_list_mapper.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/mapper/user_mapper.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';

import '../../domain/entities/user/user_list_entity.dart';


class AuthRepositoryImpl implements UserRepositoryInterface {
  final SourceBase database;

  AuthRepositoryImpl(this.database);

  @override
  Future<UserEntityModel> createUser(
      final String name,
      final DateTime createAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      final String role) async {
    final userEntity = await database
        .insertUser(UserMapper.transformToNewEntityMap(name));

    return UserMapper.transformToModel(userEntity);
  }

  @override
  Future<int> deleteUser(final UserId id) async {
    return await database.deleteUser(id.value);
  }

  @override
  Future<UserList> getAllUsers() async {
    final userListEntity = await database.getAllUsers();
    return UserListMapper.transformToModel(userListEntity);
  }

 /* @override
  Future<UserEntityModel> getUserById(UserId id) async {
    final userEntity = await database.getUserById(id.value);
    return UserMapper.transformToModel(userEntity);
  }*/

  @override
  Future<void> updateUser(
      final UserId id,
      final String name,
      final DateTime createAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      final String role) async {
    final user = UserEntityModel(
      id: id,
      name: name,
      createdAt: createAt,
      updatedAt: updateAt,
      emailConfirmedAt: emailConfirmedAt,
      phoneConfirmedAt: phoneConfirmedAt,
      lastSignInAt: lastSignInAt,
      role: role,
    );

    await database.updateUser(UserMapper.transformToMap(user));
  }


}
