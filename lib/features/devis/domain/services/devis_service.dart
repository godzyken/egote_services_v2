import 'dart:convert';
import 'dart:io';

import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/produit_devis/produit_devis.dart';
import 'package:egote_services_v2/features/devis/domain/entities/value_objects/price_value.dart';
import 'package:egote_services_v2/features/devis/domain/repository/devis_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/providers/documents/devis_repo_provider.dart';
import '../../../../config/providers/supabase/supabase_providers.dart';
import '../entities/contact/contact_owner_entity.dart';
import '../providers/devis_calculator_provider.dart';

class DevisService {
  final Ref ref;

  DevisService(this.ref);

  DevisRepository get _repo => ref.read(devisRepoProvider);

  Future<void> createDevis(DevisModelEntity devis) async {
    final data = devis.maybeMap(
        edit: (d) => {
              'id': d.id.value,
              'created_at': d.createdAt.toIso8601String(),
              'validity': d.validity.toIso8601String(),
              'client': d.client.toJson(),
              'pro': d.pro.toJson(),
              'travaux': d.travauxEntity.map((e) => e.toJson()).toList(),
              'produits': d.produitsDevis.map((e) => e.toJson()).toList(),
              'quantity': d.quantity,
              'unit_price': d.unitPrice,
              'vat_rates': d.vatRates,
              'amount_ht': d.amountHt,
              'amount_ttc': d.amountTtc,
              'approval': d.approval,
            },
        orElse: () => throw Exception('Devis invalide'));

    await _repo.createDevis(data);
  }

  /// Récupère tous les devis
  Future<List<DevisModelEntity>> fetchAllDevis() => _repo.fetchAllDevis();

  /// Récupère un devis par ID
  Future<DevisModelEntity?> fetchDevisById(String id) =>
      _repo.fetchDevisById(id);

  /// Met à jour un devis
  Future<void> updateDevis(DevisModelEntity devis) async {
    final updated = devis.maybeMap(
        edit: (value) => value,
        orElse: () => throw Exception('Devis invalide'));

    final response = {
      'validity': updated.validity.toIso8601String(),
      'client': updated.client.toJson(),
      'pro': updated.pro.toJson(),
      'travaux': updated.travauxEntity.map((e) => e.toJson()).toList(),
      'produits': updated.produitsDevis.map((e) => e.toJson()).toList(),
      'quantity': updated.quantity,
      'unit_price': updated.unitPrice,
      'vat_rates': updated.vatRates,
      'amount_ht': updated.amountHt,
      'amount_ttc': updated.amountTtc,
      'approval': updated.approval,
    };
    await _repo.updateDevis(updated.id.value, response);
  }

  Future<double?> fetchPriceForProductFromSupabase(String sku) {
    return _repo.syncPrixProduit(sku);
  }

  /// Supprime un devis
  Future<void> deleteDevis(String id) async {
    await _repo.deleteDevis(id);
  }
}

final devisServiceProvider = Provider<DevisService>((ref) {
  return DevisService(ref);
});

class DevisServiceNotifier extends ChangeNotifier {
  final Ref ref;
  DevisServiceNotifier(this.ref);

  DevisModelEntity? _devis;
  DevisModelEntity? get devis => _devis;

  TransactionLoggerService? _transactionLoggerService;

  @visibleForTesting
  set devis(DevisModelEntity? devis) {
    _devis = devis;
    notifyListeners();
  }

  @visibleForTesting
  set transactionLoggerService(TransactionLoggerService logger) {
    _transactionLoggerService = logger;
    notifyListeners();
  }

  DevisServiceNotifier.withDevis(this.ref, this._devis) {
    _transactionLoggerService = TransactionLoggerService(ref);
  }
  DevisServiceNotifier.withoutDevis(this.ref) {
    _transactionLoggerService = TransactionLoggerService(ref);
  }

