import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity_converter.dart';
import 'package:egote_services_v2/features/devis/domain/entities/contact/contact_owner_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../products/proudui_entity_converter.dart';
import 'devis_id_converter.dart';

part 'devis_model_entity.freezed.dart';
part 'devis_model_entity.g.dart';

@freezed
sealed class DevisModelEntity with _$DevisModelEntity {
  DevisModelEntity._();

  @FreezedUnionValue("edit")
  factory DevisModelEntity.edit({
    @DevisIdConverter() required DevisId id,
    required DateTime createdAt,
    required DateTime validity,
    required ContactOwnerEntity client,
    required ContactOwnerEntity pro,
    @TravauxEntityConverter() required List<TravauxEntity> travauxEntity,
    @ProduitEntityConverter() required List<Produit> produits,
    required int quantity,
    required int unitPrice,
    required double vatRates,
    required double amountHt,
    required double amountTtc,
    required bool approval,
  }) = _DevisModelEntityEdit;

  @FreezedUnionValue("initialize")
  factory DevisModelEntity.initialize({
    @DevisIdConverter() required DevisId id,
    required DateTime createdAt,
  }) = _DevisModelEntityInitialize;

  factory DevisModelEntity.empty() = _DevisModelEntityEmpty;
  factory DevisModelEntity.fromJson(Map<String, dynamic> json) =>
      _$DevisModelEntityFromJson(json);
}

/// La durée de validité du devis fait partie des mentions obligatoires,
/// c’est donc vous qui décidez de la durée de validité de votre offre.
/// La jurisprudence admet cependant qu’en l’absence de cette mention,
/// la durée de validité d’un devis est de [3 mois].
