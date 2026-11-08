import 'package:egote_services_v2/features/chantier/domain/entities/lot.dart';
import 'package:flutter/material.dart';

class LotProgressTile extends StatelessWidget {
  const LotProgressTile({super.key, required this.lot});

  final Lot lot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pct = lot.progressPercent.clamp(0, 100);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE0B2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.add, color: Color(0xFFF57C00)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lot.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (lot.plannedStart != null && lot.plannedEnd != null)
                  Text(
                    _rangeLabel(lot.plannedStart!, lot.plannedEnd!),
                    style: theme.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 48,
            height: 48,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: pct / 100,
                  strokeWidth: 4,
                  backgroundColor: const Color(0xFFFFE0B2),
                  color: const Color(0xFFF57C00),
                ),
                Text(
                  '${pct.toStringAsFixed(0)}%',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _rangeLabel(DateTime start, DateTime end) {
    String fmt(DateTime d) =>
        '${_month(d.month)} ${d.year}';
    return '${fmt(start)} – ${fmt(end)}';
  }

  String _month(int m) {
    const names = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return names[m - 1];
  }
}
