import 'package:talker/talker.dart';

import '../domain/entities/graph_edge.dart';
import '../domain/entities/graph_node.dart';
import '../domain/value_objects/edge_type.dart';
import '../domain/value_objects/node_type.dart';
import '../domain/value_objects/provenance.dart';

class TalkerGraphSink {
  final List<GraphNode> _nodes = [];
  final List<GraphEdge> _edges = [];

  List<GraphNode> get nodes => List.unmodifiable(_nodes);
  List<GraphEdge> get edges => List.unmodifiable(_edges);

  void handleTalkerData(TalkerData data) {
    final id = 'node_${DateTime.now().microsecondsSinceEpoch}';
    NodeType type = NodeType.other;
    if (data is TalkerError || data is TalkerException) {
      type = NodeType.error;
    } else if (data.message?.contains('auth') == true) {
      type = NodeType.service;
    } else if (data.message?.contains('devis') == true) {
      type = NodeType.devis;
    } else if (data.message?.contains('chantier') == true) {
      type = NodeType.chantier;
    } else if (data.message?.contains('sync') == true) {
      type = NodeType.service;
    } else if (data.message?.contains('notification') == true) {
      type = NodeType.notification;
    }

    final node = GraphNode(
      id: id,
      label: data.message ?? data.runtimeType.toString(),
      type: type,
      provenance: const Provenance(source: 'talker'),
      metadata: {
        'title': data.title ?? '',
        'type': data.runtimeType.toString(),
      },
      createdAt: data.time,
    );

    _nodes.add(node);

    if (_nodes.length > 1) {
      final prevNode = _nodes[_nodes.length - 2];
      final edge = GraphEdge.create(
        sourceId: prevNode.id,
        targetId: node.id,
        type: EdgeType.triggers,
        meta: {'provenance': 'talker'},
      );
      _edges.add(edge);
    }
  }
}
