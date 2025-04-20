import 'package:egote_services_v2/features/devis/domain/entities/produit_devis/produit_devis.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProduitEntityConverter
    implements JsonConverter<ProduitDevis, Map<String, dynamic>> {
  const ProduitEntityConverter();

  @override
  ProduitDevis fromJson(Map<String, dynamic> json) {
    return ProduitDevis.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ProduitDevis object) {
    return object.toJson();
  }
}
