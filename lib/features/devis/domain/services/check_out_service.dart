import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/services/search_produit_service.dart';

import 'concrete_check_out_service.dart';

abstract class CheckoutService {
  // this will succeed or throw an error
  Future<DevisModelEntity> update(String id);

  Future<void> delete(String id);

  Future<List<DevisModelEntity>> get getAll;

  factory CheckoutService.fromSearchProduitService(
      SearchProduitService productService) {
    return ConcreteCheckoutService(productService);
  }
}
