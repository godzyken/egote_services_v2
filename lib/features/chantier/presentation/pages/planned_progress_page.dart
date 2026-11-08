import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
import 'package:egote_services_v2/features/chantier/presentation/widgets/lot_progress_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlannedProgressPage extends ConsumerWidget {
  const PlannedProgressPage({super.key, required this.chantierId});

  final String chantierId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChantier = ref.watch(chantierByIdProvider(chantierId));

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        title: const Text('Planned Progress'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: asyncChantier.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (chantier) {
          if (chantier == null) {
            return const Center(child: Text('Chantier introuvable'));
          }
          final lots = chantier.phases.expand((p) => p.lots).toList();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  _StatCard(
                    label: 'Planned',
                    value: '${chantier.plannedLotsCount}',
                    color: const Color(0xFFFFB74D),
                  ),
                  const SizedBox(width: 10),
                  _StatCard(
                    label: 'Delayed',
                    value: '${chantier.delayedLotsCount}',
                    color: const Color(0xFFF57C00),
                  ),
                  const SizedBox(width: 10),
                  _StatCard(
                    label: 'Remain',
                    value: '${chantier.remainingLotsCount}',
                    color: const Color(0xFFBDBDBD),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Installed',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
              ...lots.map((lot) => LotProgressTile(lot: lot)),
            ],
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
            ),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
