import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<List<ConnectivityResult>> get connectivityStatus async {
    return await _connectivity.checkConnectivity();
  }

  Stream<List<ConnectivityResult>> get connectivityStream {
    return _connectivity.onConnectivityChanged;
  }
}

class ConnectivityNotifier extends StateNotifier<List<ConnectivityResult>> {
  ConnectivityNotifier(this._connectivityService) : super(List.empty()) {
    _initialize();
  }

  final ConnectivityService _connectivityService;

  Future<void> _initialize() async {
    await startListening();
  }

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Future<void> startListening() async {
    _subscription = _connectivityService.connectivityStream.listen((results) {
      state = results;
    });
  }

  Future<void> checkConnectivity() async {
    state = await _connectivityService.connectivityStream.single;
  }

  Future<void> stopListening() async {
    await _subscription?.cancel();
  }

  StreamSubscription<List<ConnectivityResult>>? get subscription =>
      _subscription;

  List<ConnectivityResult> get results => state;

  ConnectivityResult get result => state.first;
}

final connectivityProviders =
    StateNotifierProvider<ConnectivityNotifier, List<ConnectivityResult>>(
  (ref) {
    final connectivityService = ConnectivityService();
    return ConnectivityNotifier(connectivityService);
  },
);

enum ConnectivityStatus {
  online,
  offline,
}

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  StreamSubscription<List<ConnectivityResult>>? get subscription =>
      _subscription;

  ConnectivityStatusNotifier() : super(ConnectivityStatus.offline) {
    initialize();
  }

  Future<void> initialize() async {
    try {
      _subscription = Connectivity().onConnectivityChanged.listen((results) {
        state = results.first == ConnectivityResult.none
            ? ConnectivityStatus.offline
            : ConnectivityStatus.online;
      });
    } on PlatformException catch (e) {
      developer.log('Erreur lors de la vérification de la connexion: $e');
      state = ConnectivityStatus.offline;
    }
  }

  @override
  bool updateShouldNotify(ConnectivityStatus old, ConnectivityStatus current) {
    if (old == current) {
      return false;
    }
    return super.updateShouldNotify(old, current);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final connectivityStatusProviders =
    StateNotifierProvider<ConnectivityStatusNotifier, ConnectivityStatus>(
        (ref) => ConnectivityStatusNotifier());
