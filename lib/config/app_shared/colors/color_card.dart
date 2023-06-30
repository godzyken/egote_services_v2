import 'dart:async';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../insets/app_insets.dart';
import 'copy_color_to_clipboard.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    this.shadowColor,
    this.size,
    this.elevation,
  });

  final String label;
  final Color color;
  final Color textColor;
  final Color? shadowColor;
  final Size? size;

  /// Defaults to 0 if not provided.
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final String materialName = ColorTools.materialName(color);
    final String nameThatColor = ColorTools.nameThatColor(color);
    final String space = materialName == '' ? '' : ' ';
    final MediaQueryData media = MediaQuery.of(context);
    final bool isPhone = media.size.width < AppInsets.phoneWidthBreakpoint ||
        media.size.height < AppInsets.phoneHeightBreakpoint;
    final double fontSize = isPhone ? 10 : 11;
    final Size effectiveSize =
        size ?? (isPhone ? const Size(74, 54) : const Size(86, 58));

    return SizedBox(
      width: effectiveSize.width,
      height: effectiveSize.height,
      child: Tooltip(
        waitDuration: const Duration(milliseconds: 700),
        message: 'Color #${color.hexCode} $nameThatColor$space$materialName.'
            '\nTap box to copy RGB value to Clipboard.',
        child: Card(
          elevation: elevation ?? 0,
          surfaceTintColor: Colors.transparent,
          shadowColor: shadowColor,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          color: color,
          child: InkWell(
            onTap: () {
              unawaited(copyColorToClipboard(context, color));
            },
            child: Center(
              child: Text(
                label,
                style: TextStyle(color: textColor, fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}