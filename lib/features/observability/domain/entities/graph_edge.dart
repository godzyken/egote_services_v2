import 'package:uuid/uuid.dart';

import '../value_objects/edge_type.dart';
import '../value_objects/provenance.dart';

class GraphEdge {
  final String id;
  final String sourceId;
  final String targetId;
  final EdgeType type;
  final DateTime timestamp;

  /// Poids / force de la relation
  final double weight;

  /// Métadonnées de l’arête
  final Map<String, dynamic> meta;

  final Provenance provenance;

  const GraphEdge({
    required this.id,
    required this.sourceId,
    required this.targetId,
    required this.type,
    required this.timestamp,
    this.weight = 1.0,
    this.meta = const {},
    required this.provenance,
  });

  factory GraphEdge.fromJson(Map<String, dynamic> json) {
    return GraphEdge(
      id: json['id'] as String,
      sourceId:
          json['sourceId'] as String? ?? json['source_id'] as String? ?? '',
      targetId:
          json['targetId'] as String? ?? json['target_id'] as String? ?? '',
      type: EdgeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => EdgeType.childOf,
      ),
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : DateTime.now().toUtc(),
      weight: (json['weight'] as num?)?.toDouble() ?? 1.0,
      meta: (json['meta'] as Map<String, dynamic>?) ?? {},
      provenance: json['provenance'] != null
          ? Provenance.fromJson(json['provenance'] as Map<String, dynamic>)
          : const Provenance(source: 'talker'),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'sourceId': sourceId,
    'targetId': targetId,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'weight': weight,
    'meta': meta,
    'provenance': provenance.toJson(),
  };

  factory GraphEdge.create({
    required String sourceId,
    required String targetId,
    required EdgeType type,
    double weight = 1.0,
    Map<String, dynamic>? meta,
    Provenance? provenance,
  }) {
    return GraphEdge(
      id: const Uuid().v4(),
      sourceId: sourceId,
      targetId: targetId,
      type: type,
      timestamp: DateTime.now().toUtc(),
      weight: weight,
      meta: meta ?? {},
      provenance: provenance ?? const Provenance(source: 'talker'),
    );
  }

  GraphEdge copyWith({
    String? id,
    String? sourceId,
    String? targetId,
    EdgeType? type,
    DateTime? timestamp,
    double? weight,
    Map<String, dynamic>? meta,
    Provenance? provenance,
  }) {
    return GraphEdge(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      weight: weight ?? this.weight,
      meta: meta ?? this.meta,
      provenance: provenance ?? this.provenance,
    );
  }
}
