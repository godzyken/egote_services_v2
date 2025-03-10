import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/services/search_produit_service.dart';

import '../entities/devis_model/devi_id.dart';
import 'check_out_service.dart';

class ConcreteCheckoutService implements CheckoutService {
  final SearchProduitService service;
  ConcreteCheckoutService(this.service);

  @override
  Future<void> delete(String id) {
    return service.deleteProduit(id);
  }

  @override
  Future<List<DevisModelEntity>> get getAll => throw UnimplementedError();

  @override
  Future<DevisModelEntity> update(String id) async {
    final oldDeviId = DevisId(id: int.parse(id));
    final oldDevis = DevisModelEntity.initialize(
        id: oldDeviId, createdAt: DateTime.timestamp());

    return oldDevis.when(
        approved: (id,
                createdAt,
                validity,
                client,
                pro,
                travauxEntity,
                produits,
                quantity,
                unitPrice,
                vatRates,
                amountHt,
                amountTtc,
                approval) async =>
            DevisModelEntity.approved(
                id: id,
                createdAt: createdAt,
                validity: validity,
                client: client,
                pro: pro,
                travauxEntity: travauxEntity,
                produits: await service.fetchProduits(),
                quantity: quantity,
                unitPrice: unitPrice,
                vatRates: vatRates,
                amountHt: amountHt,
                amountTtc: amountTtc,
                approval: approval),
        initialize: (id, createdAt) =>
            DevisModelEntity.initialize(id: id, createdAt: createdAt),
        empty: () => DevisModelEntity.empty());
  }
}
