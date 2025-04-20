import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../products/produit_model_entity.dart';
import '../value_objects/converter/extention_valueof_converters.dart';
import '../value_objects/quantity_value.dart';

part 'produit_devis.freezed.dart';
part 'produit_devis.g.dart';

@freezed
abstract class ProduitDevis with _$ProduitDevis {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProduitDevis({
    required Produit produit,
    @QuantityValueConverter()
    @Default(QuantityValue.zero)
    QuantityValue quantity,
    @Default(0.0) double? remise, // en pourcentage : ex. 10 = -10%
  }) = _ProduitDevis;

  const ProduitDevis._();

  double get totalHt {
    final base = produit.price.value * quantity.quantity;
    final discount = base * (1 - remise! / 100);
    return discount.clamp(0.0, double.infinity);
  }

  String get formattedTotalHt => _formatCurrency(totalHt);

  double get totalHTBrut => produit.price.value * quantity.quantity;

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  ProduitDevis updateQuantity(int newQuantity) {
    return copyWith(quantity: QuantityValue(newQuantity));
  }

  factory ProduitDevis.fromJson(Map<String, dynamic> json) =>
      _$ProduitDevisFromJson(json);
}

extension ProduitDevisX on ProduitDevis {
  double get prixUnitaireAvecRemise {
    final base = produit.price.value ?? 0;
    final discount = (remise ?? 0) / 100;
    return base * (1 - discount);
  }

  double get totalHT => prixUnitaireAvecRemise * quantity.quantity;
}
