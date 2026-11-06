// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devis_entity_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DevisEntityStates _$DevisEntityStatesFromJson(Map<String, dynamic> json) =>
    _DevisEntityStates(
      devis: (json['devis'] as List<dynamic>)
          .map((e) => DevisModelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DevisEntityStatesToJson(_DevisEntityStates instance) =>
    <String, dynamic>{'devis': instance.devis.map((e) => e.toJson()).toList()};
