# Graph Engineering Observability – egote_services_v2

## Objectif

Contrôler **toutes les facettes** de l’écosystème (logs, erreurs, devis, chantiers, sync,
notifications, providers Riverpod) via un **Knowledge Graph + DAG de lignée**, dans l’esprit de
Karpathy Graph Engineering, **sans remplacer Talker**.

Talker reste la source de vérité pour le debug temps réel.  
Le graphe est une **projection durable, typée et interrogeable**.

## Architecture

```
Talker (existant)
    │
    ▼
TalkerGraphSink  ──────►  GraphNode / GraphEdge
    │
    ▼
SupabaseGraphRepository
    │
    ▼
PostgreSQL (graph_nodes + graph_edges)
    │
    ▼
GraphService (Riverpod)  →  children / lineage / leaves / subgraph
```

## Concepts

| Concept    | Rôle                        | Équivalent Karpathy |
|------------|-----------------------------|---------------------|
| GraphNode  | Fait / événement / entité   | Entity              |
| GraphEdge  | Relation typée              | Typed edge          |
| Trial      | Expérience keep/discard     | Experiment / commit |
| lineage()  | Chemin d’ancêtres           | `ah lineage`        |
| children() | Nœuds enfants directs       | `ah children`       |
| leaves()   | Frontière du DAG            | `ah leaves`         |
| subgraph() | Vue locale autour d’un nœud | Query subgraph      |

## Utilisation rapide

```dart
// Enregistrement manuel
final graph = ref.read(graphServiceProvider);
await graph.recordNode(GraphNode.fromTalker(
  type: NodeType.devis,
  message: 'Devis accepté',
  extra: {'devisId': id},
));

// Traversal
final parents = await graph.lineage(nodeId);
final kids = await graph.children(nodeId);
final frontier = await graph.leaves();
```

## Migration

```bash
# Appliquer la migration
supabase db push
# ou
psql ... -f supabase/migrations/003_graph_observability.sql
```

## Règles AGENTS.md

- Ne jamais faire échouer une feature métier à cause du graphe (try/catch silencieux dans le sink).
- Toujours documenter les nouveaux NodeType / EdgeType dans ce fichier.
- Préférer l’enrichissement des logs Talker existants plutôt que de nouveaux canaux.

## Prochaines étapes

1. Brancher `TalkerGraphSink` dans l’initialisation (main_*.dart).
2. Enrichir les points critiques (auth, devis accepté, sync, notifications).
3. Implémenter la boucle Ratchet sur les règles d’observabilité.
4. Exposer un endpoint / page de visualisation du graphe (optionnel).
