// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthStateAuthenticated _$AuthStateAuthenticatedFromJson(
  Map<String, dynamic> json,
) => _AuthStateAuthenticated(
  userEntity: UserModel.fromJson(json['user_entity'] as Map<String, dynamic>),
  $type: json['status'] as String?,
);

Map<String, dynamic> _$AuthStateAuthenticatedToJson(
  _AuthStateAuthenticated instance,
) => <String, dynamic>{
  'user_entity': instance.userEntity,
  'status': instance.$type,
};

_AuthStateUnauthenticated _$AuthStateUnauthenticatedFromJson(
  Map<String, dynamic> json,
) => _AuthStateUnauthenticated($type: json['status'] as String?);

Map<String, dynamic> _$AuthStateUnauthenticatedToJson(
  _AuthStateUnauthenticated instance,
) => <String, dynamic>{'status': instance.$type};

_AuthStateInitial _$AuthStateInitialFromJson(Map<String, dynamic> json) =>
    _AuthStateInitial($type: json['status'] as String?);

Map<String, dynamic> _$AuthStateInitialToJson(_AuthStateInitial instance) =>
    <String, dynamic>{'status': instance.$type};
