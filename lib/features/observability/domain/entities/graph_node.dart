import 'node_type.dart';
import 'provenance.dart';

class GraphNode {
  final String id;
  final String label;
  final NodeType type;
  final Provenance provenance;
  final Map<String, dynamic> metadata;
  final DateTime createdAt;

  const GraphNode({
    required this.id,
    required this.label,
    required this.type,
    this.provenance = Provenance.system,
    this.metadata = const {},
    required this.createdAt,
  });

  GraphNode copyWith({
    String? id,
    String? label,
    NodeType? type,
    Provenance? provenance,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) {
    return GraphNode(
      id: id ?? this.id,
      label: label ?? this.label,
      type: type ?? this.type,
      provenance: provenance ?? this.provenance,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'type': type.name,
    'provenance': provenance.name,
    'metadata': metadata,
    'createdAt': createdAt.toIso8601String(),
  };

  factory GraphNode.fromJson(Map<String, dynamic> json) {
    return GraphNode(
      id: json['id'] as String,
      label: json['label'] as String,
      type: NodeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => NodeType.custom,
      ),
      provenance: Provenance.values.firstWhere(
        (e) => e.name == json['provenance'],
        orElse: () => Provenance.system,
      ),
      metadata: Map<String, dynamic>.from(json['metadata'] ?? {}),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphNode && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
