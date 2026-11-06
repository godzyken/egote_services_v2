// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travaux_entity_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TravauxEntityStates _$TravauxEntityStatesFromJson(Map<String, dynamic> json) =>
    _TravauxEntityStates(
      travaux: (json['travaux'] as List<dynamic>)
          .map((e) => TravauxEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TravauxEntityStatesToJson(
  _TravauxEntityStates instance,
) => <String, dynamic>{
  'travaux': instance.travaux.map((e) => e.toJson()).toList(),
};
