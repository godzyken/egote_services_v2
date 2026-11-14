import 'package:flutter/material.dart';

import '../../../chantier/presentation/theme/chantier_colors.dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leads = [
      LeadItem(
        name: 'M. Dupont',
        city: 'Montauban (82)',
        project: 'Pose pompe à chaleur air-eau',
        urgency: 'Chaud (Urgent)',
        urgencyColor: Colors.red,
        source: 'emap-82.fr',
        assignedTeam: 'Équipe Chauffage 1 (Thomas)',
        budget: '8 450 € HT',
        date: 'Il y a 3 jours',
      ),
      LeadItem(
        name: 'Mme Martin',
        city: 'Grisolles (82)',
        project: 'Rénovation salle de bain complète',
        urgency: 'Tiède (Projet 1-3 mois)',
        urgencyColor: Colors.orange,
        source: 'emap-82.fr',
        assignedTeam: 'Équipe Plomberie (Marc)',
        budget: '6 200 € HT',
        date: 'Il y a 1 jour',
      ),
      LeadItem(
        name: 'SARL Techno',
        city: 'Castelsarrasin (82)',
        project: 'Climatisation réversible multisplit',
        urgency: 'Chaud (Signé / Devis accepté)',
        urgencyColor: Colors.green,
        source: 'emap-82.fr',
        assignedTeam: 'Équipe Clim & PAC',
        budget: '4 800 € HT',
        date: 'Il y a 12 heures',
      ),
    ];

    return Scaffold(
      backgroundColor: ChantierColors.background,
      appBar: AppBar(
        title: const Text(
          'Gestion des Leads & Attribution BTP',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: ChantierColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1_rounded),
            tooltip: 'Attribuer une équipe',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Module d’attribution d’équipe ouvert'),
                ),
              );
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _LeadStat(
                  title: 'Leads Actifs',
                  count: '3',
                  color: ChantierColors.orange,
                ),
                _LeadStat(title: 'Chauds', count: '2', color: Colors.red),
                _LeadStat(title: 'Attribués', count: '3', color: Colors.green),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Flux Entrant — emap-82.fr & Partenaires',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...leads.map(
            (lead) => Container(
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
                        lead.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: lead.urgencyColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          lead.urgency,
                          style: TextStyle(
                            color: lead.urgencyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        lead.city,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        lead.budget,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ChantierColors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Projet : ${lead.project}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.badge_outlined,
                        size: 14,
                        color: ChantierColors.muted,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Attribué à : ${lead.assignedTeam}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ChantierColors.ink,
                        ),
                      ),
                      const Spacer(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: ChantierColors.orange),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Gestion lead & attribution pour ${lead.name}',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Gérer',
                          style: TextStyle(
                            fontSize: 12,
                            color: ChantierColors.orange,
                          ),
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

class LeadItem {
  final String name;
  final String city;
  final String project;
  final String urgency;
  final Color urgencyColor;
  final String source;
  final String assignedTeam;
  final String budget;
  final String date;

  LeadItem({
    required this.name,
    required this.city,
    required this.project,
    required this.urgency,
    required this.urgencyColor,
    required this.source,
    required this.assignedTeam,
    required this.budget,
    required this.date,
  });
}

class _LeadStat extends StatelessWidget {
  final String title;
  final String count;
  final Color color;

  const _LeadStat({
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
