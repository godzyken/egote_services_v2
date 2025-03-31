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

  final String status;
  final String errorMessage;
  final String iceState;

  WebRTCState({
    required this.status,
    required this.peerConnection,
    required this.localStream,
    required this.errorMessage,
    required this.iceState,
    required this.localRenderer,
    required this.remoteRenderer,
  });
  const WebRTCState._(this.status, this.peerConnection, this.localStream,
      this.errorMessage, this.iceState,
      {required this.localRenderer, required this.remoteRenderer});

  // States for WebRTC initialization
  static const initializing = WebRTCState._(
      'initializing', null, null, 'null', 'null',
      localRenderer: null, remoteRenderer: null);
  static const initialized = WebRTCState._(
      'initialized', null, null, 'null', 'null',
      localRenderer: null, remoteRenderer: null);

  static WebRTCState error({required String errorMessage}) =>
      WebRTCState.error(errorMessage: errorMessage);

  static WebRTCState iceConnectionState({required String iceState}) =>
      WebRTCState.iceConnectionState(iceState: iceState);
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
  final status = ref.state.status;
  final iceState = ref.state.iceState;
  final peerConnection = ref.state.peerConnection;
  final localStream = ref.state.localStream;
  final errorMessage = ref.state.errorMessage;

  return WebRTCState._(
      status, peerConnection, localStream, errorMessage, iceState,
      localRenderer: localRenderer, remoteRenderer: remote);
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
