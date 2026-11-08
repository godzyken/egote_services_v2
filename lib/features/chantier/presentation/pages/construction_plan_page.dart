import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:egote_services_v2/features/chantier/presentation/widgets/phase_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConstructionPlanPage extends ConsumerWidget {
  const ConstructionPlanPage({super.key, required this.chantierId});

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
          'Construction Plan',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ChantierColors.ink,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
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

          String dateLabel(DateTime d) => '${d.day.toString().padLeft(2, '0')}.'
              '${d.month.toString().padLeft(2, '0')}.'
              '${d.year}';

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _ChipPill(
                    icon: Icons.apartment_outlined,
                    label: chantier.name,
                  ),
                  _ChipPill(
                    icon: Icons.calendar_today_outlined,
                    label: dateLabel(chantier.plannedEnd),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: ChantierColors.softShadow,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: chantier.coverImageUrl != null
                        ? Image.network(
                            chantier.coverImageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFFFF8E1),
                                  Color(0xFFFFE0B2),
                                  Color(0xFFFFB74D),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.apartment_rounded,
                                size: 88,
                                color: ChantierColors.orange,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.35,
                children: chantier.phases.map((p) {
                  final end = p.lots
                      .map((l) => l.plannedEnd)
                      .whereType<DateTime>()
                      .fold<DateTime?>(
                        null,
                        (prev, d) => prev == null || d.isAfter(prev) ? d : prev,
                      );
                  return PhaseSummaryCard(
                    phase: p,
                    subtitle: end != null ? dateLabel(end) : null,
                    onTap: () => context.push(
                      '/chantiers/${chantier.id}/progress',
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ChantierColors.card,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: ChantierColors.softShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 16),
                        const SizedBox(width: 8),
                        Text(
                          dateLabel(chantier.plannedEnd),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ChantierColors.ink,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.north_east_rounded, size: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Unit Range',
                          style: TextStyle(
                            color: ChantierColors.muted,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Distance',
                          style: TextStyle(
                            color: ChantierColors.muted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2-46',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '366 mi',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: 18,
                        child: Row(
                          children: List.generate(24, (i) {
                            final active = i > 8 && i < 20;
                            return Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                color: active
                                    ? (i > 14
                                        ? ChantierColors.orange
                                        : ChantierColors.orangeSoft)
                                    : ChantierColors.track,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ChipPill extends StatelessWidget {
  const _ChipPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ChantierColors.card,
        borderRadius: BorderRadius.circular(99),
        boxShadow: ChantierColors.softShadow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: ChantierColors.muted),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: ChantierColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}
