import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        title: const Text('Construction Plan'),
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
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Chip(label: Text(chantier.name)),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text(
                      '${chantier.plannedEnd.day.toString().padLeft(2, '0')}.'
                      '${chantier.plannedEnd.month.toString().padLeft(2, '0')}.'
                      '${chantier.plannedEnd.year}',
                    ),
                    avatar: const Icon(Icons.calendar_today, size: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: chantier.coverImageUrl != null
                      ? Image.network(chantier.coverImageUrl!, fit: BoxFit.cover)
                      : Container(
                          color: const Color(0xFFFFE0B2),
                          child: const Center(
                            child: Icon(
                              Icons.apartment,
                              size: 80,
                              color: Color(0xFFF57C00),
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
                childAspectRatio: 1.2,
                children: chantier.phases
                    .map(
                      (p) => PhaseSummaryCard(
                        phase: p,
                        onTap: () => context.push(
                          '/chantiers/${chantier.id}/progress',
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Timeline snapshot',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFE0E0E0),
                      Color(0xFFFFB74D),
                      Color(0xFFF57C00),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
