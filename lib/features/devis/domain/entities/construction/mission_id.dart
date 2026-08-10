import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_id.freezed.dart';
part 'mission_id.g.dart';

@freezed
abstract class MissionId with _$MissionId {
  const factory MissionId({
    required int id,
  }) = _MissionId;

  const MissionId._();

  factory MissionId.fromJson(Map<String, dynamic> json) =>
      _$MissionIdFromJson(json);
}