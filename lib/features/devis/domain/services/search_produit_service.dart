import 'dart:developer' as developer;
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:egote_services_v2/config/environements/environment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/providers/connectivity/dio_providers.dart';
import '../../../../config/providers/localizations/localizations_provider.dart';
import '../entities/products/produit_model_entity.dart';

part 'search_produit_service.g.dart';

@riverpod
class SearchProduitService extends _$SearchProduitService {
  late final Dio _dio;
  Environment? env;
  String? baseUrl;

  Locale? lang;

  SearchProduitService() : produitService = AsyncValue.loading();
  SearchProduitService.withProduitService({required this.produitService}) {
    _dio.clone(
      options: BaseOptions(
        baseUrl: baseUrl!,
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
      ),
    );
  }

  late final AsyncValue<List<Produit>> produitService;

  AsyncValue<List<Produit>> get getAll => produitService;

  @override
  Future<List<Produit>> build() async {
    baseUrl = env!.materialBankBaseUrl;
    _dio = ref.read(dioProvider);
    return fetchProduits();
  }

  Future<List<Produit>> fetchProduits([String filter = '']) async {
    produitService = const AsyncValue.loading();
    final lang = ref.read(localizationProvider);

    try {
      // Optimisation en parallélisant les tâches réseaux
      final responses = await Future.wait([
        _fetchProduits(filter, lang),
      ]);

      // Mise à jour de l'état avec la réponse
      produitService = AsyncValue.data(responses[0]);
    } catch (e) {
      // Gestion centralisée des erreurs
      handleDioError(e);
    }

    return produitService.value ?? [];
  }

  // Appel réseau optimisé pour les produits
  Future<List<Produit>> _fetchProduits(String filter, Locale lang) async {
    try {
      final response = await _dio
          .get<List<Produit>>('$baseUrl!/v2/suggest', queryParameters: {
        'siteId': 'materialbank-eu_product',
        'lang': lang.countryCode,
        'context': 'Tous',
        if (filter.isNotEmpty) 'q': filter,
      });

      if (response.statusCode == 200) {
        developer.log('Resultat de la requetes : ${response.data.toString()}');
        return response.data ?? [];
      } else {
        throw Exception('Failed to fetch produits filters');
      }
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      rethrow; // Relancer l'exception pour la gestion centrale
    }
  }

  Future<Produit> fetchProduit(String id) async {
    try {
      final response = await _dio.get('/produit/$id');
      if (response.statusCode == 200) {
        return Produit.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch produit id');
      }
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      throw Exception('Failed to fetch produit id: ${e.message}');
    }
  }

  Future<Produit> updateProduit(
      String id, Map<String, dynamic> produitData) async {
    try {
      final response = await _dio.get('/produit/$id', data: produitData);
      return Produit.fromJson(response.data);
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      throw Exception('Failed to update produit: ${e.message}');
    }
  }

  Future<void> deleteProduit(String id) async {
    try {
      await _dio.delete('/produit/$id');
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      throw Exception('Failed to delete produit id: ${e.message}');
    }
  }

  // Fonction centralisée de gestion des erreurs Dio
  void handleDioError(Object e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else {
        throw Exception(
            'Failed to fetch produits on dio service: ${e.message}');
      }
    } else {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
