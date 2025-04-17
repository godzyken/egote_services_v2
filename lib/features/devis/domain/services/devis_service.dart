import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../entities/contact/contact_owner_entity.dart';

class DevisService {
  final Map<String, DevisModelEntity> _devisStorage = {};

  // Crée un nouveau devis avec un produit initial
  DevisModelEntity createNewDevis({required Produit produit}) {
    final newDevis = DevisModelEntity.edit(
      id: DevisId(value: Uuid().v4()),
      createdAt: DateTime.now(),
      validity: DateTime.now().add(const Duration(days: 90)),
      client: ContactOwnerEntity.empty(),
      pro: ContactOwnerEntity.empty(),
      travauxEntity: [],
      produits: [produit],
      quantity: produit.quantity ?? 1,
      unitPrice: produit.price?.toInt() ?? 0,
      vatRates: 20,
      amountHt: (produit.price ?? 0) * (produit.quantity ?? 1),
      amountTtc: ((produit.price ?? 0) * (produit.quantity ?? 1)) * 1.2,
      approval: false,
    );

    _devisStorage[newDevis.maybeMap(
      edit: (e) => e.id.value,
      orElse: () => DevisId(value: Uuid().v4()).value,
    )] = newDevis;
    return newDevis;
  }

  // Ajoute un produit à un devis existant et met à jour les totaux
  DevisModelEntity addProduitToDevis({
    required DevisModelEntity devis,
    required Produit produit,
  }) {
    final updatedProduits = [...devis, produit];

    final amountHt = updatedProduits.fold<double>(
      0.0,
      (sum, p) => sum + (p.price ?? 0) * (p.quantity ?? 1),
    );

    final amountTtc = amountHt * 1.2;

    final updatedDevis = devis.copyWith(
      produits: updatedProduits,
      amountHt: amountHt,
      amountTtc: amountTtc,
    );

    _devisStorage[devis.id.value] = updatedDevis;
    return updatedDevis;
  }

  Future<void> saveDevis(DevisModelEntity devis) async {
    // Tu pourrais appeler une API ici
    print("Saving devis: ${devis.id.value}");
    await Future.delayed(const Duration(seconds: 1));
    _devisStorage[devis.id.value] = devis;
  }

  DevisModelEntity? getDevisById(String id) => _devisStorage[id];
}

final devisServiceProvider = Provider<DevisService>((ref) => DevisService());

class DevisServiceNotifier extends ChangeNotifier {
  DevisModelEntity? _devis;
  DevisModelEntity? get devis => _devis;

  void initialize(ContactOwnerEntity client, ContactOwnerEntity pro) {
    final now = DateTime.now();
    _devis = DevisModelEntity.edit(
      id: DevisId(value: const Uuid().v4()),
      createdAt: now,
      validity: now.add(Duration(days: 90)),
      client: client,
      pro: pro,
      produits: [],
      travauxEntity: [],
      quantity: 0,
      unitPrice: 0,
      vatRates: 20,
      amountHt: 0,
      amountTtc: 0,
      approval: false,
    );
    notifyListeners();
  }

  void addProduit(Produit produit) {
    if (_devis == null) return;
    final d = _devis as _DevisModelEntityEdit;

    final produits = [...d.produits, produit];
    final quantity = produits.fold<int>(0, (sum, p) => sum + (p.quantity ?? 1));
    final ht = produits.fold<double>(0, (sum, p) => sum + (p.totalPrice));
    final ttc = ht + (ht * (d.vatRates / 100));

    _devis = d.copyWith(
      produits: produits,
      quantity: quantity,
      amountHt: ht,
      amountTtc: ttc,
    );
    notifyListeners();
  }

  void reset() {
    _devis = null;
    notifyListeners();
  }
}
