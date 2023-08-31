
import 'package:egote_services_v2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class DrawingPage extends ConsumerStatefulWidget {
  const DrawingPage({super.key});

  @override
  ConsumerState<DrawingPage> createState() => _DrawingPageState();
}

class _DrawingPageState extends ConsumerState<DrawingPage> {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _composition = AssetLottie(Assets.lottie.models.lottieLogo1).load();
    //_composition = AssetLottie('assets/lottie/models/LottieLogo1.json').load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _composition, builder: (context, snapshot) {
      var composition = snapshot.data;
      if (composition != null) {
        return Lottie(composition: composition);
      } else {
        return const Center(child: CircularProgressIndicator(),);
      }
    },);
  }
}

