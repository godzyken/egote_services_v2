import 'package:uuid/uuid.dart';

import '../value_objects/provenance.dart';

enum TrialDecision { kept, reverted, crash, skipped }

/// Équivalent d’une « expérience » Karpathy (boucle ratchet).
/// Permet de tracer keep / discard avec parent et métrique.
class Trial {
  final String id;

  /// Nœud parent (état précédent)
  final String? parentId;

  /// Description de la proposition / changement
  final String hypothesis;

  /// Diff ou payload du changement
  final Map<String, dynamic> change;

  /// Métrique observée après application
  final Map<String, dynamic>? metric;

  /// Décision
  final TrialDecision decision;

  /// Raison (crash, régression, amélioration…)
  final String? reason;

  final DateTime timestamp;
  final Provenance provenance;

  const Trial({
    required this.id,
    this.parentId,
    required this.hypothesis,
    this.change = const {},
    this.metric,
    required this.decision,
    this.reason,
    required this.timestamp,
    required this.provenance,
  });

  factory Trial.fromJson(Map<String, dynamic> json) {
    return Trial(
      id: json['id'] as String,
      parentId: json['parentId'] as String? ?? json['parent_id'] as String?,
      hypothesis: json['hypothesis'] as String? ?? '',
      change: (json['change'] as Map<String, dynamic>?) ?? {},
      metric: json['metric'] as Map<String, dynamic>?,
      decision: TrialDecision.values.firstWhere(
        (e) => e.name == json['decision'],
        orElse: () => TrialDecision.kept,
      ),
      reason: json['reason'] as String?,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : DateTime.now().toUtc(),
      provenance: json['provenance'] != null
          ? Provenance.fromJson(json['provenance'] as Map<String, dynamic>)
          : const Provenance(source: 'ratchet'),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'parentId': parentId,
    'hypothesis': hypothesis,
    'change': change,
    'metric': metric,
    'decision': decision.name,
    'reason': reason,
    'timestamp': timestamp.toIso8601String(),
    'provenance': provenance.toJson(),
  };

  factory Trial.create({
    String? parentId,
    required String hypothesis,
    Map<String, dynamic>? change,
    Map<String, dynamic>? metric,
    required TrialDecision decision,
    String? reason,
    Provenance? provenance,
  }) {
    return Trial(
      id: const Uuid().v4(),
      parentId: parentId,
      hypothesis: hypothesis,
      change: change ?? {},
      metric: metric,
      decision: decision,
      reason: reason,
      timestamp: DateTime.now().toUtc(),
      provenance: provenance ?? const Provenance(source: 'ratchet'),
    );
  }

  Trial copyWith({
    String? id,
    String? parentId,
    String? hypothesis,
    Map<String, dynamic>? change,
    Map<String, dynamic>? metric,
    TrialDecision? decision,
    String? reason,
    DateTime? timestamp,
    Provenance? provenance,
  }) {
    return Trial(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      hypothesis: hypothesis ?? this.hypothesis,
      change: change ?? this.change,
      metric: metric ?? this.metric,
      decision: decision ?? this.decision,
      reason: reason ?? this.reason,
      timestamp: timestamp ?? this.timestamp,
      provenance: provenance ?? this.provenance,
    );
  }
}
