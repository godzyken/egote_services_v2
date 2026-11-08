import 'package:egote_services_v2/config/sync/sync_notifier.dart';
import 'package:egote_services_v2/features/chantiers/domain/providers/chantiers_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChantiersListScreen extends ConsumerWidget {
  const ChantiersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chantiers = ref.watch(chantiersNotifierProvider);
    final syncState = ref.watch(syncNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi des Chantiers & Projets'),
        actions: [
          IconButton(
            icon: syncState.status == SyncStatus.syncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.sync),
            tooltip: 'Synchroniser les Chantiers',
            onPressed: syncState.status == SyncStatus.syncing
                ? null
                : () async {
                    final success = await ref
                        .read(syncNotifierProvider.notifier)
                        .executeSync(() async {
                          // Simulate fetching latest chantiers synced from devis triggers
                          await Future.delayed(const Duration(seconds: 2));
                        }, name: 'ChantiersSync');

                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Chantiers synchronisés avec succès !'),
                        ),
                      );
                    }
                  },
          ),
        ],
      ),
      body: chantiers.isEmpty
          ? const Center(
              child: Text(
                'Aucun chantier actif pour le moment.\nLes chantiers sont créés automatiquement lors de l\'acceptation des devis.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: chantiers.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final chantier = chantiers[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.greenAccent[400],
                      child: const Icon(
                        Icons.construction,
                        color: Colors.black87,
                      ),
                    ),
                    title: Text(
                      chantier.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(chantier.description),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Chip(
                              label: Text(
                                chantier.status.toUpperCase(),
                                style: const TextStyle(fontSize: 10),
                              ),
                              backgroundColor: Colors.green[100],
                            ),
                            const Spacer(),
                            Text(
                              'Créé le : ${chantier.createdAt.toLocal().toString().split(' ')[0]}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
