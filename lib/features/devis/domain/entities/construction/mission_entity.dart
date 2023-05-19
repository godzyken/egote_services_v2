import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_entity.freezed.dart';
part 'mission_entity.g.dart';

@freezed
class MissionEntity with _$MissionEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MissionEntity({
    required int id,
    required String denomination,
  }) = _MissionEntity;

  const factory MissionEntity.done(
      {required int id,
      required String denomination,
      required DateTime startedAt,
      required DateTime finishedAt,
      required bool doneOk}) = _MissionEntityDone;

  const factory MissionEntity.progress({
    required int id,
    required String denomination,
    required DateTime startedAt,
  }) = _MissionEntityProgress;

  const factory MissionEntity.abandon(
      {required int id,
      required String denomination,
      required String reason,
      required DateTime left,
      required bool isLeft}) = _MissionEntityAbandon;

  factory MissionEntity.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityFromJson(json);
}
