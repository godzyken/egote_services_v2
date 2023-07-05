
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';

abstract class CubeUserRepositoryInterface {
  /// Get Cube users list
  Future<List<CubeUser>> getAllCubeUsers();
  /// Get Cube user by id
  Future<CubeUser> getCubeUserById();
  /// Get Cube users by ids
  Future<Map<int, CubeUser>> getCubeUsersByIds(Set<int> ids);
  /// Create Cube user
  Future<CubeUser> createCubeUser(final UserModel userModel);
  /// Update Cube user
  Future<void> updateCubeUser(final UserId id, final UserModel userModel);
  /// Delete Cube user
  Future<int> deleteCubeUser(final UserId userId);
  /// Exclude Cube user
  Future<int> excludeCubeUser(final UserId userId, final UserModel userModel);

}