import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart' as web_r_t_c;
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/entities/webrtc_connection/web_rtc_connection_state.dart';

class WebRTCStateNotifier extends StateNotifier<WebRTCState> {
  WebRTCStateNotifier(this.peerConnection, this._ref)
      : super(WebRTCState.initialized);

  final Ref _ref;
  final RTCPeerConnection peerConnection;

  // Initialize WebRTC state and setup peer connection
  Future<void> initialize() async {
    final webRTCState = _ref.read(webRTCStateProvider);
    final localRenderer = webRTCState.localRenderer;
    final remoteRenderer = webRTCState.remoteRenderer;
    final localStream = webRTCState.localStream;
    final iceState = webRTCState.iceState;
    final status = webRTCState.status;
    final errorMessage = webRTCState.errorMessage;

    state = WebRTCState(
      peerConnection: peerConnection,
      localRenderer: localRenderer,
      remoteRenderer: remoteRenderer,
      status: status,
      errorMessage: errorMessage,
      iceState: iceState,
      localStream: localStream,
    );

    final webRTCVideoState = _ref.read(webRTCVideoSateProvider);

    state = WebRTCState.initialized;

    // Initialize the renderers
    await localRenderer?.initialize();
    await remoteRenderer?.initialize();

    state =
        WebRTCState.iceConnectionState(iceState: webRTCVideoState.toString());

    return await Future.delayed(
        Duration(seconds: 1), () => web_r_t_c.WebRTC.initialized);
  }

  Future<void> createPeerConnection(Map<String, dynamic> configuration) async {
    final pc = await web_r_t_c.createPeerConnection(configuration);

    final localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    // Add local stream to the peer connection
    localStream.getTracks().forEach((track) {
      pc.addTrack(track, localStream);
      pc.setConfiguration(configuration);
      pc.onTrack = (event) {
        event.streams[0].getTracks().forEach((track) {
          track.onEnded = () {
            if (kDebugMode) {
              developer.log('Track ended');
            }
            // Handle track end event
          };
        });
      };
    });

    final webRTCVideoState = _ref.read(webRTCVideoSateProvider);

    state = WebRTCState(
      peerConnection: pc,
      localStream: localStream,
      localRenderer: webRTCVideoState.localRenderer,
      remoteRenderer: webRTCVideoState.remoteRenderer,
      status: '',
      errorMessage: '',
      iceState: '',
    );
  }
}

// WebRTC Video State Notifier
class WebRTCVideoStateNotifier extends StateNotifier<WebRTCVideoState> {
  WebRTCVideoStateNotifier(this.renderer, this.remoteRenderer)
      : super(WebRTCVideoState(
            localRenderer: renderer, remoteRenderer: remoteRenderer));

  final RTCVideoRenderer renderer;
  final RTCVideoRenderer remoteRenderer;

  RTCPeerConnection? peerConnection;

  Future<void> initialize() async {
    final localRenderer = RTCVideoRenderer();
    final remoteRenderer = RTCVideoRenderer();
    await localRenderer.initialize();
    await remoteRenderer.initialize();

    state = state.copyWith(
        localRenderer: localRenderer, remoteRenderer: remoteRenderer);
  }

  void disposeRenderer() {
    state.localRenderer.dispose();
    state = state.copyWith(
        isConnected: false, // Add condition based on your logic
        localRenderer: renderer,
        peerConnection: peerConnection,
        remoteRenderer: remoteRenderer);
    state.peerConnection?.dispose();
  }

  void updateWebRTCVideoState(WebRTCVideoState newState) {
    state = newState;
  }
}

// WebRTC StateNotifier for Peer Connection
class WebRTCPeerConnectionStateNotifier
    extends StateNotifier<RTCPeerConnection?> {
  WebRTCPeerConnectionStateNotifier() : super(null);

  void updateWebRTCState(RTCPeerConnection newState) {
    state = newState;
  }

  void disposeWebRTCState() {
    state?.dispose();
    state = null;
  }
}
