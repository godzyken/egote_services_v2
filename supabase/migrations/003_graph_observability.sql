-- Migration 003: Graph Engineering Observability Schema
CREATE TABLE IF NOT EXISTS graph_nodes (
    id TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    type TEXT NOT NULL,
    provenance TEXT NOT NULL,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS graph_edges (
    id TEXT PRIMARY KEY,
    source_id TEXT REFERENCES graph_nodes(id) ON DELETE CASCADE,
    target_id TEXT REFERENCES graph_nodes(id) ON DELETE CASCADE,
    type TEXT NOT NULL,
    weight DOUBLE PRECISION DEFAULT 1.0,
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS observability_trials (
    id TEXT PRIMARY KEY,
    rule_name TEXT NOT NULL,
    success BOOLEAN NOT NULL,
    message TEXT NOT NULL,
    node_ids TEXT[] DEFAULT ARRAY[]::TEXT[],
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_graph_edges_source ON graph_edges(source_id);
CREATE INDEX IF NOT EXISTS idx_graph_edges_target ON graph_edges(target_id);
