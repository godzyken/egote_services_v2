import '../domain/entities/graph_edge.dart';
import '../domain/entities/graph_node.dart';
import '../domain/entities/trial.dart';

class SupabaseGraphRepository {
  final List<GraphNode> _inMemoryNodes = [];
  final List<GraphEdge> _inMemoryEdges = [];
  final List<Trial> _inMemoryTrials = [];

  Future<void> saveNode(GraphNode node) async {
    _inMemoryNodes.add(node);
  }

  Future<void> saveEdge(GraphEdge edge) async {
    _inMemoryEdges.add(edge);
  }

  Future<void> saveTrial(Trial trial) async {
    _inMemoryTrials.add(trial);
  }

  Future<void> insertNode(GraphNode node) => saveNode(node);

  Future<void> insertEdge(GraphEdge edge) => saveEdge(edge);

  Future<void> insertTrial(Trial trial) => saveTrial(trial);

  Future<List<GraphNode>> getNodes() async {
    return List.unmodifiable(_inMemoryNodes);
  }

  Future<List<GraphEdge>> getEdges() async {
    return List.unmodifiable(_inMemoryEdges);
  }

  Future<List<Trial>> getTrials() async {
    return List.unmodifiable(_inMemoryTrials);
  }

  Future<List<GraphNode>> getChildren(String nodeId) async {
    final targetIds = _inMemoryEdges
        .where((e) => e.sourceId == nodeId)
        .map((e) => e.targetId)
        .toSet();
    return _inMemoryNodes.where((n) => targetIds.contains(n.id)).toList();
  }

  Future<List<GraphNode>> children(String nodeId) => getChildren(nodeId);

  Future<List<GraphNode>> getLineage(String nodeId) async {
    final lineage = <GraphNode>[];
    String? currentId = nodeId;
    while (currentId != null) {
      final node = _inMemoryNodes.where((n) => n.id == currentId).firstOrNull;
      if (node != null) {
        lineage.add(node);
        final incoming = _inMemoryEdges
            .where((e) => e.targetId == currentId)
            .firstOrNull;
        currentId = incoming?.sourceId;
      } else {
        break;
      }
    }
    return lineage;
  }

  Future<List<GraphNode>> lineage(String nodeId, {int maxDepth = 20}) async {
    final all = await getLineage(nodeId);
    return all.take(maxDepth).toList();
  }

  Future<List<GraphNode>> leaves({int limit = 50}) async {
    final sourcesWithOutgoing = _inMemoryEdges.map((e) => e.sourceId).toSet();
    return _inMemoryNodes
        .where((n) => !sourcesWithOutgoing.contains(n.id))
        .take(limit)
        .toList();
  }

  Future<({List<GraphNode> nodes, List<GraphEdge> edges})> subgraph(
    String nodeId, {
    int depth = 2,
  }) async {
    final visitedNodeIds = <String>{nodeId};
    final collectedEdges = <GraphEdge>[];

    var currentLevelIds = {nodeId};
    for (var d = 0; d < depth; d++) {
      if (currentLevelIds.isEmpty) break;
      final nextLevelIds = <String>{};
      for (final edge in _inMemoryEdges) {
        if (currentLevelIds.contains(edge.sourceId)) {
          collectedEdges.add(edge);
          nextLevelIds.add(edge.targetId);
          visitedNodeIds.add(edge.targetId);
        }
        if (currentLevelIds.contains(edge.targetId)) {
          collectedEdges.add(edge);
          nextLevelIds.add(edge.sourceId);
          visitedNodeIds.add(edge.sourceId);
        }
      }
      currentLevelIds = nextLevelIds;
    }

    final collectedNodes = _inMemoryNodes
        .where((n) => visitedNodeIds.contains(n.id))
        .toList();
    return (nodes: collectedNodes, edges: collectedEdges);
  }
}
