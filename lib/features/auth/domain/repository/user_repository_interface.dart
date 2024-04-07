import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';

import '../entities/user/user_list_entity.dart';

///  Users Repository Interface

abstract class UserRepositoryInterface {
  ///  Get users list
  Future<UserList> getAllUsers();

  ///  Get user by id
  //Future<UserEntityModel> getUserById(UserId id);

  ///  Create user
  Future<UserEntityModel> createUser(
      final String name,
      final String role,
      final bool isComplete,
      final DateTime createdAt,
      final DateTime updatedAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      );

  ///  Update user
  Future<void> updateUser(
      final UserId id,
      final String name,
      final String role,
      final bool isComplete,
      final DateTime createdAt,
      final DateTime updatedAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      );

  ///  Delete user by id
  Future<int> deleteUser(final UserId id);

  /// Close database
  Future<void> closeDatabase();
}