import 'dart:async';

import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/features/home/application/home_controller.dart';
import 'package:egote_services_v2/features/home/presentation/widget/godzylogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';



class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  bool animate = false;

  int index = 0;
  late Timer _timer;

  final imageWidgets = [
    const Image(image: AssetImage(LocalImages.maisonIndiv), key: Key('1'), fit: BoxFit.scaleDown, height: 300),
    const Image(image: AssetImage(LocalImages.swimmingPoolSussargue), key: Key('2'), fit: BoxFit.scaleDown, height: 300),
    const Image(image: AssetImage(LocalImages.apartmentPng), key: Key('3'), fit: BoxFit.scaleDown, height: 300),
  ];

  @override
  void initState() {
    super.initState();
    startAnimation();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        index = (index + 1) % imageWidgets.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var network = ref.watch(networkAwareProvider);
      if (network == NetWorkStatus.off) {
        return const Center(
          child: Text("No network"),
        );
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(
          'Home $network',
          style: const TextStyle(color: Colors.black54),
        ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 50.00,
          backgroundColor: Colors.greenAccent[400],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () => context.go('/avisRoute'),
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () => context.go('/settingsRoute'),
            ), //IconButton
          ],
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () { },
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                 //onEnd: () => context.go('/authRoute'),
                 //onEnd: () => context.goNamed('mfaList'),
                onEnd: () => context.goNamed('chat'),
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
                      child: imageWidgets[index],
                    ),
                )),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                bottom: animate ? 0 : -10,
                left: animate ? 0 : -30,
                curve: Curves.fastLinearToSlowEaseIn,
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 1600),
                    opacity: animate ? 1 : 0,
                    child: const Image(
                        width: 250,
                        height: 250,
                        image: AssetImage(LocalImages.logoBatServices)
                    ))),
            // GestureDetector(
            //     onHorizontalDragEnd: (details) => context.goNamed('userList'),
            //     child: child
            // ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.go('/godzyRoute'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              clipBehavior: Clip.hardEdge,
              child: const Godzylogo(),
            )),
      );
    });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 5000));
  }
}
