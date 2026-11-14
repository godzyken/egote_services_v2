import '../value_objects/edge_type.dart';
import '../value_objects/provenance.dart';

class GraphEdge {
  final String id;
  final String sourceId;
  final String targetId;
  final EdgeType type;
  final double weight;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;

  const GraphEdge({
    required this.id,
    required this.sourceId,
    required this.targetId,
    required this.type,
    this.weight = 1.0,
    this.metadata = const {},
    required this.createdAt,
  });

  factory GraphEdge.create({
    required String sourceId,
    required String targetId,
    required EdgeType type,
    double weight = 1.0,
    Map<String, dynamic>? meta,
    Provenance? provenance,
  }) {
    final id =
        'edge_${sourceId}_${targetId}_${DateTime.now().microsecondsSinceEpoch}';
    return GraphEdge(
      id: id,
      sourceId: sourceId,
      targetId: targetId,
      type: type,
      weight: weight,
      metadata: meta ?? {},
      createdAt: DateTime.now(),
    );
  }

  GraphEdge copyWith({
    String? id,
    String? sourceId,
    String? targetId,
    EdgeType? type,
    double? weight,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) {
    return GraphEdge(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      targetId: targetId ?? this.targetId,
      type: type ?? this.type,
      weight: weight ?? this.weight,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'sourceId': sourceId,
    'targetId': targetId,
    'type': type.name,
    'weight': weight,
    'metadata': metadata,
    'createdAt': createdAt.toIso8601String(),
  };

  factory GraphEdge.fromJson(Map<String, dynamic> json) {
    return GraphEdge(
      id: json['id'] as String,
      sourceId: json['sourceId'] as String,
      targetId: json['targetId'] as String,
      type: EdgeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => EdgeType.triggers,
      ),
      weight: (json['weight'] as num?)?.toDouble() ?? 1.0,
      metadata: Map<String, dynamic>.from(json['metadata'] ?? {}),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphEdge && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
