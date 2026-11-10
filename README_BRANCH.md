# Branche `feature/graph-engineering-observability`

## Contenu livré

Ce dossier contient **tout le nécessaire** pour ouvrir et alimenter la nouvelle branche.

### Structure

```
graph-engineering-branch/
├── .ai/
│   ├── DECISIONS_ADD.md      ← à fusionner dans DECISIONS.md (DEC-015)
│   ├── ROADMAP_ADD.md        ← à fusionner dans ROADMAP.md
│   └── TASKS_ADD.md          ← à fusionner dans TASKS.md
├── lib/features/observability/
│   ├── domain/
│   │   ├── entities/
│   │   │   ├── graph_node.dart
│   │   │   ├── graph_edge.dart
│   │   │   └── trial.dart
│   │   └── value_objects/
│   │       ├── node_type.dart
│   │       ├── edge_type.dart
│   │       └── provenance.dart
│   ├── application/
│   │   └── graph_service.dart
│   └── infrastructure/
│       ├── talker_graph_sink.dart
│       └── supabase_graph_repository.dart
├── supabase/migrations/
│   └── 003_graph_observability.sql
├── docs/
│   └── graph_engineering.md
└── README_BRANCH.md          ← ce fichier
```

## Comment appliquer

```bash
# 1. Créer la branche
git checkout -b feature/graph-engineering-observability

# 2. Copier les fichiers
cp -r path/to/graph-engineering-branch/lib/features/observability lib/features/
cp path/to/graph-engineering-branch/supabase/migrations/003_graph_observability.sql supabase/migrations/
cp path/to/graph-engineering-branch/docs/graph_engineering.md docs/

# 3. Fusionner les ajouts .ai
# (ouvrir les *_ADD.md et coller le contenu aux bons endroits)

# 4. Générer le code Freezed
dart run build_runner build --delete-conflicting-outputs

# 5. Vérifier
flutter analyze
flutter test
```

## Dépendances éventuelles

Si ce n’est pas déjà présent :

```yaml
# pubspec.yaml
dependencies:
  uuid: ^4.0.0          # déjà très probable
  freezed_annotation:   # déjà présent
  json_annotation:      # déjà présent
```

## Ordre de commits recommandé

1. `docs: DEC-015 + roadmap + tasks graph engineering`
2. `feat(observability): domain models (Node, Edge, Trial)`
3. `feat(observability): TalkerGraphSink + SupabaseGraphRepository`
4. `feat(observability): GraphService + Riverpod providers`
5. `chore(db): migration 003_graph_observability`
6. `docs: graph_engineering.md`

## Statut

Prêt pour revue et intégration.  
Talker n’est **pas** modifié de façon destructive.  
Le graphe est purement additif.
