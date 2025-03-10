import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
abstract class CustomData with _$CustomData {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CustomData({
    required String name,
    required bool testing,
  }) = _CustomData;

  factory CustomData.fromJson(Map<String, dynamic> json) =>
      _$CustomDataFromJson(json);
}
