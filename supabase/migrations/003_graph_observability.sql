-- =============================================================================
-- Migration 003 – Graph Engineering Observability
-- Knowledge Graph (nodes + edges) + support Trial / lignée
-- Compatible avec 001_initial_schema.sql et 002_devis_to_chantier_trigger.sql
-- =============================================================================

-- Extensions utiles (déjà présentes normalement)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ---------------------------------------------------------------------------
-- Table des nœuds
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.graph_nodes (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type          TEXT NOT NULL,                     -- NodeType enum (string)
  timestamp     TIMESTAMPTZ NOT NULL DEFAULT now(),
  payload       JSONB NOT NULL DEFAULT '{}'::jsonb,
  labels        TEXT[] NOT NULL DEFAULT '{}',
  provenance    JSONB NOT NULL DEFAULT '{}'::jsonb,
  confidence    REAL NOT NULL DEFAULT 1.0 CHECK (confidence >= 0 AND confidence <= 1),
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Index pour requêtes fréquentes
CREATE INDEX IF NOT EXISTS idx_graph_nodes_type       ON public.graph_nodes (type);
CREATE INDEX IF NOT EXISTS idx_graph_nodes_timestamp  ON public.graph_nodes (timestamp DESC);
CREATE INDEX IF NOT EXISTS idx_graph_nodes_labels     ON public.graph_nodes USING GIN (labels);
CREATE INDEX IF NOT EXISTS idx_graph_nodes_payload    ON public.graph_nodes USING GIN (payload);

-- ---------------------------------------------------------------------------
-- Table des arêtes
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.graph_edges (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  source_id     UUID NOT NULL REFERENCES public.graph_nodes(id) ON DELETE CASCADE,
  target_id     UUID NOT NULL REFERENCES public.graph_nodes(id) ON DELETE CASCADE,
  type          TEXT NOT NULL,                     -- EdgeType enum (string)
  timestamp     TIMESTAMPTZ NOT NULL DEFAULT now(),
  weight        REAL NOT NULL DEFAULT 1.0,
  meta          JSONB NOT NULL DEFAULT '{}'::jsonb,
  provenance    JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_graph_edges_source     ON public.graph_edges (source_id);
CREATE INDEX IF NOT EXISTS idx_graph_edges_target     ON public.graph_edges (target_id);
CREATE INDEX IF NOT EXISTS idx_graph_edges_type       ON public.graph_edges (type);
CREATE INDEX IF NOT EXISTS idx_graph_edges_source_type ON public.graph_edges (source_id, type);

-- ---------------------------------------------------------------------------
-- RLS (Row Level Security) – lecture publique authentifiée, écriture service
-- Ajuster selon ta politique existante
-- ---------------------------------------------------------------------------
ALTER TABLE public.graph_nodes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.graph_edges ENABLE ROW LEVEL SECURITY;

-- Exemple de policies (à adapter)
CREATE POLICY "Authenticated users can read graph_nodes"
  ON public.graph_nodes FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Authenticated users can read graph_edges"
  ON public.graph_edges FOR SELECT
  TO authenticated
  USING (true);

-- Écriture réservée au service role / edge functions (ou policy plus fine)
CREATE POLICY "Service role can insert graph_nodes"
  ON public.graph_nodes FOR INSERT
  TO service_role
  WITH CHECK (true);

CREATE POLICY "Service role can insert graph_edges"
  ON public.graph_edges FOR INSERT
  TO service_role
  WITH CHECK (true);

-- ---------------------------------------------------------------------------
-- Vue pratique : feuilles (nœuds sans enfants childOf)
-- ---------------------------------------------------------------------------
CREATE OR REPLACE VIEW public.graph_leaves AS
SELECT n.*
FROM public.graph_nodes n
WHERE NOT EXISTS (
  SELECT 1
  FROM public.graph_edges e
  WHERE e.source_id = n.id
    AND e.type = 'childOf'
);

-- ---------------------------------------------------------------------------
-- Commentaires
-- ---------------------------------------------------------------------------
COMMENT ON TABLE public.graph_nodes IS 'Knowledge Graph nodes – projection durable des logs Talker + événements métier';
COMMENT ON TABLE public.graph_edges IS 'Typed edges between graph nodes (lineage, causality, domain relations)';
COMMENT ON VIEW  public.graph_leaves IS 'Nodes that currently have no children (frontier of the DAG)';
