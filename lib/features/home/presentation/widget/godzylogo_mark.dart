import 'package:flutter/material.dart';

import '../../../../config/app_shared/images/list_local.dart';

class GodzyLogoMark extends StatelessWidget {
  const GodzyLogoMark({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        LocalImages.godzyLogo,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
