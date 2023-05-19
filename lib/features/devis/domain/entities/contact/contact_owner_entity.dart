import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_owner_entity.freezed.dart';
part 'contact_owner_entity.g.dart';

@freezed
class ContactOwnerEntity with _$ContactOwnerEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ContactOwnerEntity({
    required int id,
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) = _ContactOwnerEntity;

  const factory ContactOwnerEntity.empty() = _ContactOwnerEntityEmpty;

  factory ContactOwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$ContactOwnerEntityFromJson(json);
}
