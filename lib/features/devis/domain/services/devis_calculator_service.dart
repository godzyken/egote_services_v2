import 'package:egote_services_v2/features/devis/domain/entities/produit_devis/produit_devis.dart';
import 'package:egote_services_v2/features/devis/domain/entities/value_objects/price_value.dart';

import '../entities/devis_model/devis_model_entity.dart';

class DevisCalculatorService {
  /// Calcule le montant HT
  double calculerMontantHt(List<ProduitDevis> produitsDevis) {
    return produitsDevis.fold(0.0, (sum, p) => sum + (p.totalHT));
  }

  /// Calcule le montant TTC
  double calculerMontantTtc(List<ProduitDevis> produitsDevis, double vatRates) {
    final ht = calculerMontantHt(produitsDevis);
    return ht * (1 + (vatRates / 100));
  }

  /// Calcule la quantité totale
  int calculerQuantiteTotale(List<ProduitDevis> produitsDevis) {
    return produitsDevis.fold(0, (sum, p) => sum + p.quantity.quantity);
  }

  /// Retourne un nouveau `DevisModelEntity` mis à jour après ajout produit
  DevisModelEntity ajouterProduitEtRecalculer({
    required DevisModelEntity devis,
    required ProduitDevis produitDevis,
  }) {
    return devis.maybeMap(
      edit: (d) {
        final updatedProduits = [...d.produitsDevis, produitDevis];
        return _recalculerDevis(devis, updatedProduits);
      },
      orElse: () => devis,
    );
  }

  DevisModelEntity supprimerProduitEtRecalculer({
    required DevisModelEntity devis,
    required String produitId,
  }) {
    return devis.maybeMap(
      edit: (d) {
        final produits =
            d.produitsDevis.where((p) => p.produit.id != produitId).toList();

        return _recalculerDevis(devis, produits);
      },
      orElse: () => devis,
    );
  }

  Future<DevisModelEntity> syncPrixProduitsEtRecalculer({
    required DevisModelEntity devis,
    required Future<double?> Function(String sku) fetchPrice,
  }) {
    return devis.maybeMap(
      edit: (d) async {
        final updatedProduits =
            await Future.wait(d.produitsDevis.map((p) async {
          final newPrice = await fetchPrice(p.produit.sku.value);
          if (newPrice == null) return p;
          final updatedProduit =
              p.produit.copyWith(price: PriceValue(newPrice));
          return p.copyWith(produit: updatedProduit);
        }));

        return _recalculerDevis(d, updatedProduits);
      },
      orElse: () async => devis,
    );
  }

  DevisModelEntity _recalculerDevis(
      DevisModelEntity devis, List<ProduitDevis> produitsDevisMaj) {
    return devis.maybeMap(
      edit: (d) {
        final updatedQuantity = calculerQuantiteTotale(produitsDevisMaj);
        final updatedHt = calculerMontantHt(produitsDevisMaj);
        final updatedTtc = calculerMontantTtc(produitsDevisMaj, d.vatRates);
        return d.copyWith(
          quantity: updatedQuantity,
          amountHt: updatedHt,
          amountTtc: updatedTtc,
          produitsDevis: produitsDevisMaj,
        );
      },
      orElse: () => devis,
    );
  }
}
