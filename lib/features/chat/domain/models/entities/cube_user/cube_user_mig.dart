import 'package:freezed_annotation/freezed_annotation.dart';

part 'cube_user_mig.freezed.dart';
part 'cube_user_mig.g.dart';

@freezed
class CubeUserMig with _$CubeUserMig {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CubeUserMig(
      {int? id,
      String? login,
      String? email,
      String? password,
      String? fullName,
      String? phone,
      String? website,
      int? externalId,
      String? facebookId,
      String? twitterId,
      Set<String>? tags,
      String? oldPassword,
      String? customData,
      String? avatar,
      dynamic customDataClass,
      bool? isGuest,
      int? timeZone}) = _CubeUserMig;

  const CubeUserMig._();

  factory CubeUserMig.fromJson(Map<String, dynamic> json) =>
      _$CubeUserMigFromJson(json);
}
