// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_entity_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MissionEntityStates _$MissionEntityStatesFromJson(Map<String, dynamic> json) =>
    _MissionEntityStates(
      missionEntities: (json['mission_entities'] as List<dynamic>)
          .map((e) => MissionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MissionEntityStatesToJson(
  _MissionEntityStates instance,
) => <String, dynamic>{
  'mission_entities': instance.missionEntities.map((e) => e.toJson()).toList(),
};
