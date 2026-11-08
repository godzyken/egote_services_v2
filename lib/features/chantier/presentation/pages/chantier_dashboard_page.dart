import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
import 'package:egote_services_v2/features/chantier/presentation/widgets/building_hero_card.dart';
import 'package:egote_services_v2/features/chantier/presentation/widgets/progress_ring_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChantierDashboardPage extends ConsumerWidget {
  const ChantierDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChantiers = ref.watch(chantiersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F5),
      appBar: AppBar(
        title: const Text('Buildexa'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(radius: 16, child: Icon(Icons.person, size: 18)),
          ),
        ],
      ),
      body: asyncChantiers.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Aucun chantier'));
          }
          final chantier = list.first;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ProgressRingHeader(
                progressPercent: chantier.overallProgress,
                plannedEnd: chantier.plannedEnd,
                delayDays: chantier.totalDelayDays,
              ),
              const SizedBox(height: 16),
              BuildingHeroCard(
                title: 'Building Plan',
                imageUrl: chantier.coverImageUrl,
                onOpenPlan: () => context.push('/chantiers/${chantier.id}/plan'),
              ),
              const SizedBox(height: 16),
              FilledButton.tonalIcon(
                onPressed: () =>
                    context.push('/chantiers/${chantier.id}/progress'),
                icon: const Icon(Icons.timeline),
                label: const Text('Voir la progression planifiée'),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.calendar_today_outlined), label: 'Plan'),
          NavigationDestination(icon: Icon(Icons.access_time), label: 'Time'),
          NavigationDestination(icon: Icon(Icons.grid_view_rounded), label: 'Modules'),
          NavigationDestination(icon: Icon(Icons.assignment_outlined), label: 'Tasks'),
        ],
      ),
    );
  }
}
