import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedSlidesShow extends ConsumerStatefulWidget {
  final List<Widget> images;
  final Duration switchDuration;
  final Duration transitionDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final bool enableAnimation;
  final bool enableSwipe;
  final bool showProgressIndicator; // Option to show the progress indicator
  final void Function(int index)? onSlideChange;

  const AnimatedSlidesShow({
    super.key,
    required this.images,
    this.switchDuration = const Duration(milliseconds: 1600),
    this.transitionDuration = const Duration(milliseconds: 5000),
    this.switchInCurve = Curves.easeIn,
    this.switchOutCurve = Curves.elasticOut,
    this.enableAnimation = true,
    this.enableSwipe = true,
    this.showProgressIndicator = true, // Default is true
    this.onSlideChange,
  });

  @override
  ConsumerState createState() => _AnimatedSlidesShowState();
}

class _AnimatedSlidesShowState extends ConsumerState<AnimatedSlidesShow> {
  late Timer _timer;
  late ValueNotifier<int> _imageIndexNotifier;
  bool animate = false;

  @override
  void initState() {
    super.initState();
    _imageIndexNotifier = ValueNotifier<int>(0);
    _startSlideshow();
    _startEntranceAnimation();
  }

  void _startSlideshow() {
    _timer = Timer.periodic(widget.switchDuration, (_) {
      _nextImage();
    });
  }

  void _nextImage() {
    final newIndex = (_imageIndexNotifier.value + 1) % widget.images.length;
    _imageIndexNotifier.value = newIndex;
    widget.onSlideChange?.call(newIndex); // Trigger callback
  }

  void _prevImage() {
    final newIndex = (_imageIndexNotifier.value - 1 + widget.images.length) %
        widget.images.length;
    _imageIndexNotifier.value = newIndex;
    widget.onSlideChange?.call(newIndex); // Trigger callback
  }

  void _startEntranceAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
  }

  @override
  void dispose() {
    _timer.cancel();
    _imageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slideshow = ValueListenableBuilder<int>(
      valueListenable: _imageIndexNotifier,
      builder: (context, index, _) {
        return AnimatedSwitcher(
          duration: widget.transitionDuration,
          switchInCurve: widget.switchInCurve,
          switchOutCurve: widget.switchOutCurve,
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: widget.images[index],
        );
      },
    );

    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1600),
          top: animate ? 0 : -80,
          left: animate ? 0 : -80,
          curve: Curves.elasticInOut,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1600),
            opacity: animate ? 1 : 0,
            child: widget.enableSwipe
                ? GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! < 0) {
                        _nextImage();
                      } else {
                        _prevImage();
                      }
                    },
                    child: slideshow,
                  )
                : slideshow,
          ),
        ),
        if (widget.showProgressIndicator)
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: _imageIndexNotifier.value == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _imageIndexNotifier.value == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}
