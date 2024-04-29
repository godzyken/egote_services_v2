// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';

import '../models/entities/cube_user/cube_user_mig.dart';

abstract class CubeUserRepositoryInterface {
  /// Get Cube users list
  Future<List<CubeUserMig>> getAllCubeUsers();

  /// Get Cube user by id
  Future<CubeUserMig> getCubeUserById();

  /// Get Cube users by ids
  Future<Map<int, CubeUserMig>> getCubeUsersByIds(Set<int> ids);

  /// Create Cube user
  Future<CubeUserMig> createCubeUser(final UserModel userModel);

  /// Update Cube user
  Future<void> updateCubeUser(final UserId id, final UserModel userModel);

  /// Delete Cube user
  Future<int> deleteCubeUser(final UserId userId);

  /// Exclude Cube user
  Future<int> excludeCubeUser(final UserId userId, final UserModel userModel);
}
