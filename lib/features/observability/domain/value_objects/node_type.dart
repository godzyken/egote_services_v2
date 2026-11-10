/// Types de nœuds du Knowledge Graph.
/// Extensible sans casser les arêtes existantes.
enum NodeType {
  /// Service / feature (auth, devis, chat, sync…)
  service,

  /// Requête HTTP / appel de méthode
  request,

  /// Erreur / Failure
  error,

  /// Métrique (durée, volume, success rate…)
  metric,

  /// Entité métier Devis
  devis,

  /// Entité métier Chantier / Projet
  chantier,

  /// Utilisateur / Session
  user,

  /// Provider Riverpod
  provider,

  /// Déploiement / version / config change
  deployment,

  /// Notification (FCM, email, in-app)
  notification,

  /// Trial de la boucle ratchet
  trial,

  /// Nœud générique / extension
  other,
}
