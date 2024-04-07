import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_id.freezed.dart';
part 'user_id.g.dart';

@freezed
class UserId with _$UserId {
  const factory UserId({
    required int value,
  }) = _UserId;

  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

}