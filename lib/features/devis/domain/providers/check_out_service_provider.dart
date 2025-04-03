import 'package:egote_services_v2/features/devis/domain/providers/devis_providers.dart';
import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';
import 'package:egote_services_v2/features/devis/domain/services/search_produit_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/products/produit_model_entity.dart';

part 'check_out_service_provider.g.dart';

@riverpod
CheckoutService checkoutService(Ref ref) {
  final productService = ref.watch(produitServiceProvider);

  return productService.produitService.when(
    data: (produits) {
      final service = SearchProduitService.withProduitService(
          produitService: AsyncValue.data(produits));

      return CheckoutService.fromSearchProduitService(service);
    },
    error: (error, stackTrace) =>
        throw Exception('Erreur lors du chargement du CheckoutService :'),
    loading: () => throw Exception('Le produitService is loading...'),
  );
}

final searchProduitServiceProvider =
    Provider.family<SearchProduitService, AsyncValue<List<Produit>>>(
        (ref, prouitService) => ref.watch(produitServiceProvider));
