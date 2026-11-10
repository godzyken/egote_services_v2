import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/graph_edge.dart';
import '../domain/entities/graph_node.dart';
import '../domain/entities/trial.dart';
import '../domain/value_objects/edge_type.dart';
import '../domain/value_objects/provenance.dart';
import '../infrastructure/supabase_graph_repository.dart';

/// Service applicatif qui expose les opérations du Knowledge Graph.
/// À brancher via Riverpod.
class GraphService {
  GraphService(this._repo);

  final SupabaseGraphRepository _repo;

  Future<void> recordNode(GraphNode node) => _repo.insertNode(node);

  Future<void> recordEdge(GraphEdge edge) => _repo.insertEdge(edge);

  Future<void> recordTrial(Trial trial) => _repo.insertTrial(trial);

  Future<List<GraphNode>> children(String nodeId) => _repo.children(nodeId);

  Future<List<GraphNode>> lineage(String nodeId, {int maxDepth = 20}) =>
      _repo.lineage(nodeId, maxDepth: maxDepth);

  Future<List<GraphNode>> leaves({int limit = 50}) =>
      _repo.leaves(limit: limit);

  Future<({List<GraphNode> nodes, List<GraphEdge> edges})> subgraph(
    String nodeId, {
    int depth = 2,
  }) => _repo.subgraph(nodeId, depth: depth);

  /// Helper métier : enregistre explicitement le pont Devis → Chantier
  Future<void> recordDevisToChantier({
    required String devisId,
    required String chantierId,
    Map<String, dynamic>? meta,
  }) async {
    // On suppose que les nœuds devis et chantier existent déjà
    // (ou on les crée à la volée si besoin)
    final edge = GraphEdge.create(
      sourceId: devisId,
      targetId: chantierId,
      type: EdgeType.triggers,
      meta: {'bridge': 'emap_services → egote_services', ...?meta},
      provenance: const Provenance(source: 'supabase_trigger'),
    );
    await _repo.insertEdge(edge);
  }
}

// ---------------------------------------------------------------------------
// Providers Riverpod (à adapter selon ton style Notifier / manual)
// ---------------------------------------------------------------------------

final graphRepositoryProvider = Provider<SupabaseGraphRepository>((ref) {
  return SupabaseGraphRepository();
});

final graphServiceProvider = Provider<GraphService>((ref) {
  final repo = ref.watch(graphRepositoryProvider);
  return GraphService(repo);
});
