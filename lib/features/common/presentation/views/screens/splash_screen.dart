import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/home/presentation/widget/animated_slides_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/services/app_init_service.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen(
      {super.key,
      required this.images,
      this.duration = const Duration(milliseconds: 1000),
      this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder});
  static const String routeName = 'splash';
  static const String routePath = '/splash';
  final List<Widget> images;
  final Duration duration;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initState = ref.watch(appInitServiceProvider);

    return Scaffold(
      body: Center(
        child: initState.when(
          loading: () => AnimatedSlidesShow(
            key: const ValueKey('slideshow'),
            images: images,
            enableAnimation: true,
            showProgressIndicator: true,
            onSlideChange: (index) => _onSlideChanged(index, context),
          ),
          error: (error, stack) =>
              ErrorScreen(error: 'Erreur de démarrage : $error'),
          data: (_) {
            Future.microtask(() {
              if (context.mounted) context.goNamed('home');
            });
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _onSlideChanged(int index, BuildContext context) {
    const Duration duration = Duration(milliseconds: 500);

    // Tu peux afficher un texte, logger, ou mettre un effet.
    debugPrint('Slide actif : $index');
    if (index == images.length - 1) {
      Future.delayed(duration, () {
        if (context.mounted) context.goNamed('home');
      });
    }
  }
}
