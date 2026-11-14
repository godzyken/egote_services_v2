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
}
