import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/adapter/user/user_converter.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
@immutable
class UserEntityModel with _$UserEntityModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserEntityModel({
    required UserId id,
    required String name,
    @JsonKey(includeIfNull: false) DateTime? createdAt,
    @JsonKey(includeIfNull: false) DateTime? updatedAt,
    @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
    @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
    @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
    String? role,
  }) = _UserEntityModelInit;

  const factory UserEntityModel.complete({
    required UserId id,
    required String name,
    @UserConverter() required AuthUser authUser,
    required CubeUser cubeUser,
  }) = _UserEntityModelComplete;

  const factory UserEntityModel.unComplete({
    required String id,
    required String name,
    @UserConverter() required AuthUser authUser,
  }) = _UserEntityModelUnComplete;

  factory UserEntityModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntityModelFromJson(json);

  factory UserEntityModel.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return UserEntityModel(
      id: UserId(value: int.parse('doc.id')),
      name: map['name'] ?? '',
    );
  }
}
