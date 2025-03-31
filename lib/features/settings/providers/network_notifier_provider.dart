import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// État qui représente la connectivité réseau
enum NetworkStatus { connected, disconnected }

// StateNotifier pour gérer l'état de la connectivité
class NetworkNotifier extends StateNotifier<NetworkStatus> {
  final Connectivity _connectivity;

  NetworkNotifier(this._connectivity) : super(NetworkStatus.disconnected) {
    _init();
  }

  // Initialisation : vérifie la connectivité initiale et écoute les changements
  Future<void> _init() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    state = _mapConnectivityResultToNetworkStatus(connectivityResult.single);

    // Écoute les changements de connectivité
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      state = _mapConnectivityResultToNetworkStatus(result.single);
    });
  }

  // Mapper ConnectivityResult en NetworkStatus
  NetworkStatus _mapConnectivityResultToNetworkStatus(
      ConnectivityResult result) {
    return result == ConnectivityResult.none
        ? NetworkStatus.disconnected
        : NetworkStatus.connected;
  }
}

// Provider pour accéder à l'état de la connectivité
final networkProvider =
    StateNotifierProvider<NetworkNotifier, NetworkStatus>((ref) {
  return NetworkNotifier(Connectivity());
});
