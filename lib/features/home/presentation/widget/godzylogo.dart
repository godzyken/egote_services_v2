import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Godzylogo extends ConsumerWidget {
  const Godzylogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: ExactAssetImage(LocalImages.godzyLogo),
            fit: BoxFit.fill)
          ),
        ),
      ),
    );
  }

}