import 'package:flutter/material.dart';

import '../../../chantier/presentation/theme/chantier_colors.dart';

class ComptaFinanceScreen extends StatelessWidget {
  const ComptaFinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final invoices = [
      InvoiceItem(
        ref: 'FAC-2026-089',
        client: 'M. Dupont (Montauban)',
        amountTtc: '10 140,00 €',
        status: 'Payée',
        statusColor: Colors.green,
        date: '12 Nov 2026',
      ),
      InvoiceItem(
        ref: 'FAC-2026-090',
        client: 'Mme Martin (Grisolles)',
        amountTtc: '7 440,00 €',
        status: 'En attente',
        statusColor: ChantierColors.orange,
        date: '14 Nov 2026',
      ),
      InvoiceItem(
        ref: 'FAC-2026-091',
        client: 'SARL Techno (Castelsarrasin)',
        amountTtc: '5 760,00 €',
        status: 'Acompte versé',
        statusColor: Colors.blue,
        date: '15 Nov 2026',
      ),
    ];

    return Scaffold(
      backgroundColor: ChantierColors.background,
      appBar: AppBar(
        title: const Text(
          'Compta4me — Finances & Trésorerie',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: ChantierColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            tooltip: 'Nouvelle Facture',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Création de facture / devis Compta4me'),
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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: ChantierColors.softShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chiffre d’affaires encaissé (Novembre)',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '23 340,00 €',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _FinanceBadge(label: 'TVA collectée : 3 890 €'),
                    const SizedBox(width: 12),
                    _FinanceBadge(label: 'Marge moyenne : 34%'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Facturation & Règlements Chantiers',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 12),
          ...invoices.map(
            (inv) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ChantierColors.card,
                borderRadius: BorderRadius.circular(18),
                boxShadow: ChantierColors.softShadow,
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: inv.statusColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.receipt_long_rounded,
                      color: inv.statusColor,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              inv.ref,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              inv.amountTtc,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          inv.client,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              inv.date,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: inv.statusColor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                inv.status,
                                style: TextStyle(
                                  color: inv.statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class InvoiceItem {
  final String ref;
  final String client;
  final String amountTtc;
  final String status;
  final Color statusColor;
  final String date;

  InvoiceItem({
    required this.ref,
    required this.client,
    required this.amountTtc,
    required this.status,
    required this.statusColor,
    required this.date,
  });
}

class _FinanceBadge extends StatelessWidget {
  final String label;

  const _FinanceBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
