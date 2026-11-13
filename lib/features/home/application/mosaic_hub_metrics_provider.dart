import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModuleMetrics {
  final int badgeCount;
  final String statusSummary;
  final bool hasAlert;

  const ModuleMetrics({
    this.badgeCount = 0,
    this.statusSummary = '',
    this.hasAlert = false,
  });
}

final mosaicHubMetricsProvider = Provider<Map<String, ModuleMetrics>>((ref) {
  // We can combine states from chantier, devis, chat, artisans, etc.
  // Providing live mock metrics for Construction 4.0 Hub modules:
  return {
    'chantier': const ModuleMetrics(
      badgeCount: 2,
      statusSummary: '2 Chantiers actifs • 0 retard',
      hasAlert: true, // weather alert on chantier #1
    ),
    'leads': const ModuleMetrics(
      badgeCount: 5,
      statusSummary: '5 Leads en attente de devis',
      hasAlert: false,
    ),
    'artisans': const ModuleMetrics(
      badgeCount: 12,
      statusSummary: '12 Artisans qualifiés en ligne',
      hasAlert: false,
    ),
    'compta4me': const ModuleMetrics(
      badgeCount: 1,
      statusSummary: '1 Facture à valider',
      hasAlert: false,
    ),
    'sketch': const ModuleMetrics(
      badgeCount: 3,
      statusSummary: '3 Esquisses 3D prêtes',
      hasAlert: false,
    ),
    'atelier': const ModuleMetrics(
      badgeCount: 0,
      statusSummary: 'Catalogue matériaux à jour',
      hasAlert: false,
    ),
    'tools': const ModuleMetrics(
      badgeCount: 0,
      statusSummary: 'Système opérationnel',
      hasAlert: false,
    ),
  };
});
