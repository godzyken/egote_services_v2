import 'package:egote_services_v2/features/chantier/domain/entities/phase.dart';
import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:flutter/material.dart';

class PhaseSummaryCard extends StatelessWidget {
  const PhaseSummaryCard({
    super.key,
    required this.phase,
    this.subtitle,
    this.onTap,
  });

  final Phase phase;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pct = phase.progressPercent;

    return Material(
      color: ChantierColors.card,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            boxShadow: ChantierColors.softShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phase.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: ChantierColors.muted,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${pct.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: ChantierColors.ink,
                      height: 1,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: ChantierColors.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.north_east_rounded,
                      size: 16,
                      color: ChantierColors.muted,
                    ),
                  ),
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: ChantierColors.muted,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
