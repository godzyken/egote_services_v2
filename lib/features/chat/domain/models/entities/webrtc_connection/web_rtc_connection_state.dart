import 'dart:math';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/chat/domain/models/entities/webrtc_connection/webrtc_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

class WebRTCState {
  final RTCPeerConnection? peerConnection;
  final MediaStream? localStream;
  final RTCVideoRenderer? localRenderer;
  final RTCVideoRenderer? remoteRenderer;

  WebRTCState(
      {this.peerConnection,
      this.localStream,
      required this.localRenderer,
      required this.remoteRenderer});
}

final webRTCStateProvider = Provider<WebRTCState>((ref) {
  final service = ref.watch(signallingServiceProvider);

  if (service.socket!.disconnected) {
    final String websocketUrl = "WEB_SOCKET_SERVER_URL";

    // generate callerID of local user
    final String selfCallerID =
        Random().nextInt(999999).toString().padLeft(6, '0');

    service.init(websocketUrl: websocketUrl, selfCallerID: selfCallerID);

    service.socket?.connected;
  } else if (service.socket!.connected) {
    service.socket?.onConnect(
      (data) => AsyncValue.data(data),
    );
  }

  final remote = ref.state.remoteRenderer;
  final localRenderer = ref.state.localRenderer;

  return WebRTCState(localRenderer: localRenderer, remoteRenderer: remote);
});

class WebRTCVideoState {
  final RTCVideoRenderer localRenderer;
  final RTCVideoRenderer remoteRenderer;
  final RTCPeerConnection? peerConnection;
  final bool isConnected;

  WebRTCVideoState({
    required this.localRenderer,
    required this.remoteRenderer,
    this.peerConnection,
    this.isConnected = false,
  });

  WebRTCVideoState copyWith({
    RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
    RTCPeerConnection? peerConnection,
    bool? isConnected,
  }) {
    return WebRTCVideoState(
      localRenderer: localRenderer ?? this.localRenderer,
      remoteRenderer: remoteRenderer ?? this.remoteRenderer,
      peerConnection: peerConnection ?? this.peerConnection,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}

final webRTCVideoSateProvider = Provider<WebRTCVideoState>((ref) {
  final RTCVideoRenderer? localRenderer =
      ref.watch(webRTCStateProvider).localRenderer;
  final RTCVideoRenderer? remoteRenderer =
      ref.watch(webRTCStateProvider).remoteRenderer;
  return WebRTCVideoState(
      localRenderer: localRenderer!, remoteRenderer: remoteRenderer!);
});
