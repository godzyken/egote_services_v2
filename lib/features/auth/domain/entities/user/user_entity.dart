import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/adapter/user/user_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
@immutable
class UserEntityModel with _$UserEntityModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserEntityModel({
    required String id,
    required String name,
  }) = _UserEntityModelInit;

  const factory UserEntityModel.complete({
    required String id,
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
      id: doc.id,
      name: map['name'] ?? '',
    );
  }
}
