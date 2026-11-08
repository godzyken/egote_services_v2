import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/chantier_entity.dart';

class ChantiersNotifier extends Notifier<List<ChantierEntity>> {
  @override
  List<ChantierEntity> build() {
    // Initial mock or loaded chantiers derived from accepted devis triggers
    return [
      ChantierEntity(
        id: 1,
        clientId: 12,
        title: 'Projet / Chantier - Rénovation Peinture',
        description: 'Généré automatiquement depuis le devis validé (ID: 101)',
        status: 'active',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      ChantierEntity(
        id: 2,
        clientId: 15,
        title: 'Projet / Chantier - Isolation Toiture',
        description: 'Généré automatiquement depuis le devis validé (ID: 102)',
        status: 'active',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];
  }

  void addChantier(ChantierEntity chantier) {
    state = [...state, chantier];
  }

  void removeChantier(int id) {
    state = state.where((c) => c.id != id).toList();
  }
}

final chantiersNotifierProvider =
    NotifierProvider<ChantiersNotifier, List<ChantierEntity>>(
      ChantiersNotifier.new,
      name: 'chantiersNotifierProvider',
    );
