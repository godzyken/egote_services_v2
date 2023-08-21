import 'package:egote_services_v2/features/devis/domain/entities/construction/travau_id.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission_entity.dart';

part 'travaux_entity.freezed.dart';
part 'travaux_entity.g.dart';

@freezed
abstract class TravauxEntity with _$TravauxEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TravauxEntity({
    required TravauId id,
    required String denomination,
    required List<TypesOfWork> typesOfWorks,
    required List<AreaOfServices> areaOfServices,
    required List<MissionEntity> missionEntity,
  }) = _TravauxEntity;

  factory TravauxEntity.Init({
    required TravauId id,
  }) = _TravauxEntityInit;

  factory TravauxEntity.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityFromJson(json);
}

@JsonEnum()
enum TypesOfWork { Builds, Installations, Services, Cares, Operations }

@JsonEnum()
enum AreaOfServices {
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
