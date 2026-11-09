import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
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
      backgroundColor: ChantierColors.background,
      appBar: AppBar(
        backgroundColor: ChantierColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: ChantierColors.orangePale,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.grid_view_rounded,
                color: ChantierColors.orange,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Buildexa',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: ChantierColors.ink,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
            color: ChantierColors.ink,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: ChantierColors.orangePale,
              child: Icon(Icons.person, size: 18, color: ChantierColors.orange),
            ),
          ),
        ],
      ),
      body: asyncChantiers.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: ChantierColors.orange),
        ),
        error: (e, _) => Center(child: Text('Erreur: $e')),
        data: (list) {
          if (list.isEmpty) {
            return const Center(child: Text('Aucun chantier'));
          }
          final chantier = list.first;
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
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
                onOpenPlan: () =>
                    context.push('/chantiers/${chantier.id}/plan'),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: ChantierColors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () =>
                      context.push('/chantiers/${chantier.id}/progress'),
                  child: const Text(
                    'Voir la progression planifiée',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: ChantierColors.card,
        indicatorColor: ChantierColors.orangePale,
        selectedIndex: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(
              Icons.home_rounded,
              color: ChantierColors.orange,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Plan',
          ),
          NavigationDestination(icon: Icon(Icons.access_time), label: 'Time'),
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Modules',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }
}
