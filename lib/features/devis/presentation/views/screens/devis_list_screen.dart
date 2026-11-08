import 'package:egote_services_v2/config/sync/sync_notifier.dart';
import 'package:egote_services_v2/features/devis/domain/datasources/get_all_event/get_all_event_state.dart';
import 'package:egote_services_v2/features/devis/domain/providers/devis_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/presentation/views/screens/error_screen.dart';
import '../../../domain/entities/devis_model/devis_model_entity.dart';

class DevisListScreen extends ConsumerWidget {
  const DevisListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devisList = ref.watch(eventListProvider);
    final syncState = ref.watch(syncNotifierProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Liste des Devis'),
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
              tooltip: 'Synchroniser les Devis',
              onPressed: syncState.status == SyncStatus.syncing
                  ? null
                  : () async {
                      final success = await ref
                          .read(syncNotifierProvider.notifier)
                          .executeSync(() async {
                            await Future.delayed(const Duration(seconds: 2));
                          }, name: 'DevisSync');
                      if (success && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Devis synchronisés avec succès !'),
                          ),
                        );
                      }
                    },
            ),
          ],
        ),
        body: devisList.map(
          data: (data) => switch (data.value) {
            QueryGetAllEventError() => const Text('Empty'),
            SuccessGetAllEventState(devisModelEntity: final devisEntity) =>
              Column(
                children: [
                  Text('${devisEntity.length} length'),
                  ...devisEntity.map(
                    (devisModel) => devisModel.when(
                      approved:
                          (
                            id,
                            createdAt,
                            validity,
                            client,
                            pro,
                            travauxEntity,
                            quantity,
                            unitPrice,
                            vatRates,
                            amountHt,
                            amountTtc,
                            approval,
                          ) => Card(child: Text(createdAt.toIso8601String())),
                      initialize: (id, createdAt) =>
                          Card(child: Text(id.id.toString())),
                      empty: () => const Text('Empty'),
                    ),
                  ),
                ],
              ),
          },
          error: (error) => ErrorScreen(error: error.error.toString()),
          loading: (_) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
