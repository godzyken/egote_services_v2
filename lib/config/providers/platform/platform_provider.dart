import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlatformNotifier extends Notifier<TargetPlatform> {
  @override
  TargetPlatform build() {
    return defaultTargetPlatform;
  }

  void setPlatform(TargetPlatform platform) {
    state = platform;
  }

  void resetPlatform() {
    state = defaultTargetPlatform;
  }

  void togglePlatform() {
    if (state == TargetPlatform.android) {
      state = TargetPlatform.iOS;
    } else if (state == TargetPlatform.iOS) {
      state = TargetPlatform.android;
    }
  }
}

final platformNotifierProvider =
NotifierProvider<PlatformNotifier, TargetPlatform>(
  PlatformNotifier.new,
  name: 'platformNotifierProvider',
);