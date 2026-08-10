
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
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Drawing Page (Lottie asset missing)'));
  }
}

