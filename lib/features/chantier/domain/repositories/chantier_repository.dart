import '../entities/chantier.dart';

abstract class ChantierRepository {
  Future<List<Chantier>> fetchAll();
  Future<Chantier?> fetchById(String id);
}
