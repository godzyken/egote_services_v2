import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_entity_converter.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travau_id_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission_entity.dart';
import 'travau_id.dart';

part 'travaux_entity.freezed.dart';
part 'travaux_entity.g.dart';

@freezed
sealed class TravauxEntity with _$TravauxEntity {
  const factory TravauxEntity.definis({
    @TravauIdConverter() required TravauId id,
    required String denomination,
    required List<TypesOfWork> typesOfWorks,
    required List<AreaOfServices> areaOfServices,
    @MissionEntityConverter() required List<MissionEntity> missionEntity,
  }) = _TravauxEntityDefinis;

  const factory TravauxEntity.initialize({
    @TravauIdConverter() required TravauId id,
    @Default('') String denomination,
    @Default([]) List<TypesOfWork> typesOfWorks,
    @Default([]) List<AreaOfServices> areaOfServices,
    @Default([]) List<MissionEntity> missionEntity,
  }) = _TravauxEntityInitialize;

  factory TravauxEntity.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityFromJson(json);

  factory TravauxEntity.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TravauxEntity.definis(
      id: TravauId(value: doc.id),
      denomination: data['denomination'],
      typesOfWorks: List<TypesOfWork>.from(
          data['typesOfWorks'].map((e) => TypesOfWork.values[e])),
      areaOfServices: List<AreaOfServices>.from(
          data['areaOfServices'].map((e) => AreaOfServices.values[e])),
      missionEntity: List<MissionEntity>.from(
          data['missions'].map((e) => MissionEntity.fromJson(e))),
    );
  }
}

@JsonEnum()
enum TypesOfWork { builds, installations, services, cares, operations }

@JsonEnum()
enum AreaOfServices {
  fenetrePorte,
  couvertureToiture,
  peinture,
  plomberie,
  ebenisterie,
  electricite,
  constructionRenovation,
  jardinExterieur,
  climatisation,
  platre,
  chauffage,
  sdeSanitaires,
  nettoyage,
  securite,
  cuisine,
  energiRenoDiag,
  solCarrelage,
  demolitioEvacuation,
  ascenseurs,
  traitementNuisibles,
  isolation,
  bricolage
}
