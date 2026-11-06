// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travaux_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TravauxEntityDefault _$TravauxEntityDefaultFromJson(
  Map<String, dynamic> json,
) => _TravauxEntityDefault(
  id: TravauId.fromJson(json['id'] as Map<String, dynamic>),
  denomination: json['denomination'] as String,
  typesOfWorks: (json['types_of_works'] as List<dynamic>)
      .map((e) => $enumDecode(_$TypesOfWorkEnumMap, e))
      .toList(),
  areaOfServices: (json['area_of_services'] as List<dynamic>)
      .map((e) => $enumDecode(_$AreaOfServicesEnumMap, e))
      .toList(),
  missionEntity: (json['mission_entity'] as List<dynamic>)
      .map((e) => MissionEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TravauxEntityDefaultToJson(
  _TravauxEntityDefault instance,
) => <String, dynamic>{
  'id': instance.id.toJson(),
  'denomination': instance.denomination,
  'types_of_works': instance.typesOfWorks
      .map((e) => _$TypesOfWorkEnumMap[e]!)
      .toList(),
  'area_of_services': instance.areaOfServices
      .map((e) => _$AreaOfServicesEnumMap[e]!)
      .toList(),
  'mission_entity': instance.missionEntity.map((e) => e.toJson()).toList(),
  'runtimeType': instance.$type,
};

const _$TypesOfWorkEnumMap = {
  TypesOfWork.Builds: 'Builds',
  TypesOfWork.Installations: 'Installations',
  TypesOfWork.Services: 'Services',
  TypesOfWork.Cares: 'Cares',
  TypesOfWork.Operations: 'Operations',
};

const _$AreaOfServicesEnumMap = {
  AreaOfServices.FenetrePorte: 'FenetrePorte',
  AreaOfServices.CouvertureToiture: 'CouvertureToiture',
  AreaOfServices.Peinture: 'Peinture',
  AreaOfServices.Plomberie: 'Plomberie',
  AreaOfServices.Ebenisterie: 'Ebenisterie',
  AreaOfServices.Electricite: 'Electricite',
  AreaOfServices.ConstructionRenovation: 'ConstructionRenovation',
  AreaOfServices.JardinExterieur: 'JardinExterieur',
  AreaOfServices.Climatisation: 'Climatisation',
  AreaOfServices.Platre: 'Platre',
  AreaOfServices.Chauffage: 'Chauffage',
  AreaOfServices.SdeSanitaires: 'SdeSanitaires',
  AreaOfServices.Nettoyage: 'Nettoyage',
  AreaOfServices.Securite: 'Securite',
  AreaOfServices.Cuisine: 'Cuisine',
  AreaOfServices.EnergiRenoDiag: 'EnergiRenoDiag',
  AreaOfServices.SolCarrelage: 'SolCarrelage',
  AreaOfServices.DemolitioEvacuation: 'DemolitioEvacuation',
  AreaOfServices.Ascenseurs: 'Ascenseurs',
  AreaOfServices.TraitementNuisibles: 'TraitementNuisibles',
  AreaOfServices.Isolation: 'Isolation',
  AreaOfServices.Bricolage: 'Bricolage',
};

_TravauxEntityInit _$TravauxEntityInitFromJson(Map<String, dynamic> json) =>
    _TravauxEntityInit(
      id: TravauId.fromJson(json['id'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TravauxEntityInitToJson(_TravauxEntityInit instance) =>
    <String, dynamic>{'id': instance.id, 'runtimeType': instance.$type};
