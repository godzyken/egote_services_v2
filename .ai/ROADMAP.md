# Roadmap

## Phase 1 : Consolidation & Backend Supabase
- Migration complète de l'authentification et des données vers Supabase.
- Intégration des tables pour Devis, RDV et Messages (`emap_services` bridge).

## Phase 2 : Notifications Multicanal
- Configuration de FCM (Push) et intégration Brevo SMTP (Emails).
- Synchronisation temps réel (Realtime Supabase).

## Phase 3 : Déploiement & CI/CD
- Configuration Netlify / Vercel pour le Hub Web.
- Workflows GitHub Actions pour l'automatisation des builds et tests.

## Phase 4 : Graph Engineering Observability (nouvelle)

Objectif : contrôler toutes les facettes de l’écosystème (logs, erreurs, devis, chantiers, sync,
notifications) via un graphe de connaissance + DAG de lignée, tout en conservant Talker.

### Sous-phases

1. **Fondation Domain**
    - Modèles Freezed : GraphNode, GraphEdge, Trial, NodeType, EdgeType, Provenance
    - Value objects et factories

2. **Bridge Talker → Graph**
    - TalkerGraphSink (ou Observer enrichi)
    - Enrichissement des logs critiques (auth, devis, chantier, sync, notifications)

3. **Persistance & Requêtes**
    - Migration SQL `003_graph_observability.sql`
    - SupabaseGraphRepository (CRUD + traversal)
    - Cache local optionnel (Hive)

4. **Boucle Ratchet**
    - Service de contrôle autonome des règles d’observabilité
    - Enregistrement des Trials dans le DAG

5. **Intégration multi-apps & agents**
    - Propagation des arêtes Devis → Chantier
    - API de sous-graphes pour futurs agents

6. **Tests & Documentation**
    - Tests Domain + Infrastructure
    - Mise à jour AGENTS.md et DECISIONS.md
