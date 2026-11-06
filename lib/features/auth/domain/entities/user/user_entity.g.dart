// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntityModel _$UserEntityModelFromJson(Map<String, dynamic> json) =>
    _UserEntityModel(
      id: UserId.fromJson(json['id'] as Map<String, dynamic>),
      name: json['name'] as String,
      role: json['role'] as String,
      isComplete: json['is_complete'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      emailConfirmedAt: json['email_confirmed_at'] == null
          ? null
          : DateTime.parse(json['email_confirmed_at'] as String),
      phoneConfirmedAt: json['phone_confirmed_at'] == null
          ? null
          : DateTime.parse(json['phone_confirmed_at'] as String),
      lastSignInAt: json['last_sign_in_at'] == null
          ? null
          : DateTime.parse(json['last_sign_in_at'] as String),
    );

Map<String, dynamic> _$UserEntityModelToJson(_UserEntityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'is_complete': instance.isComplete,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'email_confirmed_at': instance.emailConfirmedAt?.toIso8601String(),
      'phone_confirmed_at': instance.phoneConfirmedAt?.toIso8601String(),
      'last_sign_in_at': instance.lastSignInAt?.toIso8601String(),
    };

_UserModelComplete _$UserModelCompleteFromJson(Map<String, dynamic> json) =>
    _UserModelComplete(
      id: UserId.fromJson(json['id'] as Map<String, dynamic>),
      userEntityModel: UserEntityModel.fromJson(
        json['user_entity_model'] as Map<String, dynamic>,
      ),
      authUser: const UserConverter().fromJson(
        json['auth_user'] as Map<String, dynamic>,
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UserModelCompleteToJson(_UserModelComplete instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_entity_model': instance.userEntityModel,
      'auth_user': const UserConverter().toJson(instance.authUser),
      'runtimeType': instance.$type,
    };

_UserModelUnComplete _$UserModelUnCompleteFromJson(Map<String, dynamic> json) =>
    _UserModelUnComplete(
      id: UserId.fromJson(json['id'] as Map<String, dynamic>),
      userEntityModel: UserEntityModel.fromJson(
        json['user_entity_model'] as Map<String, dynamic>,
      ),
      authUser: const UserConverter().fromJson(
        json['auth_user'] as Map<String, dynamic>,
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UserModelUnCompleteToJson(
  _UserModelUnComplete instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_entity_model': instance.userEntityModel,
  'auth_user': const UserConverter().toJson(instance.authUser),
  'runtimeType': instance.$type,
};
