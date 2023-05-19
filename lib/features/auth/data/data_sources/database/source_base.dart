import '../../entities/users_entity.dart';

abstract class SourceBase {
  Future<UserListEntity> getAllUsers();
  Future<UserEntity> insertBoat(final UserEntity userEntity);
  Future<void> updateUser(final UserEntity userEntity);
  Future<int> deleteUser(final int id);
  Future<int> deleteAllUsers();
  Future close();
}
