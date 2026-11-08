import 'package:egote_services_v2/features/chantier/domain/entities/lot.dart';
import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:flutter/material.dart';

class LotProgressTile extends StatelessWidget {
  const LotProgressTile({super.key, required this.lot});

  final Lot lot;

  @override
  Widget build(BuildContext context) {
    final pct = lot.progressPercent.clamp(0, 100);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: ChantierColors.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: ChantierColors.softShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: ChantierColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.add, color: ChantierColors.muted, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lot.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: ChantierColors.ink,
                  ),
                ),
                if (lot.plannedStart != null && lot.plannedEnd != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      _rangeLabel(lot.plannedStart!, lot.plannedEnd!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: ChantierColors.muted,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 52,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(
                    value: pct / 100,
                    strokeWidth: 4.5,
                    backgroundColor: ChantierColors.track,
                    color: ChantierColors.orange,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(
                  '${pct.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: ChantierColors.ink,
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
    return '${_month(start.month)} ${start.year} – ${_month(end.month)} ${end.year}';
  }

  String _month(int m) {
    const names = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return names[m - 1];
  }
}
