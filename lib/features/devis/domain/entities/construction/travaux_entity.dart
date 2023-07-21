import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission_entity.dart';

part 'travaux_entity.freezed.dart';
part 'travaux_entity.g.dart';

@freezed
abstract class TravauxEntity with _$TravauxEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TravauxEntity({
    required int id,
    required String denomination,
    MissionEntity? missionEntity,
  }) = _TravauxEntity;

  factory TravauxEntity.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityFromJson(json);
}

@JsonEnum()
enum TypesOfTravaux {
  FenetrePorte,
  CouvertureToiture,
  Peinture,
  Plomberie,
  Ebenisterie,
  Electricite,
  ConstructionRenovation,
  JardinExterieur,
  Climatisation,
  Platre,
  Chauffage,
  SdeSanitaires,
  Nettoyage,
  Securite,
  Cuisine,
  EnergiRenoDiag,
  SolCarrelage,
  DemolitioEvacuation,
  Ascenseurs,
  TraitementNuisibles,
  Isolation,
  Bricolage
}