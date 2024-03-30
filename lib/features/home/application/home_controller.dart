import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetWorkStatus { notDetermined, on, off }

class HomeControllerNotifier extends StateNotifier<NetWorkStatus> {
  HomeControllerNotifier() : super(NetWorkStatus.notDetermined) {
    lastResult = NetWorkStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen((event) {
      NetWorkStatus? newState;

      switch (event) {
        case ConnectivityResult.bluetooth:
          newState = NetWorkStatus.on;
          // TODO: Handle this case.
          break;
        case ConnectivityResult.wifi:
          newState = NetWorkStatus.on;
          // TODO: Handle this case.
          break;
        case ConnectivityResult.ethernet:
          newState = NetWorkStatus.on;
          // TODO: Handle this case.
          break;
        case ConnectivityResult.mobile:
          newState = NetWorkStatus.on;
          // TODO: Handle this case.
          break;
        case ConnectivityResult.none:
          newState = NetWorkStatus.off;
          // TODO: Handle this case.
          break;
        case ConnectivityResult.vpn:
          newState = NetWorkStatus.on;
          // TODO: Handle this case.
          break;
        case ConnectivityResult.other:
          newState = NetWorkStatus.notDetermined;
          // TODO: Handle this case.
          break;
      }

      if (newState != state) {
        state = newState!;
      }
    });
  }

  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();
  late NetWorkStatus lastResult;
}

final networkAwareProvider =
    StateNotifierProvider<HomeControllerNotifier, NetWorkStatus>(
        (ref) => HomeControllerNotifier(),
        name: "Network aware provider state determine network status");
