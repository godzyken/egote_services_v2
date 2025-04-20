import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/contact/contact_owner_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/produit_devis/produit_devis.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/converter/extention_valueof_converters.dart';

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
    @ProduitEntityConverter() required List<ProduitDevis> produitsDevis,
    @QuantityValueConverter() required int quantity,
    @PriceValueConverter() @Default(0.0) double unitPrice,
    @VatRateValueConverter() required double vatRates,
    @PriceValueConverter() required double amountHt,
    @PriceValueConverter() required double amountTtc,
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

  /// Montant HT (non sérialisé)
  @JsonKey(includeToJson: true, includeFromJson: true, includeIfNull: false)
  double get amountHt => when(
        edit: (id,
            createdAt,
            validity,
            client,
            pro,
            travauxEntity,
            produitsDevis,
            quantity,
            unitPrice,
            vatRates,
            amountHt,
            amountTtc,
            approval) {
          return produitsDevis.fold(
            0,
            (sum, p) => sum + p.produit.totalPrice,
          );
        },
        initialize: (_, __) => 0,
        empty: () => 0,
      );

  /// Montant TTC (non sérialisé)
  @JsonKey(includeToJson: true, includeFromJson: true, includeIfNull: false)
  double get amountTtc => when(
        edit: (
          id,
          createdAt,
          validity,
          client,
          pro,
          travauxEntity,
          produitsDevis,
          quantity,
          unitPrice,
          vatRates,
          amountHt,
          amountTtc,
          approval,
        ) {
          return amountHt * (1 + (vatRates / 100));
        },
        initialize: (_, __) => 0,
        empty: () => 0,
      );

  /// Méthode pratique pour ajouter un produit
  DevisModelEntity ajouterProduit(ProduitDevis produitDevis) {
    if (this is _DevisModelEntityEdit) {
      final current = this as _DevisModelEntityEdit;
      return current.copyWith(
        produitsDevis: [...current.produitsDevis, produitDevis],
      );
    }
    return this;
  }
}

extension DevisModelX on DevisModelEntity {
  /// Méthode pratique pour supprimer un produit
  List<ProduitDevis> get produitsDevisSafe => maybeMap(
        edit: (d) => d.produitsDevis,
        orElse: () => [],
      );
}

/// La durée de validité du devis fait partie des mentions obligatoires,
/// c’est donc vous qui décidez de la durée de validité de votre offre.
/// La jurisprudence admet cependant qu’en l’absence de cette mention,
/// la durée de validité d’un devis est de [3 mois].
