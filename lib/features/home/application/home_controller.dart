import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetWorkStatus { notDetermined, on, off }

class HomeControllerNotifier extends Notifier<NetWorkStatus> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  NetWorkStatus build() {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      NetWorkStatus newState = NetWorkStatus.off;

      if (event.contains(ConnectivityResult.none)) {
        newState = NetWorkStatus.off;
      } else if (event.contains(ConnectivityResult.other)) {
        newState = NetWorkStatus.notDetermined;
      } else if (event.isNotEmpty) {
        newState = NetWorkStatus.on;
      }

      if (newState != state) {
        state = newState;
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
