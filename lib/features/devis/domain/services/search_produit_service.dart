import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/products/produit_model_entity.dart';

part 'search_produit_service.g.dart';

@riverpod
class SearchProduitService extends _$SearchProduitService {
  late final Dio _dio;

  SearchProduitService() : produitService = AsyncValue.loading() {
    _dio = Dio(
      BaseOptions(
        baseUrl:
            'https://www.materialbank.eu/rest/V1/sdg-project/projectphase/search?searchCriteria[currentPage]=1',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
  }
  SearchProduitService.withProduitService({required this.produitService}) {
    _dio = Dio(
      BaseOptions(
        baseUrl:
            'https://www.materialbank.eu/rest/V1/sdg-project/projectphase/search?searchCriteria[currentPage]=1',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
  }

  late final AsyncValue<List<Produit>> produitService;

  AsyncValue<List<Produit>> get getAll => produitService;

  @override
  Future<List<Produit>> build() async {
    return fetchProduits();
  }

  Future<List<Produit>> fetchProduits([String filter = '']) async {
    await Future.delayed(const Duration(seconds: 2));
    produitService = const AsyncValue.loading();

    try {
      final response = await _dio.get('/produits', queryParameters: {
        if (filter.isNotEmpty) 'ProductName': filter,
      });

      if (response.statusCode == 200) {
        produitService = AsyncValue.data(response.data((response.data as List)
            .map((json) => Produit.fromJson(json))
            .toList()));
      } else {
        throw Exception('Failed to fetch produits');
      }
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else {
        throw Exception('Failed to fetch produits: ${e.message}');
      }
    }
    return produitService.value ?? [];
  }

  Future<Produit> fetchProduit(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await _dio.get('/produit/$id');
      if (response.statusCode == 200) {
        return Produit.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch produit');
      }
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else {
        throw Exception('Failed to fetch produits: ${e.message}');
      }
    }
  }

  Future<Produit> updateProduit(
      String id, Map<String, dynamic> produitData) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await _dio.put('/produit/$id', data: produitData);
      return Produit.fromJson(response.data);
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      throw Exception('Failed to update produit: ${e.message}');
    }
  }

  Future<void> deleteProduit(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      await _dio.delete('/produit/$id');
    } on DioException catch (e, st) {
      developer.log(e.toString(), stackTrace: st);
      throw Exception('Failed to delete produit: ${e.message}');
    }
  }
}
