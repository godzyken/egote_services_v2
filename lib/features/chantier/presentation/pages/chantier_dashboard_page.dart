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
            onPressed: () => _showEmapNotifications(context),
            icon: const Icon(Icons.notifications_none_rounded),
            color: ChantierColors.ink,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => context.push('/authRoute'),
              child: const Tooltip(
                message: 'Fiche Profil Visiteur / Auth',
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: ChantierColors.orangePale,
                  child: Icon(
                    Icons.person,
                    size: 18,
                    color: ChantierColors.orange,
                  ),
                ),
              ),
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
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: ChantierColors.orange,
                    side: const BorderSide(color: ChantierColors.orange),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () =>
                      context.push('/chantiers/${chantier.id}/bat_track'),
                  icon: const Icon(Icons.camera_alt_rounded),
                  label: const Text(
                    'Ouvrir Bat Track (Journal & Jalons)',
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
        onDestinationSelected: (index) {
          final list = asyncChantiers.asData?.value;
          final chantierId = (list != null && list.isNotEmpty)
              ? list.first.id
              : 'building-2';
          switch (index) {
            case 0:
              context.go('/chantiers');
              break;
            case 1:
              context.go('/chantiers/$chantierId/plan');
              break;
            case 2:
              context.go('/chantiers/$chantierId/progress');
              break;
            case 3:
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Hub Construction 4.0'),
                  content: const Text(
                    'Modules connectés :\n'
                    '• Devis & Facturation (Supabase Realtime)\n'
                    '• Bat Track (Suivi & Journal)\n'
                    '• Compta4me (Trésorerie)\n'
                    '• ConnectyCube Chat',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Fermer'),
                    ),
                  ],
                ),
              );
              break;
            case 4:
              context.go('/chantiers/$chantierId/bat_track');
              break;
          }
        },
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

void _showEmapNotifications(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.notifications_active_rounded,
                color: ChantierColors.orange,
              ),
              const SizedBox(width: 8),
              const Text(
                'Événements App & Vitrine emap-82.fr',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          const _EmapEventTile(
            icon: Icons.flash_on_rounded,
            color: Colors.red,
            title: 'Nouveau Lead Chaud - PAC Air-Eau',
            subtitle: 'M. Dupont (Montauban 82) — Demande via emap-82.fr',
            time: 'Il y a 10 min',
          ),
          const _EmapEventTile(
            icon: Icons.check_circle_rounded,
            color: Colors.green,
            title: 'Devis Accepté & Chantier Créé',
            subtitle: 'Climatisation multisplit (SARL Techno - Castelsarrasin)',
            time: 'Il y a 2h',
          ),
          const _EmapEventTile(
            icon: Icons.receipt_long_rounded,
            color: Colors.teal,
            title: 'Facture FAC-2026-089 Payée',
            subtitle: 'Règlement reçu : 10 140,00 € TTC',
            time: 'Hier',
          ),
        ],
      ),
    ),
  );
}

class _EmapEventTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String time;

  const _EmapEventTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}
