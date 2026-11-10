## DEC-015 : Couche Graph Engineering (Knowledge Graph + DAG de lignée) au-dessus de Talker

- **Date** : 2026-11-09
- **Décision** : Introduire une couche d’observabilité structurée en graphe (style Karpathy Graph
  Engineering) au-dessus du système Talker existant, sans le remplacer.
- **Objectifs** :
    1. Transformer les logs structurés en nœuds et arêtes typés persistants.
    2. Permettre la navigation de lignée (`children`, `lineage`, `leaves`, `subgraph`).
    3. Offrir une mémoire partagée cross-session et cross-app (egote_services ↔ emap_services).
    4. Supporter une boucle ratchet autonome sur les règles d’observabilité elles-mêmes.
- **Principes** :
    - Talker reste la source de vérité pour le debug temps réel et le ProviderObserver.
    - Le graphe est une projection durable et interrogeable.
    - Aucune modification destructive des features existantes.
    - Compatibilité totale avec Clean Architecture / Feature-first.
- **Implémentation** :
    - Nouveau feature module : `lib/features/observability/`
    - Domain : `GraphNode`, `GraphEdge`, `Trial`, enums typés
    - Infrastructure : `TalkerGraphSink` + `SupabaseGraphRepository`
    - Migration SQL : `003_graph_observability.sql`
- **Statut** : Validé (à implémenter sur la branche `feature/graph-engineering-observability`).
- **Références** : Karpathy Graph Engineering Systems (synthèse 2026), DEC-003 (Talker), DEC-008
  (TalkerProviderObserver).
