import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetWorkStatus { notDetermined, on, off }

class HomeControllerNotifier extends Notifier<NetWorkStatus> {
  late StreamSubscription<ConnectivityResult> _subscription;

  @override
  NetWorkStatus build() {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      NetWorkStatus? newState;

      switch (event) {
        case ConnectivityResult.bluetooth:
          newState = NetWorkStatus.on;
          break;
        case ConnectivityResult.wifi:
          newState = NetWorkStatus.on;
          break;
        case ConnectivityResult.ethernet:
          newState = NetWorkStatus.on;
          break;
        case ConnectivityResult.mobile:
          newState = NetWorkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetWorkStatus.off;
          break;
        case ConnectivityResult.vpn:
          newState = NetWorkStatus.on;
          break;
        case ConnectivityResult.other:
          newState = NetWorkStatus.notDetermined;
          break;
      }

      if (newState != state) {
        state = newState!;
      }
    });

    ref.onDispose(() {
      _subscription.cancel();
    });

    return NetWorkStatus.notDetermined;
  }
}

final networkAwareProvider = NotifierProvider<HomeControllerNotifier, NetWorkStatus>(
  () => HomeControllerNotifier(),
);
