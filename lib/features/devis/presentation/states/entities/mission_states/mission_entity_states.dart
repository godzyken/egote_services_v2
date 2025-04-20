import 'package:egote_services_v2/features/devis/domain/entities/value_objects/converter/mission_entity_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/construction/mission_entity.dart';

part 'mission_entity_states.freezed.dart';
part 'mission_entity_states.g.dart';

@freezed
sealed class MissionEntityStates with _$MissionEntityStates {
  const factory MissionEntityStates({
    @MissionEntityConverter() required List<MissionEntity> missionEntities,
  }) = _MissionEntityStates;

  factory MissionEntityStates.init() =>
      const MissionEntityStates(missionEntities: <MissionEntity>[]);

  factory MissionEntityStates.done() =>
      const MissionEntityStates(missionEntities: <MissionEntity>[]);

  factory MissionEntityStates.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityStatesFromJson(json);
}
