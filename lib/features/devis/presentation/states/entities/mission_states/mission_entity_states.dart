import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/construction/mission_entity.dart';

part 'mission_entity_states.freezed.dart';
part 'mission_entity_states.g.dart';

@freezed
abstract class MissionEntityStates with _$MissionEntityStates {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MissionEntityStates({
    required List<MissionEntity> missionEntities,
  }) = _MissionEntityStates;

  factory MissionEntityStates.init() =>
      const MissionEntityStates(missionEntities: <MissionEntity>[]);

  factory MissionEntityStates.done() =>
      const MissionEntityStates(missionEntities: <MissionEntity>[]);

  factory MissionEntityStates.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityStatesFromJson(json);
}