  void initialize(ContactOwnerEntity client, ContactOwnerEntity pro) {
    final now = DateTime.now();
    _devis = DevisModelEntity.edit(
      id: DevisId(value: const Uuid().v4()),
      createdAt: now,
      validity: now.add(Duration(days: 90)),
      client: client,
      pro: pro,
      produitsDevis: [],
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

  void addProduit(ProduitDevis produit) {
    if (_devis == null) return;

    final calculator = ref.read(devisCalculatorProdider);
    _devis = calculator.ajouterProduitEtRecalculer(
      devis: _devis!,
      produitDevis: produit,
    );
    notifyListeners();
  }

  void removeProduit(Produit produit) {
    if (_devis == null) return;

    _devis = _devis!.maybeMap(
      edit: (d) {
        final produits =
            d.produitsDevis.where((p) => p.produit.id != produit.id).toList();

        final quantity =
            produits.fold<int>(0, (sum, p) => sum + p.quantity.quantity);

        final ht = produits.fold<double>(0, (sum, p) => sum + p.totalHT);

        final ttc = ht * (1 + d.vatRates / 100);

        return d.copyWith(
          produitsDevis: produits,
          quantity: quantity,
          amountHt: ht,
          amountTtc: ttc,
        );
      },
      orElse: () => _devis!,
    );
    notifyListeners();
  }

  void reset() {
    _devis = null;
    notifyListeners();
  }

  Future<void> syncPrixProduits(
      Future<double?> Function(String sku) fetchPrice) async {
    if (_devis == null) return;

    final List<ProduitDevis>? oldProduits = _devis!.maybeMap(
      edit: (d) => d.produitsDevis.toList(),
      orElse: () => throw Exception('Devis invalide'),
    );

    // 1. Mise à jour des prix dans les ProduitDevis
    final updatedProduitsDevis = await Future.wait(oldProduits!.map((p) async {
      final newPrice = await fetchPrice(p.produit.sku.value);
      if (newPrice == null) return p;
      final updatedProduit = p.produit.copyWith(price: PriceValue(newPrice));
      return p.copyWith(produit: updatedProduit);
    }));

    // 2. Recalcul des totaux
    _recalculerTotauxEtNotifier(updatedProduitsDevis);

    // 4. Logging
    final now = DateTime.now().toIso8601String();
    for (int i = 0; i < updatedProduitsDevis.length; i++) {
      final oldP = oldProduits[i];
      final newP = updatedProduitsDevis[i];
      if (oldP.produit.price != newP.produit.price) {
        await _transactionLoggerService?.logTransactionToSupabase(
            newP.produit, 'price_updated', now);
        await _transactionLoggerService?.logTransactionToFile(
            newP.produit, 'price_updated', now);
      }
    }
  }

  void _recalculerTotauxEtNotifier(List<ProduitDevis> updatedProduitsDevis) {
    // 2. Recalcul des totaux
    final quantity = updatedProduitsDevis.fold<int>(
        0, (sum, p) => sum + p.quantity.quantity);
    final ht =
        updatedProduitsDevis.fold<double>(0, (sum, p) => sum + p.totalHT);

    final vat = _devis!.maybeMap(
      edit: (d) => d.vatRates,
      orElse: () => 20.0,
    );

    final ttc = ht * (1 + vat / 100);

    // 3. Mise à jour du _devis
    _devis = _devis!.maybeMap(
      edit: (d) => d.copyWith(
        produitsDevis: updatedProduitsDevis,
        quantity: quantity,
        amountHt: ht,
        amountTtc: ttc,
      ),
      orElse: () => _devis!,
    );

    notifyListeners();
  }
}

// class PriceFetcherService {
//   Future<double?> fetchPriceForProduct(String sku) async {
//     // 👉 Appel API ou scraping basique ici
//     // Ex: Appel Supabase RPC ou Firebase Function ou REST externe
//     final response = await http.get(Uri.parse('https://api.myshop.com/price/$sku'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['price']?.toDouble();
//     }
//     return null;
//   }
// }

class ProduitLoggerService {
  Future<void> logTransaction({
    required Produit produit,
    required String action,
  }) async {
    final log = _formatLog(produit, action);
    final file = await _getLogFile();
    await file.writeAsString('${jsonEncode(log)}\n', mode: FileMode.append);
  }

  Map<String, dynamic> _formatLog(Produit produit, String action) {
    return {
      "timestamp": DateTime.now().toIso8601String(),
      "action": action,
      "produit": produit.toJson(),
      "total": produit.totalPrice,
    };
  }

  Future<File> _getLogFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/produit_logs.jsonl');
  }
}

class TransactionLoggerService {
  final Ref ref;
  TransactionLoggerService(this.ref);

  Future<void> logTransaction(Produit produit, {required String action}) async {
    final now = DateTime.now().toIso8601String();

    final json = {
      "timestamp": now,
      "action": action,
      "produit": produit.toJson(),
      "total": produit.totalPrice,
    };

    // 👉 Exemple : push dans Supabase ou Firebase
    await ref.read(supabaseClientProvider).from('transactions').insert(json);
  }

  Future<void> logTransactionToSupabase(
      Produit produit, String action, String timestamp) async {
    final data = {
      "timestamp": timestamp,
      "action": action,
      'sku': produit.sku,
      "produit": produit.toJson(),
      "total": produit.totalPrice,
    };
    await ref.read(supabaseClientProvider).from('transactions').insert(data);
  }

  Future<void> logTransactionToFile(
      Produit produit, String action, String timestamp) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/produit_logs.jsonl');

    final json = {
      "timestamp": timestamp,
      "action": action,
      'sku': produit.sku,
      "produit": produit.toJson(),
      "total": produit.totalPrice,
    };

    await file.writeAsString('${jsonEncode(json)}\n', mode: FileMode.append);
  }
}
