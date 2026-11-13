import 'package:egote_services_v2/features/chantier/application/providers/chantier_providers.dart';
import 'package:egote_services_v2/features/devis/domain/datasources/get_all_event/get_all_event_state.dart';
import 'package:egote_services_v2/features/devis/domain/providers/devis_list_provider.dart';
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

class DemoModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;

  void set(bool value) => state = value;
}

/// Toggle entre Données Réelles et Mode Démonstration
final isDemoModeProvider = NotifierProvider<DemoModeNotifier, bool>(
  () => DemoModeNotifier(),
);

final mosaicHubMetricsProvider = Provider<Map<String, ModuleMetrics>>((ref) {
  final isDemo = ref.watch(isDemoModeProvider);

  if (isDemo) {
    return {
      'chantier': const ModuleMetrics(
        badgeCount: 2,
        statusSummary: '2 Chantiers actifs (Mode Démo)',
        hasAlert: true,
      ),
      'leads': const ModuleMetrics(
        badgeCount: 5,
        statusSummary: '5 Leads en attente (Mode Démo)',
        hasAlert: false,
      ),
      'artisans': const ModuleMetrics(
        badgeCount: 12,
        statusSummary: '12 Artisans qualifiés (Mode Démo)',
        hasAlert: false,
      ),
      'compta4me': const ModuleMetrics(
        badgeCount: 1,
        statusSummary: '1 Facture à valider (Mode Démo)',
        hasAlert: false,
      ),
      'sketch': const ModuleMetrics(
        badgeCount: 3,
        statusSummary: '3 Esquisses 3D (Mode Démo)',
        hasAlert: false,
      ),
      'atelier': const ModuleMetrics(
        badgeCount: 0,
        statusSummary: 'Catalogue à jour (Mode Démo)',
        hasAlert: false,
      ),
      'tools': const ModuleMetrics(
        badgeCount: 0,
        statusSummary: 'Système opérationnel (Mode Démo)',
        hasAlert: false,
      ),
    };
  }

  // Real data from providers
  final chantiersAsync = ref.watch(chantiersProvider);
  final devisAsync = ref.watch(eventListProvider);

  int chantiersCount = chantiersAsync.maybeWhen(
    data: (list) => list.length,
    orElse: () => 0,
  );

  int devisCount = devisAsync.maybeWhen(
    data: (state) {
      if (state is SuccessGetAllEventState) {
        return state.devisModelEntity.length;
      }
      return 0;
    },
    orElse: () => 0,
  );

  return {
    'chantier': ModuleMetrics(
      badgeCount: chantiersCount,
      statusSummary: chantiersCount > 0
          ? '$chantiersCount Chantiers en cours'
          : 'Aucun chantier actif',
      hasAlert: false,
    ),
    'leads': ModuleMetrics(
      badgeCount: devisCount,
      statusSummary: devisCount > 0
          ? '$devisCount Devis / Leads enregistrés'
          : 'Aucun lead récent',
      hasAlert: false,
    ),
    'artisans': const ModuleMetrics(
      badgeCount: 1,
      statusSummary: 'Réseau d’artisans connectés',
      hasAlert: false,
    ),
    'compta4me': ModuleMetrics(
      badgeCount: devisCount > 0 ? 1 : 0,
      statusSummary: 'Comptabilité synchronisée',
      hasAlert: false,
    ),
    'sketch': const ModuleMetrics(
      badgeCount: 2,
      statusSummary: 'Esquisses synchronisées',
      hasAlert: false,
    ),
    'atelier': const ModuleMetrics(
      badgeCount: 0,
      statusSummary: 'Matériaux & stock à jour',
      hasAlert: false,
    ),
    'tools': const ModuleMetrics(
      badgeCount: 0,
      statusSummary: 'Cockpit connecté (Supabase)',
      hasAlert: false,
    ),
  };
});
