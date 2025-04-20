import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/value_objects_extensions.dart';

part 'produit_model_entity.freezed.dart';
part 'produit_model_entity.g.dart';

@freezed
class Produit with _$Produit {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Produit({
    required String id,
    @SKUValueConverter() required SKUValue sku,
    required String name,
    required String manufacturer,
    required String imageUrl,
    required String url,
    @PriceValueConverter() @Default(PriceValue.zero) PriceValue price,
    @QuantityValueConverter()
    @Default(QuantityValue.zero)
    QuantityValue quantity,
  }) = _Produit;

  const Produit._();

  /// Total HT du produit (prix unitaire × quantité)
  double get totalPrice =>
      (price.value * quantity.quantity).clamp(0.0, double.infinity);

  /// Formaté en string (USD par défaut ici)
  String get formattedPrice => _formatCurrency(price.value);
  String get formattedTotalPrice => _formatCurrency(totalPrice);

  /// Retourne une des valeurs du produit selon un index donné
  String getIndex(int index) {
    switch (index) {
      case 0:
        return id;
      case 1:
        return sku.value;
      case 2:
        return name;
      case 3:
        return manufacturer;
      case 4:
        return imageUrl;
      case 5:
        return url;
      case 6:
        return formattedPrice;
      case 7:
        return quantity.quantity.toString();
      case 8:
        return formattedTotalPrice;
      default:
        return '';
    }
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  /// Renvoie une copie du produit avec une nouvelle quantité
  Produit updateQuantity(int newQuantity) {
    return copyWith(
        quantity: QuantityValue(newQuantity.clamp(0, 100))); // Ex: borné
  }

  Produit applyDiscount(double discount) {
    return copyWith(price: PriceValue(price.value * (1 - discount)));
  }

  Produit withSku(String newSku) {
    return copyWith(sku: SKUValue(newSku));
  }

  factory Produit.fromJson(Map<String, dynamic> json) =>
      _$ProduitFromJson(json);
}
