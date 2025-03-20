import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission_id_converter.dart';

part 'mission_entity.freezed.dart';
part 'mission_entity.g.dart';

@freezed
abstract class MissionEntity with _$MissionEntity {
  const factory MissionEntity.initialize({
    @MissionIdConverter() required MissionId id,
    String? denomination,
  }) = _MissionEntityInitialize;

  const factory MissionEntity.done(
      {@MissionIdConverter() required MissionId id,
      required String denomination,
      required DateTime startedAt,
      required DateTime finishedAt,
      required bool doneOk}) = _MissionEntityDone;

  const factory MissionEntity.progress({
    @MissionIdConverter() required MissionId id,
    required String denomination,
    required DateTime startedAt,
  }) = _MissionEntityProgress;

  const factory MissionEntity.abandon(
      {@MissionIdConverter() required MissionId id,
      required String denomination,
      required String reason,
      required DateTime left,
      required bool isLeft}) = _MissionEntityAbandon;

  factory MissionEntity.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityFromJson(json);
}
