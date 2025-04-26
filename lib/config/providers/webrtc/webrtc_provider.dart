import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:socket_io_client/socket_io_client.dart';

import '../../../features/chat/application/services/webrtc_signal_config_service.dart';
import '../../../features/common/domain/entities/states/webrtc_state.dart';

final webrtcProvider = Provider<webrtc.WebRTC>(
  (ref) => webrtc.WebRTC(),
);

class WebRTCNotifier extends StateNotifier<WebRTCState> {
  final Ref ref;
  WebRTCNotifier(this.ref) : super(WebRTCState.initializing()) {
    _initSignalling();
  }

  Future<void> _initSignalling() async {
    final signalling = ref.read(signallingServiceProvider);

    if (signalling.socket?.disconnected ?? true) {
      final websocketUrl = "WEB_SOCKET_SERVER_URL";
      final selfCallerID = Random().nextInt(999999).toString().padLeft(6, '0');

      signalling.init(websocketUrl: websocketUrl, selfCallerID: selfCallerID);
    }

    signalling.socket?.onConnect((data) {
      // Optionnel : tu peux déclencher un changement d’état ici si tu veux
    });
  }

  void setInitialized({
    required webrtc.RTCPeerConnection peerConnection,
    required webrtc.MediaStream localStream,
    required webrtc.RTCVideoRenderer localRenderer,
    required webrtc.RTCVideoRenderer remoteRenderer,
  }) {
    state = WebRTCState.initialized(
      peerConnection: peerConnection,
      localStream: localStream,
      localRenderer: localRenderer,
      remoteRenderer: remoteRenderer,
    );
  }

  void setError({required String errorMessage}) {
    state = WebRTCState.error(errorMessage: errorMessage);
  }
}
