import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_engine/math/math.dart' as math;

class Godzylogo extends ConsumerWidget {
  const Godzylogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(LocalImages.godzyLogo),
                  fit: BoxFit.fill)),
          child: Transform(
            transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFFE8581C),
              child: Text('$count'),
            ),
          ),
        ),
      ),
    );
  }
}
