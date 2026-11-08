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
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(24),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onOpenPlan,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.apartment_rounded, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onOpenPlan,
                    icon: const Icon(Icons.calendar_month_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: imageUrl != null
                      ? Image.network(imageUrl!, fit: BoxFit.cover)
                      : Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFFE0B2), Color(0xFFFFCC80)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.foundation,
                              size: 64,
                              color: Color(0xFFF57C00),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
