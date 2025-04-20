import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../entities/devis_model/devis_model_entity.dart';

class DevisRepository {
  final SupabaseClient client;

  DevisRepository(this.client);

  SupabaseQueryBuilder get _db => client.from('devis');

  Future<void> createDevis(Map<String, dynamic> data) async {
    final response = await _db.insert(data);
    if (response.error != null) {
      throw Exception('Failed to create devis: ${response.error!.message}');
    }
  }

  Future<List<DevisModelEntity>> fetchAllDevis() async {
    final response = await _db.select();

    if (response.isEmpty) {
      return [];
    }

    return List<Map<String, dynamic>>.from(response)
        .map((json) => DevisModelEntity.fromJson(json))
        .toList();
  }

  Future<DevisModelEntity?> fetchDevisById(String id) async {
    final response = await _db.select().eq('id', id).single();
    if (response.isEmpty) {
      return null;
    }
    return DevisModelEntity.fromJson(response);
  }

  Future<void> updateDevis(String id, Map<String, dynamic> data) async {
    final response = await _db.update(data).eq('id', id).select('*');
    if (response.isEmpty) {
      throw Exception('Erreur mise à jour devis: $response');
    }
  }

  Future<void> deleteDevis(String id) async {
    final response = await _db.delete().eq('id', id).select('*');
    if (response.isEmpty) {
      throw Exception('Erreur suppression devis: $response');
    }
  }

  Future<double?> syncPrixProduit(String sku) async {
    final response = await _db.select().eq('sku', sku).limit(1).single();
    if (response.isEmpty) {
      throw Exception('Erreur récupération prix produit: $response');
    }
    return (response['price'] as num).toDouble();
  }
}
