import 'package:flutter/material.dart';

/// Palette inspirée de l'UI Buildexa (suivi chantier).
abstract final class ChantierColors {
  static const background = Color(0xFFF3F1EC);
  static const card = Color(0xFFFFFFFF);
  static const orange = Color(0xFFF57C00);
  static const orangeSoft = Color(0xFFFFB74D);
  static const orangePale = Color(0xFFFFE0B2);
  static const orangeDeep = Color(0xFFE65100);
  static const ink = Color(0xFF1C1B1A);
  static const muted = Color(0xFF6B6A67);
  static const delayed = Color(0xFFFF6D00);
  static const remain = Color(0xFFB0AFA9);
  static const track = Color(0xFFE8E4DB);

  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];
}
