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
    final theme = Theme.of(context);
    final percentLabel = progressPercent.toStringAsFixed(2);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Construction Progress',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '$percentLabel%',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF57C00),
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: (progressPercent / 100).clamp(0.0, 1.0),
              minHeight: 10,
              backgroundColor: const Color(0xFFFFE0B2),
              color: const Color(0xFFF57C00),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'End\n${plannedEnd.year}/${plannedEnd.month.toString().padLeft(2, '0')}/${plannedEnd.day.toString().padLeft(2, '0')}',
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Expanded(
                child: Text(
                  'Total\n$delayDays delay',
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: delayDays > 0 ? Colors.redAccent : null,
                    fontWeight: FontWeight.w600,
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
