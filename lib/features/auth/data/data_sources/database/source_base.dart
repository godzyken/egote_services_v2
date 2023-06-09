
import '../../entities/users_entity.dart';

abstract class SourceBase {
  Future<UserListEntity> getAllUsers();
  Future<UserEntity> insertUser(final UserEntity userEntity);
  Future<void> updateUser(final UserEntity userEntity);
  //Future<int> getUserById(final int id);
  Future<int> deleteUser(final int id);
  Future<int> deleteAllUsers();
  Future close();
}
