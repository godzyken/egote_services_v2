import 'dart:async';
import 'dart:collection';

//import 'package:connectycube_sdk/connectycube_core.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/chat/domain/models/entities/cube_user/cube_user_mig.dart';
import 'package:egote_services_v2/features/chat/domain/repository/cube_user_repository_interface.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CubeUserRepository implements CubeUserRepositoryInterface {
  @override
  Future<CubeUserMig> createCubeUser(UserModel userModel) {
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
  Future<List<CubeUserMig>> getAllCubeUsers() {
    // TODO: implement getAllCubeUsers
    throw UnimplementedError();
  }

  @override
  Future<CubeUserMig> getCubeUserById() {
    // TODO: implement getCubeUserById
    throw UnimplementedError();
  }

  @override
  Future<Map<int, CubeUserMig>> getCubeUsersByIds(Set<int> ids) async {
    Completer<Map<int, CubeUserMig>> completer = Completer();
    Map<int, CubeUserMig> users = HashMap();
    /*try {
      var result =
          await (getAllUsersByIds(ids) as FutureOr<PagedResult<CubeUserMig>>);
      users.addAll({for (var item in result.items) item.id!: item});
    } catch (ex) {
      log("exception= $ex");
    }*/
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
  (ref) => CubeUserRepository(),
);
