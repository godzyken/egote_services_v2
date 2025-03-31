import 'package:freezed_annotation/freezed_annotation.dart';

part 'produit_model_entity.freezed.dart';
part 'produit_model_entity.g.dart';

@freezed
abstract class Produit with _$Produit {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Produit({
    required String id,
    required String sku,
    required String name,
    required String manufacturer,
    required String imageUrl,
    required String url,
  }) = _Produit;

  const Produit._();

  factory Produit.empty() => const Produit(
        id: '',
        sku: '',
        name: '',
        manufacturer: '',
        imageUrl: '',
        url: '',
      );

  double? get price => 0.0;
  int? get quantity => 1;

  factory Produit.fromJson(Map<String, dynamic> json) =>
      _$ProduitFromJson(json);

  double get totalPrice => price! * quantity!;

  String get formattedPrice => _formatCurrency(price!);

  String get formattedTotalPrice => _formatCurrency(totalPrice);

  String getIndex(int index) {
    switch (index) {
      case 0:
        return id;
      case 1:
        return sku;
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
        return quantity.toString();
      case 8:
        return formattedTotalPrice;
    }
    return '';
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }
}
