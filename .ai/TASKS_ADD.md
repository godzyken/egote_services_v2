## Nouvelles tâches – Graph Engineering Observability

### À faire (branche `feature/graph-engineering-observability`)

- [ ] Ajouter DEC-015 dans `.ai/DECISIONS.md`
- [ ] Mettre à jour `.ai/ROADMAP.md` et `.ai/TASKS.md`
- [ ] Créer le module `lib/features/observability/`
- [ ] Implémenter les entités Domain (GraphNode, GraphEdge, Trial) avec Freezed
- [ ] Créer les enums NodeType / EdgeType / Provenance
- [ ] Implémenter `TalkerGraphSink` (bridge non-intrusif)
- [ ] Écrire la migration SQL `supabase/migrations/003_graph_observability.sql`
- [ ] Implémenter `SupabaseGraphRepository` (insert + traversal)
- [ ] Exposer les services Riverpod (`graphServiceProvider`, `lineageServiceProvider`)
- [ ] Squelette de la boucle Ratchet
- [ ] Tests unitaires Domain + Infrastructure
- [ ] Documenter l’usage dans `docs/graph_engineering.md` et mettre à jour AGENTS.md

### Critères de done

- `flutter analyze` = 0 erreur
- Talker continue de fonctionner exactement comme avant
- Un log structuré produit au moins un nœud + une arête
- Les méthodes `children`, `lineage`, `leaves` retournent des résultats cohérents
- Migration SQL appliquable sans conflit avec 001 et 002
