import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/adapter/user/user_converter.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../chat/domain/models/entities/cube_user/cube_user_mig.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

var _uuid = const Uuid();

@freezed
class UserEntityModel with _$UserEntityModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserEntityModel({
    required UserId id,
    required String name,
    required String role,
    required bool isComplete,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime emailConfirmedAt,
    required DateTime phoneConfirmedAt,
    required DateTime lastSignInAt,
  }) = _UserEntityModel;

  const UserEntityModel._();

  UserEntityModel complete() => copyWith(isComplete: true);

  UserEntityModel uncomplete() => copyWith(isComplete: false);

  @FreezedUnionValue('FromFirestore')
  factory UserEntityModel.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return UserEntityModel(
      id: UserId(value: int.parse('doc.id')),
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      isComplete: map['is_complete'] ? true : false,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      emailConfirmedAt: map['email_confirmed_at'] ?? '',
      phoneConfirmedAt: map['phone_confirmed_at'] ?? '',
      lastSignInAt: map['last_sign_in_at'] ?? '',
    );
  }

  @FreezedUnionValue('Create')
  factory UserEntityModel.create(
    String name,
    String role,
    bool isComplete,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime emailConfirmedAt,
    DateTime phoneConfirmedAt,
    DateTime lastSignInAt,
  ) {
    return UserEntityModel(
        id: UserId(value: int.parse(_uuid.v4())),
        name: name,
        role: role,
        isComplete: isComplete,
        createdAt: createdAt,
        updatedAt: updatedAt,
        emailConfirmedAt: emailConfirmedAt,
        phoneConfirmedAt: phoneConfirmedAt,
        lastSignInAt: lastSignInAt);
  }

  @FreezedUnionValue('Empty')
  factory UserEntityModel.empty() => UserEntityModel(
        id: const UserId(value: 0),
        name: '',
        role: '',
        isComplete: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        emailConfirmedAt: DateTime.now(),
        phoneConfirmedAt: DateTime.now(),
        lastSignInAt: DateTime.now(),
      );

  factory UserEntityModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntityModelFromJson(json);
}

@freezed
class Users with _$Users {
  const factory Users.data(
    UserList userList,
  ) = UsersData;

  const factory Users.loading() = UsersLoading;

  const factory Users.error(Object error, StackTrace stackTrace) = UsersError;
}

@freezed
class UserModel with _$UserModel {
  @FreezedUnionValue('Complete')
  const factory UserModel.complete({
    required UserId id,
    required UserEntityModel userEntityModel,
    @UserConverter() required AuthUser authUser,
    required CubeUserMig cubeUser,
  }) = _UserModelComplete;

  @FreezedUnionValue('UnComplete')
  const factory UserModel.unComplete({
    required UserId id,
    required UserEntityModel userEntityModel,
    @UserConverter() required AuthUser authUser,
  }) = _UserModelUnComplete;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
