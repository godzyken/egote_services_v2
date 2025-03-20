import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProduitEntityConverter
    implements JsonConverter<Produit, Map<String, dynamic>> {
  const ProduitEntityConverter();

  @override
  Produit fromJson(Map<String, dynamic> json) {
    return Produit.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Produit object) {
    return object.toJson();
  }
}
