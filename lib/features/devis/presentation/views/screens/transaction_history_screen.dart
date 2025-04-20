import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/providers/transaction_provider.dart';

class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  ConsumerState<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState
    extends ConsumerState<TransactionHistoryScreen> {
  String filterName = '';
  DateTimeRange? selectedRange;

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(transactionHistoryNotifierProvider);

    return Column(
      children: [
        // 🔍 Filtrage par nom
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration:
                const InputDecoration(labelText: 'Filtrer par nom de produit'),
            onChanged: (val) {
              setState(() => filterName = val);
              if (val.isEmpty) {
                ref
                    .read(transactionHistoryNotifierProvider.notifier)
                    .resetFilters();
              } else {
                ref
                    .read(transactionHistoryNotifierProvider.notifier)
                    .filterByProductName(val);
              }
            },
          ),
        ),

        // 📆 Filtrage par date
        Row(
          children: [
            TextButton(
              onPressed: () async {
                final now = DateTime.now();
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(now.year - 1),
                  lastDate: now,
                );

                if (picked != null) {
                  setState(() => selectedRange = picked);
                  ref
                      .read(transactionHistoryNotifierProvider.notifier)
                      .filterByDateRange(picked.start, picked.end);
                }
              },
              child: Text(selectedRange != null
                  ? '${selectedRange!.start.toLocal().toString().split(" ").first} → ${selectedRange!.end.toLocal().toString().split(" ").first}'
                  : 'Filtrer par date'),
            ),
            if (selectedRange != null || filterName.isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedRange = null;
                    filterName = '';
                  });
                  ref
                      .read(transactionHistoryNotifierProvider.notifier)
                      .resetFilters();
                },
                child: const Text('Réinitialiser'),
              ),
          ],
        ),

        // 🧾 Liste des transactions
        Expanded(
          child: history.when(
            data: (transactions) => transactions.isEmpty
                ? const Center(child: Text('Aucune transaction'))
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (_, i) {
                      final tx = transactions[i];
                      return ListTile(
                        title: Text(tx.produit.name),
                        subtitle: Text('${tx.action} • ${tx.timestamp}'),
                        trailing: Text('${tx.total.toStringAsFixed(2)} €'),
                      );
                    },
                  ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Erreur: $e')),
          ),
        ),
      ],
    );
  }
}
