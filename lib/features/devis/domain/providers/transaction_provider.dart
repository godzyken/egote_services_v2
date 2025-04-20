import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:egote_services_v2/features/devis/domain/entities/transactions/produit_transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../config/providers/supabase/supabase_providers.dart';

class TransactionHistoryNotifier
    extends AsyncNotifier<List<ProduitTransaction>> {
  List<ProduitTransaction> _allTransactions = [];

  @override
  FutureOr<List<ProduitTransaction>> build() async {
    _allTransactions = await _loadFromSupabase();
    return _allTransactions;
  }

  Future<List<ProduitTransaction>> _loadFromSupabase() async {
    final client = ref.read(supabaseClientProvider);
    final response = await client
        .from('transactions')
        .select()
        .order('created_at', ascending: false);

    return (response as List<dynamic>)
        .map((json) => ProduitTransaction.fromJson(json))
        .toList();
  }

  Future<List<ProduitTransaction>> loadFromLocal() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/produit_logs.jsonl');
      if (!await file.exists()) {
        return [];
      }

      final lines = await file.readAsLines();

      return lines
          .map((line) => ProduitTransaction.fromJson(jsonDecode(line)))
          .toList();
    } catch (e) {
      developer.log('Erreur lors du chargement des transactions locales: $e');
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      _allTransactions = await _loadFromSupabase();
      state = AsyncValue.data(_allTransactions);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void filterByProductName(String name) {
    final filtered = _allTransactions.where((tx) {
      return tx.produit.name.toLowerCase().contains(name.toLowerCase());
    }).toList();

    state = AsyncValue.data(filtered);
  }

  void filterByDateRange(DateTime start, DateTime end) {
    final filtered = _allTransactions.where((tx) {
      final txDate = DateTime.parse(tx.timestamp);
      return txDate.isAfter(start) && txDate.isBefore(end);
    }).toList();

    state = AsyncValue.data(filtered);
  }

  void resetFilters() {
    state = AsyncValue.data(_allTransactions);
  }
}

final transactionHistoryNotifierProvider =
    AsyncNotifierProvider<TransactionHistoryNotifier, List<ProduitTransaction>>(
  () => TransactionHistoryNotifier(),
);
