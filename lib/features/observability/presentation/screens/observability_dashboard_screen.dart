import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/observability_providers.dart';

class ObservabilityDashboardScreen extends ConsumerWidget {
  const ObservabilityDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sink = ref.watch(talkerGraphSinkProvider);
    final nodes = sink.nodes;
    final edges = sink.edges;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Graph Observability & Ligneage'),
        backgroundColor: Colors.teal.shade800,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Expanded(
                child: _MetricCard(
                  title: 'Nœuds actifs',
                  count: nodes.length,
                  color: Colors.blue,
                  icon: Icons.hub_rounded,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _MetricCard(
                  title: 'Arêtes / Flux',
                  count: edges.length,
                  color: Colors.orange,
                  icon: Icons.linear_scale_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Journal du Graphe (Talker Sink)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (nodes.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(60),
                child: Column(
                  children: [
                    Icon(
                      Icons.hub_outlined,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Aucun événement enregistré dans le graphe.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            ...nodes.reversed.map(
              (node) => Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: _getColorForType(node.type.name),
                    child: Icon(
                      _getIconForType(node.type.name),
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  title: Text(
                    node.label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Type: ${node.type.name} • Provenance: ${node.provenance.source} • ${node.createdAt.toLocal().toIso8601String().substring(11, 19)}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getColorForType(String type) {
    switch (type) {
      case 'error':
        return Colors.red;
      case 'service':
        return Colors.purple;
      case 'devis':
        return Colors.teal;
      case 'chantier':
        return Colors.orange;
      case 'sync':
        return Colors.blue;
      case 'notification':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'error':
        return Icons.error_outline_rounded;
      case 'service':
        return Icons.layers_rounded;
      case 'devis':
        return Icons.receipt_long_rounded;
      case 'chantier':
        return Icons.construction_rounded;
      case 'sync':
        return Icons.sync_rounded;
      case 'notification':
        return Icons.notifications_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  final String title;
  final int count;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
