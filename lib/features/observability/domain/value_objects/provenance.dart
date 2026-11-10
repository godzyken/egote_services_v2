/// Origine d’un nœud ou d’une arête (traçabilité Karpathy-style).
class Provenance {
  final String source;
  final String? sessionId;
  final String? file;
  final String? commit;
  final String? actor;
  final Map<String, dynamic> meta;

  const Provenance({
    required this.source,
    this.sessionId,
    this.file,
    this.commit,
    this.actor,
    this.meta = const {},
  });

  factory Provenance.fromJson(Map<String, dynamic> json) {
    return Provenance(
      source: json['source'] as String? ?? 'unknown',
      sessionId: json['sessionId'] as String?,
      file: json['file'] as String?,
      commit: json['commit'] as String?,
      actor: json['actor'] as String?,
      meta: (json['meta'] as Map<String, dynamic>?) ?? {},
    );
  }

  Map<String, dynamic> toJson() => {
    'source': source,
    'sessionId': sessionId,
    'file': file,
    'commit': commit,
    'actor': actor,
    'meta': meta,
  };

  Provenance copyWith({
    String? source,
    String? sessionId,
    String? file,
    String? commit,
    String? actor,
    Map<String, dynamic>? meta,
  }) {
    return Provenance(
      source: source ?? this.source,
      sessionId: sessionId ?? this.sessionId,
      file: file ?? this.file,
      commit: commit ?? this.commit,
      actor: actor ?? this.actor,
      meta: meta ?? this.meta,
    );
  }
}
