import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id_converter.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_list_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'user_id.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

var _uuid = const Uuid();

@freezed
abstract class UserEntityModel with _$UserEntityModel {
  const factory UserEntityModel({
    @UserIdConverter() required UserId id,
    required String name,
    required String email,
    required String avatarUrl,
    required String role,
    required String externalId,
    required String phone,
    required String externalLink,
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
      id: UserId(value: int.parse(doc.id)),
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      role: map['role'] ?? '',
      externalId: map['externalId'] ?? '',
      phone: map['phone'] ?? '',
      externalLink: map['externalLink'] ?? '',
      isComplete: map['is_complete'] ?? false,
      createdAt: DateTime.tryParse(map['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? '') ?? DateTime.now(),
      emailConfirmedAt:
          DateTime.tryParse(map['email_confirmed_at'] ?? '') ?? DateTime.now(),
      phoneConfirmedAt:
          DateTime.tryParse(map['phone_confirmed_at'] ?? '') ?? DateTime.now(),
      lastSignInAt:
          DateTime.tryParse(map['last_sign_in_at'] ?? '') ?? DateTime.now(),
    );
  }

  @FreezedUnionValue('Create')
  factory UserEntityModel.create(
    String name,
    String email,
    String avatarUrl,
    String role,
    String externalId,
    String phone,
    String externalLink,
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
        email: email,
        avatarUrl: avatarUrl,
        role: role,
        externalId: externalId,
        phone: phone,
        externalLink: externalLink,
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
        email: '',
        avatarUrl: '',
        role: '',
        externalId: '',
        phone: '',
        externalLink: '',
        isComplete: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        emailConfirmedAt: DateTime.now(),
        phoneConfirmedAt: DateTime.now(),
        lastSignInAt: DateTime.now(),
      );

  factory UserEntityModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntityModelFromJson(json);

  factory UserEntityModel.fromMap(Map<String, dynamic> map) => UserEntityModel(
        id: UserId(value: map['id']),
        name: map['name'],
        email: map['email'],
        avatarUrl: map['avatarUrl'],
        role: map['role'],
        externalId: map['externalId'],
        phone: map['phone'],
        externalLink: map['externalLink'],
        isComplete: map['isComplete'],
        createdAt: DateTime.parse(map['createdAt']),
        updatedAt: DateTime.parse(map['updatedAt']),
        emailConfirmedAt: DateTime.parse(map['emailConfirmedAt']),
        phoneConfirmedAt: DateTime.parse(map['phoneConfirmedAt']),
        lastSignInAt: DateTime.parse(map['lastSignInAt']),
      );
}

@freezed
abstract class Users with _$Users {
  const factory Users({required UserList userList}) = _Users;

  const factory Users.loading() = _UsersLoading;

  const factory Users.error(Object error, StackTrace stackTrace) = _UsersError;
}

@freezed
abstract class UserModel with _$UserModel {
  @FreezedUnionValue('Complete')
  const factory UserModel.complete({
    @UserIdConverter() required UserId id,
    required UserEntityModel userEntityModel,
  }) = _UserModelComplete;

  @FreezedUnionValue('UnComplete')
  const factory UserModel.unComplete({
    @UserIdConverter() required UserId id,
    required UserEntityModel userEntityModel,
  }) = _UserModelUnComplete;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserEntityModelExt on UserEntityModel {
  Map<String, dynamic> toPartialJson({
    String? name,
    String? email,
    String? avatarUrl,
    String? phone,
    String? externalLink,
  }) {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (phone != null) 'phone': phone,
      if (externalLink != null) 'external_link': externalLink,
      'updated_at': DateTime.now().toIso8601String(),
    };
  }
}
