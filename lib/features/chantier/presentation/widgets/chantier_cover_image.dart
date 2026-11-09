import 'package:egote_services_v2/features/chantier/presentation/theme/chantier_colors.dart';
import 'package:flutter/material.dart';

/// Affiche une image de couverture chantier (idéalement un plan / dessinateur).
/// - chemin `assets/...` → asset local (WebP / PNG / JPG recommandés)
/// - URL http(s) → réseau
/// - null / erreur → placeholder
class ChantierCoverImage extends StatelessWidget {
  const ChantierCoverImage({super.key, this.imageUrl, this.fit = BoxFit.cover});

  final String? imageUrl;
  final BoxFit fit;

  bool get _isAsset =>
      imageUrl != null &&
      imageUrl!.isNotEmpty &&
      imageUrl!.startsWith('assets/');

  bool get _isNetwork =>
      imageUrl != null &&
      imageUrl!.isNotEmpty &&
      (imageUrl!.startsWith('http://') || imageUrl!.startsWith('https://'));

  @override
  Widget build(BuildContext context) {
    if (_isAsset) {
      return Image.asset(
        imageUrl!,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, __, ___) => const _CoverPlaceholder(),
      );
    }

    if (_isNetwork) {
      return Image.network(
        imageUrl!,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const _CoverPlaceholder(showLoader: true);
        },
        errorBuilder: (_, __, ___) => const _CoverPlaceholder(),
      );
    }

    return const _CoverPlaceholder();
  }
}

class _CoverPlaceholder extends StatelessWidget {
  const _CoverPlaceholder({this.showLoader = false});

  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFF8E1), Color(0xFFFFE0B2), Color(0xFFFFB74D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: showLoader
            ? const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: ChantierColors.orange,
                ),
              )
            : const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.architecture,
                    size: 56,
                    color: ChantierColors.orange,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Plan / dessinateur',
                    style: TextStyle(
                      color: ChantierColors.muted,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
