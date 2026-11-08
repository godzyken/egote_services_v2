import 'package:egote_services_v2/features/chantier/domain/entities/phase.dart';
import 'package:flutter/material.dart';

class PhaseSummaryCard extends StatelessWidget {
  const PhaseSummaryCard({
    super.key,
    required this.phase,
    this.onTap,
  });

  final Phase phase;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pct = phase.progressPercent;

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phase.name,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${pct.toStringAsFixed(0)}%',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF57C00),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.north_east_rounded,
                  size: 18,
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
