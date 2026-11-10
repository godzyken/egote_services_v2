/// Types d’arêtes typées du Knowledge Graph.
enum EdgeType {
  /// A causé B
  caused,

  /// A été émis par
  emittedBy,

  /// Dépend de
  dependsOn,

  /// Remplace / supersède
  supersedes,

  /// A résolu
  resolvedBy,

  /// Provenance de
  provenanceOf,

  /// Parent dans le DAG (ligneage)
  parentOf,

  /// Enfant dans le DAG
  childOf,

  /// Lié métier (Devis → Chantier)
  triggers,

  /// Contexte / tag
  relatedTo,
}
