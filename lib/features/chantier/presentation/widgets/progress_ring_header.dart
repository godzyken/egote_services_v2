import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:flutter/material.dart';

class ProgressRingHeader extends StatelessWidget {
  const ProgressRingHeader({
    super.key,
    required this.progressPercent,
    required this.plannedEnd,
    required this.delayDays,
  });

  final double progressPercent;
  final DateTime plannedEnd;
  final int delayDays;

  @override
  Widget build(BuildContext context) {
    final pct = progressPercent.clamp(0, 100);
    final label = pct.toStringAsFixed(2);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
      decoration: BoxDecoration(
        color: ChantierColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: ChantierColors.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Construction\nProgress',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ChantierColors.ink,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ChantierColors.background,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: ChantierColors.muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            '$label%',
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: ChantierColors.ink,
              height: 1,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: SizedBox(
              height: 12,
              child: Stack(
                children: [
                  Container(color: ChantierColors.track),
                  FractionallySizedBox(
                    widthFactor: pct / 100,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ChantierColors.orangePale,
                            ChantierColors.orange,
                          ],
                        ),
                      ),
                    ),
                  ),
                  // marker
                  Align(
                    alignment: Alignment((pct / 50) - 1, 0),
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: ChantierColors.orange,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'End\n${plannedEnd.year}/${plannedEnd.month.toString().padLeft(2, '0')}/${plannedEnd.day.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: ChantierColors.muted,
                    fontSize: 13,
                    height: 1.35,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Total\n$delayDays delay',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: delayDays > 0
                        ? ChantierColors.delayed
                        : ChantierColors.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
