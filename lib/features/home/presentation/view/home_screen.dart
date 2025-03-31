import 'dart:async';

import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/home/application/home_controller.dart';
import 'package:egote_services_v2/features/home/presentation/widget/godzylogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../gen/assets.gen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool animate = false;
  int index = 0;
  late final Timer _timer;
  late final ValueNotifier<int> _imageIndexNotifier;

  final imageWidgets = [
    Assets.lottie.image.maisonIndiv
        .image(key: const Key('1'), fit: BoxFit.scaleDown, height: 300),
    Assets.lottie.archive.amenagement.exterieur.piscines.piscineSussargue1
        .image(key: const Key('2'), fit: BoxFit.scaleDown, height: 300),
    Assets.lottie.image.appartement
        .image(key: const Key('3'), fit: BoxFit.scaleDown, height: 300),
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _imageIndexNotifier = ValueNotifier<int>(0);
    _startImageSwitching();
  }

  @override
  void dispose() {
    _timer.cancel();
    _imageIndexNotifier.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _imageIndexNotifier.value =
          (_imageIndexNotifier.value + 1) % imageWidgets.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var network = ref.watch(networkAwareProvider);
    if (network == NetWorkStatus.off) {
      return _buildNoNetwork();
    }
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: _buildAppBar(context, network),
      body: Stack(
        children: [
          _buildAnimatedImage(),
          _buildLogo(),
          _buildSwipeGestureDetector(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildNoNetwork() {
    return Center(
      child: Text('${context.tr?.noNetwork}'),
    );
  }

  AppBar _buildAppBar(BuildContext context, NetWorkStatus network) {
    return AppBar(
      title: Text(
        '${context.tr!.home} $network',
        style: const TextStyle(color: Colors.black54),
      ),
      titleSpacing: 0.0,
      centerTitle: true,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      elevation: 50.00,
      backgroundColor: Colors.greenAccent[400],
      actions: [
        _buildAppBarAction(
          icon: Icons.comment,
          onPressed: () => _onCommentPressed(),
        ),
        _buildAppBarAction(
          icon: Icons.settings,
          onPressed: () => _onSettingsPressed(),
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  IconButton _buildAppBarAction(
      {required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        // Ajout d'un breadcrumb à chaque clic
        Sentry.addBreadcrumb(
          Breadcrumb(
            message: 'Bouton cliqué',
            level: SentryLevel.info,
            data: {'button': 'avis'},
          ),
        );
        onPressed();
      },
    );
  }

  void _onCommentPressed() {
    if (context.mounted) {
      context.goNamed('avisRoute', pathParameters: {'avisId': '123'});
    }
  }

  void _onSettingsPressed() {
    if (context.mounted) {
      context.goNamed('settingsRoute');
    }
  }

  Widget _buildAnimatedImage() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1600),
      top: animate ? 0 : -80,
      left: animate ? 0 : -80,
      curve: Curves.elasticInOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1600),
        opacity: animate ? 1 : 0,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 5000),
          reverseDuration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          switchInCurve: Curves.decelerate,
          switchOutCurve: Curves.elasticOut,
          child: ValueListenableBuilder<int>(
            valueListenable: _imageIndexNotifier,
            builder: (context, value, _) {
              return imageWidgets[value];
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1600),
      bottom: animate ? 0 : -10,
      left: animate ? 0 : -30,
      curve: Curves.fastLinearToSlowEaseIn,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 1600),
        opacity: animate ? 1 : 0,
        child: Assets.lottie.image.logoBatServices.image(
          width: 250,
          height: 250,
        ),
      ),
    );
  }

  Widget _buildSwipeGestureDetector() {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          setState(() {
            _imageIndexNotifier.value =
                (_imageIndexNotifier.value + 1) % imageWidgets.length;
          });
          Future.delayed(const Duration(milliseconds: 1600), () {
            if (mounted) {
              context.goNamed('userList');
            }
          });
        }
      },
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton.small(
      onPressed: () => context.goNamed('godzyRoute'),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        clipBehavior: Clip.hardEdge,
        child: const Godzylogo(),
      ),
    );
  }
}
