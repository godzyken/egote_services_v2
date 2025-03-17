import 'dart:developer' as developer;

import 'package:dio/dio.dart';
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

import '../../../../config/providers/connectivity/dio_providers.dart';
import '../../../../config/providers/localizations/localizations_provider.dart';
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
  List<Produit> build() => [];

  void addProduit(Produit produit) {
    state = [...state, produit];
  }

  void deleteProduit(String name) {
    state = state.where((produit) => produit.name != name).toList();
  }

  void clearProduits() {
    state = [];
  }
}

@riverpod
Future<Produit> produitDetails(Ref ref, String id) {
  return ref.watch(produitServiceProvider).fetchProduit(id);
}

class ProduitStateNotifier extends StateNotifier<SearchProduitService> {
  ProduitStateNotifier() : super(SearchProduitService()) {
    init(ref!);
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
    final service = ref!.read(produitServiceProvider);
    return await service.updateProduit(id, productData);
  }

  Future<void> deleteProduit(String id) async {
    final service = ref!.read(produitServiceProvider);
    return await service.deleteProduit(id);
  }

  void init(Ref ref) {
    this.ref = ref;
    state = SearchProduitService();
    _fetch();
  }

  @override
  void dispose() {
    ref = null;
    super.dispose();
  }
}

final produitStateNotifierProvider =
    StateNotifierProvider<ProduitStateNotifier, SearchProduitService>(
        (ref) => ProduitStateNotifier());

// URL de l'API (remplacez par votre API réelle)
//const String apiUrl = "https://api.materialsproject.org/";
const String apiUrl = "https://search.materialbank.eu";

final produitFutureProvider = FutureProvider<List<Produit>>((ref) async {
  final lang = ref.read(localizationProvider);

  final dio = ref.read(dioProvider);

  dio.clone(
      options: BaseOptions(
    baseUrl: apiUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Expose-Headers': 'X-Request-Id',
      'Content-Type': 'Application/json',
      'Accept': 'Application/json, text/plain, */*',
      'authorization': 'Bearer rt27f99sq5gsv3chlraqa7ifgiheo1n2059v',
    },
    responseType: ResponseType.json,
    validateStatus: (status) =>
        status! >= 200 && status <= 299 || status == 403,
    receiveDataWhenStatusError: true,
  ));

  try {
    final response = await dio.get('$apiUrl/v2/suggest',
        queryParameters: {
          'siteId': 'materialbank-eu_product',
          'lang': '${lang.languageCode}-EU',
          'context': 'Tous',
          'q': 'douche',
        },
        options: Options(headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Expose-Headers': 'X-Request-Id',
          'Content-Type': 'Application/json',
          'Accept': 'application/json',
          'authorization': 'Bearer rt27f99sq5gsv3chlraqa7ifgiheo1n2059v',
        }));

    if (response.statusCode == 200 &&
        response.data != null &&
        response.data['items'] is List) {
      final items = response.data!['items'];
      developer.log('WWWWWWWWWDDDD: ${items.toString()}');

      if (items.isNotEmpty) {
        for (var item in items) {
          if (item is Map<String, dynamic> && item.containsKey('id')) {
            int id = item['id'];
            String sku = item['sku'];
            String name = item['name'];
            String manufacturer = item['manufacturer'];
            String imageUrl = item['imageUrl'];
            String url = item['url'];

            // Afficher les informations de chaque produit
            developer.log('ID: $id');
            developer.log('SKU: $sku');
            developer.log('Nom: $name');
            developer.log('Fabricant: $manufacturer');
            developer.log('URL de l\'image: $imageUrl');
            developer.log('URL produit: $url');
          } else {
            throw Exception('Échec de la récupération des produits !!');
          }
        }
        return await items
            .map((json) => Produit.fromJson(json as Map<String, Object?>))
            .toList();
      } else {
        throw Exception('Échec aucun produits Trouvé');
      }
    } else {
      throw Exception(
          'Erreur de communication API code reponse: ${response.statusCode}:::: ${response.statusMessage} !!');
    }
    /*  final service = ref.watch(produitServiceProvider);
    return await service.build();*/
  } on DioException catch (e, stackTrace) {
    throw Exception('DioException code::::: $e,:::: Message:::: $stackTrace');
  }
});
