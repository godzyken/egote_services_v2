import 'dart:developer' as developer;

import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/mission_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travau_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devi_id.dart';
import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/devis_states/devis_entity_states.dart';
import 'package:egote_services_v2/features/devis/presentation/states/entities/travaux_states/travaux_entity_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/states/entities/mission_states/mission_entity_states.dart';
import '../entities/products/produit_model_entity.dart';
import '../services/search_produit_service.dart';

part 'devis_providers.g.dart';

class DevisStateNotifier extends StateNotifier<DevisEntityStates> {
  DevisStateNotifier(Ref ref) : super(DevisEntityStates.initial());

  void addDevis(String item) {
    final devis = DevisModelEntity.initialize(
        id: DevisId(id: int.parse(item)), createdAt: DateTime.parse(item));
    state = state.copyWith(
      devis: state.devis..add(devis),
    );
    developer.log('[${state.devis}]');
  }

  void removeDevis(DevisId id) {
    final devis =
        DevisModelEntity.initialize(id: id, createdAt: DateTime.timestamp());
    state = state.copyWith(
      devis: state.devis..remove(devis),
    );
    developer.log('[${state.devis}]');
  }
}

final devisStateNotifierProvider =
    StateNotifierProvider<DevisStateNotifier, DevisEntityStates>(
        (ref) => DevisStateNotifier(ref));

class TravauxStateNotifier extends StateNotifier<TravauxEntityStates> {
  TravauxStateNotifier(Ref ref) : super(TravauxEntityStates.initial());

  void addTravaux(String item) {
    final travaux = TravauxEntity.Init(
      id: TravauId(id: int.parse(item)),
    );
    state = state.copyWith(travaux: state.travaux..add(travaux));

    developer.log('[${state.travaux}]');
  }

  void removedTravaux(TravauId id) {
    final travaux = TravauxEntity.Init(id: id);
    state = state.copyWith(travaux: state.travaux..remove(travaux));

    developer.log('[${state.travaux}]');
  }
}

final travauxStateNotifierProvider =
    StateNotifierProvider<TravauxStateNotifier, TravauxEntityStates>(
        (ref) => TravauxStateNotifier(ref));

class MissionStateNotifier extends StateNotifier<MissionEntityStates> {
  MissionStateNotifier(Ref ref) : super(MissionEntityStates.init());

  void addMission(String item) {
    final mission = MissionEntity.init(
      id: MissionId(id: int.parse(item)),
    );
    state =
        state.copyWith(missionEntities: state.missionEntities..add(mission));

    developer.log('[${state.missionEntities}]');
  }

  void removedMission(MissionId id) {
    final mission = MissionEntity.init(id: id);
    state =
        state.copyWith(missionEntities: state.missionEntities..remove(mission));

    developer.log('[${state.missionEntities}]');
  }
}

final missionStateNotifierProvider =
    StateNotifierProvider<MissionStateNotifier, MissionEntityStates>(
        (ref) => MissionStateNotifier(ref));

final _travaux = Provider<List<TravauxEntity>>(
    (ref) => ref.watch(travauxStateNotifierProvider).travaux);

final travauxListProvider =
    Provider<List<TravauxEntity>>((ref) => ref.watch(_travaux));

final _missions = Provider<List<MissionEntity>>(
    (ref) => ref.watch(missionStateNotifierProvider).missionEntities);

final missionsListProvider =
    Provider<List<MissionEntity>>((ref) => ref.watch(_missions));

final produitServiceProvider =
    Provider<SearchProduitService>((ref) => SearchProduitService());

@riverpod
class ProduitNotifier extends _$ProduitNotifier {
  @override
  FutureOr<List<Produit>> build() async {
    return _fetch();
  }

  Future<List<Produit>> _fetch([String filter = ""]) async {
    final service = ref.read(produitStateNotifierProvider.notifier);

    return service._fetch(filter);
  }

  Future<void> filterProduits(String filter) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() => _fetch(filter));
  }

  Future<void> updateProduits(
      String id, Map<String, dynamic> productData) async {
    final service = ref.read(produitStateNotifierProvider.notifier);
    await service.updateProduits(id, productData);
    ref.invalidateSelf();
  }

  Future<void> deleteProduit(String id) async {
    final service = ref.read(produitStateNotifierProvider.notifier);
    await service.deleteProduit(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Produit> produitDetails(Ref ref, String id) {
  return ref.watch(produitServiceProvider).fetchProduit(id);
}

class ProduitStateNotifier extends StateNotifier<SearchProduitService> {
  ProduitStateNotifier() : super(SearchProduitService()) {
    _fetch();
  }

  Ref? ref;

  Future<List<Produit>> _fetch([String filter = ""]) async {
    final service = ref?.read(produitServiceProvider);
    return service!.fetchProduits(filter);
  }

  Future<AsyncValue<List<Produit>>> filterProduits(String filter) async {
    return await AsyncValue.guard(() => _fetch(filter));
  }

  Future<Produit?> updateProduits(
      String id, Map<String, dynamic> productData) async {
    final service = ref?.read(produitServiceProvider);
    return await service?.updateProduit(id, productData);
  }

  Future<void> deleteProduit(String id) async {
    final service = ref?.read(produitServiceProvider);
    return await service?.deleteProduit(id);
  }
}

final produitStateNotifierProvider =
    StateNotifierProvider<ProduitStateNotifier, SearchProduitService>(
        (ref) => ProduitStateNotifier());
