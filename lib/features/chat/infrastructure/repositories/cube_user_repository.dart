import 'dart:async';
import 'dart:collection';

import 'package:connectycube_sdk/connectycube_core.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/chat/domain/repository/cube_user_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CubeUserRepository implements CubeUserRepositoryInterface {
  @override
  Future<CubeUser> createCubeUser(UserModel userModel) {
    // TODO: implement createCubeUser
    throw UnimplementedError();
  }

  @override
  Future<int> deleteCubeUser(UserId userId) {
    // TODO: implement deleteCubeUser
    throw UnimplementedError();
  }

  @override
  Future<int> excludeCubeUser(UserId userId, UserModel userModel) {
    // TODO: implement excludeCubeUser
    throw UnimplementedError();
  }

  @override
  Future<List<CubeUser>> getAllCubeUsers() {
    // TODO: implement getAllCubeUsers
    throw UnimplementedError();
  }

  @override
  Future<CubeUser> getCubeUserById() {
    // TODO: implement getCubeUserById
    throw UnimplementedError();
  }

  @override
  Future<Map<int, CubeUser>> getCubeUsersByIds(Set<int> ids) async {
    Completer<Map<int, CubeUser>> completer = Completer();
    Map<int, CubeUser> users = HashMap();
    try {
      var result = await (getAllUsersByIds(ids)
      as FutureOr<PagedResult<CubeUser>>);
      users.addAll({ for (var item in result.items) item.id! : item });
    } catch (ex) {
      log("exception= $ex");
    }
    completer.complete(users);
    return completer.future;
  }

  @override
  Future<void> updateCubeUser(UserId id, UserModel userModel) {
    // TODO: implement updateCubeUser
    throw UnimplementedError();
  }

}

final cubeUserRepositoryProvider = Provider.autoDispose<CubeUserRepository>(
      (ref) => CubeUserRepository(),);