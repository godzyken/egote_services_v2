import 'package:freezed_annotation/freezed_annotation.dart';

part 'produit_model_entity.freezed.dart';
part 'produit_model_entity.g.dart';

@freezed
abstract class Produit with _$Produit {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Produit({
    required String sku,
    required String produitName,
    required double price,
    required String imageUrl,
    required String description,
    required String category,
    required String brand,
    required String size,
    required String color,
    required String material,
    required int quantity,
  }) = _Produit;

  const Produit._();

  double get totalPrice => price * quantity;

  String getIndex(int index) {
    switch (index) {
      case 0:
        return sku;
      case 1:
        return produitName;
      case 2:
        return _formatCurrency(price);
      case 3:
        return imageUrl;
      case 4:
        return description;
      case 5:
        return category;
      case 6:
        return brand;
      case 7:
        return size;
      case 8:
        return color;
      case 9:
        return material;
      case 10:
        return quantity.toString();
      case 11:
        return _formatCurrency(totalPrice);
    }
    return '';
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  factory Produit.fromJson(Map<String, dynamic> json) =>
      _$ProduitFromJson(json);
}
