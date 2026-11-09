import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:egote_services_v2/features/chantier/presentation/widgets/chantier_cover_image.dart';
import 'package:flutter/material.dart';

class BuildingHeroCard extends StatelessWidget {
  const BuildingHeroCard({
    super.key,
    required this.title,
    this.imageUrl,
    this.onOpenPlan,
  });

  final String title;
  final String? imageUrl;
  final VoidCallback? onOpenPlan;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ChantierColors.card,
      borderRadius: BorderRadius.circular(28),
      elevation: 0,
      shadowColor: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onOpenPlan,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: ChantierColors.softShadow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ChantierColors.orangePale.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.apartment_rounded,
                        size: 18,
                        color: ChantierColors.orange,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: ChantierColors.ink,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onOpenPlan,
                      style: IconButton.styleFrom(
                        backgroundColor: ChantierColors.background,
                      ),
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: ChantierColors.muted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 16 / 11,
                    child: ChantierCoverImage(imageUrl: imageUrl),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
