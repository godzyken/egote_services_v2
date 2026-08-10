import 'dart:async';
import 'dart:collection';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_core.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/chat/domain/repository/cube_user_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CubeUserRepository implements CubeUserRepositoryInterface {
  @override
  Future<CubeUser> createCubeUser(UserModel userModel) async {
    final cubeUser = CubeUser(
      login: userModel.authUser.email ?? userModel.userEntityModel.name,
      fullName: userModel.userEntityModel.name,
      email: userModel.authUser.email,
      phone: userModel.authUser.phone,
      password: userModel.authUser.id,
    );
    return await signUp(cubeUser);
  }

  @override
  Future<int> deleteCubeUser(UserId userId) async {
    await deleteUser(userId.value);
    return userId.value;
  }

  @override
  Future<int> excludeCubeUser(UserId userId, UserModel userModel) async {
    // Business logic for exclusion could be complex, for now we just delete
    await deleteUser(userId.value);
    return userId.value;
  }

  @override
  Future<List<CubeUser>> getAllCubeUsers() async {
    final result = await getUsers({});
    return result?.items ?? [];
  }

  @override
  Future<CubeUser> getCubeUserById() async {
    // If no ID is provided, we might be getting the current user or this is a bug in the interface
    // For now, let's assume it fetches the current user if possible or throw
    final currentSession = CubeSessionManager.instance.activeSession;
    if (currentSession != null && currentSession.userId != null) {
      final result = await getUserById(currentSession.userId!);
      return result!;
    }
    throw Exception("No active session to get current user by ID");
  }

  @override
  Future<Map<int, CubeUser>> getCubeUsersByIds(Set<int> ids) async {
    Completer<Map<int, CubeUser>> completer = Completer();
    Map<int, CubeUser> users = HashMap();
    try {
      var result =
          await (getAllUsersByIds(ids) as FutureOr<PagedResult<CubeUser>>);
      users.addAll({for (var item in result.items) item.id!: item});
    } catch (ex) {
      log("exception= $ex");
    }
    completer.complete(users);
    return completer.future;
  }

  @override
  Future<void> updateCubeUser(UserId id, UserModel userModel) async {
    final cubeUser = CubeUser(
      id: id.value,
      fullName: userModel.userEntityModel.name,
      email: userModel.authUser.email,
      phone: userModel.authUser.phone,
    );
    await updateUser(cubeUser);
  }
}

final cubeUserRepositoryProvider = Provider.autoDispose<CubeUserRepository>(
  (ref) => CubeUserRepository(),
);
