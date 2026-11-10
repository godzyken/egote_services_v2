import 'package:uuid/uuid.dart';

import '../value_objects/node_type.dart';
import '../value_objects/provenance.dart';

class GraphNode {
  final String id;
  final NodeType type;
  final DateTime timestamp;

  /// Payload libre (message, métrique, objet métier sérialisé…)
  final Map<String, dynamic> payload;

  /// Labels / tags pour filtrage rapide
  final List<String> labels;

  final Provenance provenance;

  /// Score de confiance / importance (0.0 – 1.0)
  final double confidence;

  const GraphNode({
    required this.id,
    required this.type,
    required this.timestamp,
    this.payload = const {},
    this.labels = const [],
    required this.provenance,
    this.confidence = 1.0,
  });

  factory GraphNode.fromJson(Map<String, dynamic> json) {
    return GraphNode(
      id: json['id'] as String,
      type: NodeType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => NodeType.other,
      ),
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : DateTime.now().toUtc(),
      payload: (json['payload'] as Map<String, dynamic>?) ?? {},
      labels:
          (json['labels'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      provenance: json['provenance'] != null
          ? Provenance.fromJson(json['provenance'] as Map<String, dynamic>)
          : const Provenance(source: 'talker'),
      confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'timestamp': timestamp.toIso8601String(),
    'payload': payload,
    'labels': labels,
    'provenance': provenance.toJson(),
    'confidence': confidence,
  };

  /// Factory pratique pour créer un nœud à partir d’un log Talker.
  factory GraphNode.fromTalker({
    required NodeType type,
    required String message,
    Map<String, dynamic>? extra,
    Provenance? provenance,
    List<String>? labels,
  }) {
    return GraphNode(
      id: const Uuid().v4(),
      type: type,
      timestamp: DateTime.now().toUtc(),
      payload: {'message': message, ...?extra},
      labels: labels ?? [],
      provenance: provenance ?? const Provenance(source: 'talker'),
    );
  }

  GraphNode copyWith({
    String? id,
    NodeType? type,
    DateTime? timestamp,
    Map<String, dynamic>? payload,
    List<String>? labels,
    Provenance? provenance,
    double? confidence,
  }) {
    return GraphNode(
      id: id ?? this.id,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      payload: payload ?? this.payload,
      labels: labels ?? this.labels,
      provenance: provenance ?? this.provenance,
      confidence: confidence ?? this.confidence,
    );
  }
}
