import 'dart:async';

import 'package:egote_services_v2/features/devis/domain/entities/products/produit_model_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'produit_entity_states.g.dart';

@riverpod
class EditProduit extends _$EditProduit {
  @override
  AsyncValue<Produit?> build() => const AsyncValue.data(null);

  void editProduit(Produit produit) {
    state = AsyncValue.data(produit);
  }

  Future<void> saveChanges(Produit updatedProduit) async {
    if (state.value == null) return;

    state = const AsyncValue.loading();

    try {
      await Future.delayed(const Duration(seconds: 2));

      state = AsyncValue.data(updatedProduit);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void deleteProduit() {
    state = const AsyncValue.data(null);
  }
}
