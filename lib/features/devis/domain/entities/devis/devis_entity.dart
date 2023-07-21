import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/superficie_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/contact/contact_owner_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devis_entity.freezed.dart';
part 'devis_entity.g.dart';

@freezed
class DevisEntity with _$DevisEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory DevisEntity.complete({
    required int id,
    required String numDevis,
    StatusModel? statusModel,
    TypesHabitat? typesHabitat,
    SuperficieEntity? superficieEntity,
    TravauxEntity? travauxEntity,
    ContactOwnerEntity? contactOwnerEntity,
    MissionEntity? missionEntity,
  }) = _DevisEntityComplete;

  const factory DevisEntity.initialize({
    required int id,
    required String numDevis,
  }) = _DevisEntityInitialize;

  factory DevisEntity.empty() = _DevisEntityEmpty;

  factory DevisEntity.fromJson(Map<String, dynamic> json) =>
      _$DevisEntityFromJson(json);
}

@JsonEnum()
enum StatusModel { locataire, proprietaire }

@JsonEnum()
enum TypesHabitat { apartment, house }
