import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetWorkStatus { notDetermined, on, off }

class HomeControllerNotifier extends StateNotifier<NetWorkStatus> {
  HomeControllerNotifier() : super(NetWorkStatus.notDetermined) {
    lastResult = NetWorkStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen((event) {
      for (var i in event) {
        if (i == ConnectivityResult.none) {
          lastResult = NetWorkStatus.off;
        } else {
          lastResult = NetWorkStatus.on;
        }
        state = lastResult;
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
