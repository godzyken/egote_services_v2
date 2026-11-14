import 'package:egote_services_v2/config/sync/sync_notifier.dart';
import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmapDevisItem {
  final String reference;
  final String client;
  final String title;
  final String status;
  final Color statusColor;
  final String totalHt;
  final String totalTtc;
  final String date;

  const EmapDevisItem({
    required this.reference,
    required this.client,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.totalHt,
    required this.totalTtc,
    required this.date,
  });
}

class DevisListScreen extends ConsumerWidget {
  const DevisListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncNotifierProvider);

    // Devis réalistes basés sur emap-82.fr
    const emapDevisList = [
      EmapDevisItem(
        reference: 'DEV-EMAP-2026-001',
        client: 'M. Dupont – Montauban',
        title: 'Pose pompe à chaleur air-eau',
        status: 'Envoyé',
        statusColor: Colors.blue,
        totalHt: '8 450,00 €',
        totalTtc: '10 140,00 €',
        date: 'Il y a 3 jours',
      ),
      EmapDevisItem(
        reference: 'DEV-EMAP-2026-002',
        client: 'Mme Martin – Grisolles',
        title: 'Rénovation salle de bain complète',
        status: 'Brouillon',
        statusColor: Colors.grey,
        totalHt: '6 200,00 €',
        totalTtc: '7 440,00 €',
        date: 'Il y a 1 jour',
      ),
      EmapDevisItem(
        reference: 'DEV-EMAP-2026-003',
        client: 'SARL Techno – Castelsarrasin',
        title: 'Climatisation réversible multisplit',
        status: 'Accepté (Chantier créé)',
        statusColor: Colors.green,
        totalHt: '4 800,00 €',
        totalTtc: '5 760,00 €',
        date: 'Il y a 12 heures',
      ),
    ];

    return Scaffold(
      backgroundColor: ChantierColors.background,
      appBar: AppBar(
        title: const Text(
          'Suivi des Devis — emap-82.fr',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: ChantierColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: syncState.status == SyncStatus.syncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: ChantierColors.orange,
                    ),
                  )
                : const Icon(Icons.sync),
            tooltip: 'Synchroniser avec Realtime',
            onPressed: syncState.status == SyncStatus.syncing
                ? null
                : () async {
                    final success = await ref
                        .read(syncNotifierProvider.notifier)
                        .executeSync(() async {
                          await Future.delayed(const Duration(seconds: 1));
                        }, name: 'DevisSync');
                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Devis synchronisés avec la vitrine emap-82.fr !',
                          ),
                        ),
                      );
                    }
                  },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ChantierColors.card,
              borderRadius: BorderRadius.circular(20),
              boxShadow: ChantierColors.softShadow,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _DevisStat(
                  label: 'Total Devis',
                  value: '3',
                  color: ChantierColors.orange,
                ),
                _DevisStat(label: 'En attente', value: '1', color: Colors.blue),
                _DevisStat(label: 'Acceptés', value: '1', color: Colors.green),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Liste des Chiffrages & Propositions',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...emapDevisList.map(
            (devis) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ChantierColors.card,
                borderRadius: BorderRadius.circular(18),
                boxShadow: ChantierColors.softShadow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        devis.reference,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: ChantierColors.orange,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: devis.statusColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          devis.status,
                          style: TextStyle(
                            color: devis.statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    devis.client,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    devis.title,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total TTC',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            devis.totalTtc,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: ChantierColors.ink,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ChantierColors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Consultation du devis ${devis.reference}',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Détails',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DevisStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _DevisStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
