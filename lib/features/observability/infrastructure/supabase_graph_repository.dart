import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/entities/graph_edge.dart';
import '../domain/entities/graph_node.dart';
import '../domain/entities/trial.dart';
import '../domain/value_objects/edge_type.dart';
import '../domain/value_objects/node_type.dart';

/// Repository de persistance et de traversal du Knowledge Graph.
/// Utilise les tables `graph_nodes` et `graph_edges`.
class SupabaseGraphRepository {
  SupabaseGraphRepository({SupabaseClient? client})
    : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  // ---------------------------------------------------------------------------
  // Write
  // ---------------------------------------------------------------------------

  Future<void> insertNode(GraphNode node) async {
    await _client.from('graph_nodes').insert(node.toJson());
  }

  Future<void> insertEdge(GraphEdge edge) async {
    await _client.from('graph_edges').insert(edge.toJson());
  }

  Future<void> insertTrial(Trial trial) async {
    // On stocke aussi le Trial comme nœud spécial + arête parent
    final node = GraphNode(
      id: trial.id,
      type: NodeType.trial,
      // nécessite import
      timestamp: trial.timestamp,
      payload: {
        'hypothesis': trial.hypothesis,
        'change': trial.change,
        'metric': trial.metric,
        'decision': trial.decision.name,
        'reason': trial.reason,
      },
      provenance: trial.provenance,
    );
    await insertNode(node);

    if (trial.parentId != null) {
      final edge = GraphEdge.create(
        sourceId: trial.parentId!,
        targetId: trial.id,
        type: EdgeType.parentOf,
        provenance: trial.provenance,
      );
      await insertEdge(edge);
    }
  }

  // ---------------------------------------------------------------------------
  // Read / Traversal (style AgentHub / Karpathy)
  // ---------------------------------------------------------------------------

  /// Nœuds enfants directs d’un nœud donné.
  Future<List<GraphNode>> children(String nodeId) async {
    final edges = await _client
        .from('graph_edges')
        .select('target_id')
        .eq('source_id', nodeId)
        .eq('type', EdgeType.childOf.name);

    final targetIds = (edges as List)
        .map((e) => e['target_id'] as String)
        .toList();

    if (targetIds.isEmpty) return [];

    final nodes = await _client
        .from('graph_nodes')
        .select()
        .inFilter('id', targetIds);

    return (nodes as List)
        .map((n) => GraphNode.fromJson(n as Map<String, dynamic>))
        .toList();
  }

  /// Chemin de lignée (ancêtres) jusqu’à la racine.
  Future<List<GraphNode>> lineage(String nodeId, {int maxDepth = 20}) async {
    final result = <GraphNode>[];
    var currentId = nodeId;
    var depth = 0;

    while (depth < maxDepth) {
      final edges = await _client
          .from('graph_edges')
          .select('source_id')
          .eq('target_id', currentId)
          .eq('type', EdgeType.childOf.name)
          .limit(1);

      if ((edges as List).isEmpty) break;

      final parentId = edges.first['source_id'] as String;
      final parentRows = await _client
          .from('graph_nodes')
          .select()
          .eq('id', parentId)
          .limit(1);

      if ((parentRows as List).isEmpty) break;

      final parent = GraphNode.fromJson(
        Map<String, dynamic>.from(parentRows.first as Map),
      );
      result.insert(0, parent); // plus ancien en premier
      currentId = parentId;
      depth++;
    }

    return result;
  }

  /// Feuilles : nœuds sans enfants.
  Future<List<GraphNode>> leaves({int limit = 50}) async {
    // Approche simple : nœuds qui n’apparaissent pas comme source d’une arête childOf
    // (peut être optimisée avec une vue SQL plus tard)
    final allNodes = await _client
        .from('graph_nodes')
        .select()
        .order('timestamp', ascending: false)
        .limit(limit * 3);

    final sources = await _client
        .from('graph_edges')
        .select('source_id')
        .eq('type', EdgeType.childOf.name);

    final sourceSet = (sources as List)
        .map((e) => e['source_id'] as String)
        .toSet();

    return (allNodes as List)
        .map((n) => GraphNode.fromJson(n as Map<String, dynamic>))
        .where((n) => !sourceSet.contains(n.id))
        .take(limit)
        .toList();
  }

  /// Sous-graphe autour d’un nœud (profondeur limitée).
  Future<({List<GraphNode> nodes, List<GraphEdge> edges})> subgraph(
    String nodeId, {
    int depth = 2,
  }) async {
    // Implémentation naïve BFS – à optimiser plus tard avec RPC Postgres
    final visitedNodes = <String>{nodeId};
    final collectedEdges = <GraphEdge>[];
    var frontier = {nodeId};

    for (var d = 0; d < depth; d++) {
      if (frontier.isEmpty) break;
      final nextFrontier = <String>{};

      for (final id in frontier) {
        final outEdges = await _client
            .from('graph_edges')
            .select()
            .eq('source_id', id);

        for (final e in (outEdges as List)) {
          final edge = GraphEdge.fromJson(e as Map<String, dynamic>);
          collectedEdges.add(edge);
          if (!visitedNodes.contains(edge.targetId)) {
            visitedNodes.add(edge.targetId);
            nextFrontier.add(edge.targetId);
          }
        }
      }
      frontier = nextFrontier;
    }

    final nodes = await _client
        .from('graph_nodes')
        .select()
        .inFilter('id', visitedNodes.toList());

    return (
      nodes: (nodes as List)
          .map((n) => GraphNode.fromJson(n as Map<String, dynamic>))
          .toList(),
      edges: collectedEdges,
    );
  }
}

// Note : NodeType.trial doit être importé dans insertTrial.
// Ajouter l’import manquant lors de l’intégration réelle.
