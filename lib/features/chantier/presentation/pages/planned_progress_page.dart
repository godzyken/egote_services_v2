import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
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
      backgroundColor: ChantierColors.background,
      appBar: AppBar(
        backgroundColor: ChantierColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Planned Progress',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ChantierColors.ink,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
      body: asyncChantier.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: ChantierColors.orange),
        ),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (chantier) {
          if (chantier == null) {
            return const Center(child: Text('Chantier introuvable'));
          }
          final lots = chantier.phases.expand((p) => p.lots).toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: ChantierColors.card,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: ChantierColors.softShadow,
                ),
                child: Row(
                  children: [
                    _StatBlock(
                      label: 'Planned',
                      value: '${chantier.plannedLotsCount + chantier.delayedLotsCount + (lots.where((l) => l.isDone).length)}',
                      color: ChantierColors.orangeSoft,
                      emphasize: true,
                    ),
                    const SizedBox(width: 10),
                    _StatBlock(
                      label: 'Delayed',
                      value: '${chantier.delayedLotsCount}',
                      color: ChantierColors.orange,
                    ),
                    const SizedBox(width: 10),
                    _StatBlock(
                      label: 'Remain',
                      value: '${chantier.remainingLotsCount}',
                      color: ChantierColors.remain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    'Installed',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: ChantierColors.ink,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: ChantierColors.muted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
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

class _StatBlock extends StatelessWidget {
  const _StatBlock({
    required this.label,
    required this.value,
    required this.color,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final Color color;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: emphasize ? 0.9 : 0.18),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: emphasize ? Colors.white : color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: emphasize
                    ? Colors.white.withValues(alpha: 0.9)
                    : ChantierColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
