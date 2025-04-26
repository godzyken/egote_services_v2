import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart' as web_r_t_c;
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/domain/entities/states/webrtc_state.dart';
import '../../../common/domain/entities/states/webrtc_video_state.dart';
import 'call_service_provider.dart';

class WebRTCStateNotifier extends StateNotifier<WebRTCState> {
  final Ref _ref;
  WebRTCStateNotifier(this._ref) : super(const WebRTCState.initializing());

  // Initialize WebRTC state and setup peer connection
  Future<void> initialize() async {
    try {
      final localRenderer = RTCVideoRenderer();
      final remoteRenderer = RTCVideoRenderer();

      await localRenderer.initialize();
      await remoteRenderer.initialize();

      final peerConnection = await web_r_t_c.createPeerConnection({
        'iceServers': [
          {'urls': 'stun:stun.l.google.com:19302'},
        ],
      });

      final localStream = await navigator.mediaDevices.getUserMedia({
        'audio': true,
        'video': true,
      });

      for (var track in localStream.getTracks()) {
        peerConnection.addTrack(track, localStream);
      }

      peerConnection.onIceConnectionState = (stateICE) {
        updateIceState(stateICE.toString());
      };

      peerConnection.onTrack = (event) {
        remoteRenderer.srcObject = event.streams.first;
      };

      localRenderer.srcObject = localStream;

      state = WebRTCState.initialized(
          peerConnection: peerConnection,
          localStream: localStream,
          localRenderer: localRenderer,
          remoteRenderer: remoteRenderer);
    } catch (e, s) {
      state = WebRTCState.error(errorMessage: e.toString());
      if (kDebugMode) {
        developer.log('Error initializing WebRTC: $e', stackTrace: s);
      }
    }
  }

  void updateIceState(String newState) {
    state = state.maybeWhen(
      initialized: (pc, stream, local, remote, iceState) =>
          WebRTCState.initialized(
        peerConnection: pc,
        localStream: stream,
        localRenderer: local,
        remoteRenderer: remote,
        iceState: newState,
      ),
      orElse: () => state,
    );
  }

  Future<void> makeCall(List<int> opponents) async {
    final callService = _ref.read(callServiceProvider);

    await callService.initSession(opponents);
    callService.listenToCallEvents(onLocalStream: (stream) async {
      final renderer = RTCVideoRenderer();
      await renderer.initialize();
      renderer.srcObject = stream;
      state = state.maybeWhen(
          initialized: (pc, _, __, remote, ice) => WebRTCState.initialized(
                peerConnection: pc,
                localStream: stream,
                localRenderer: renderer,
                remoteRenderer: remote,
                iceState: ice,
              ),
          orElse: () => state);
    }, onRemoteStream: (remoteStream) async {
      final renderer = RTCVideoRenderer();
      await renderer.initialize();
      renderer.srcObject = remoteStream;

      state = state.maybeWhen(
          initialized: (pc, stream, local, _, ice) => WebRTCState.initialized(
              peerConnection: pc,
              localStream: stream,
              localRenderer: local,
              remoteRenderer: renderer,
              iceState: ice),
          orElse: () => state);
    }, onDisconnected: () {
      disposeWebRTC();
    });
  }

  Future<void> acceptIncomingCall(String dialogId) async {
    final callService = _ref.read(callServiceProvider);
    await callService.acceptCall(dialogId: dialogId);
  }

  void onIncomingCallNotification(Map<String, dynamic> payload) {
    final dialogId = payload['dialog_id'] ?? payload['dialogId'];
    if (dialogId != null) {
      acceptIncomingCall(dialogId);
    } else {
      rejectIncomingCall();
    }
  }

  Future<void> rejectIncomingCall() async {
    final callService = _ref.read(callServiceProvider);
    await callService.rejectCall();
  }

  Future<void> hangUp() async {
    final callService = _ref.read(callServiceProvider);
    await callService.hangUp();
  }

  Future<void> disposeWebRTC() async {
    await state.whenOrNull(initialized: (pc, stream, local, remote, _) async {
      await pc.dispose();
      await stream.dispose();
      await local.dispose();
      await remote.dispose();
    });
    state = const WebRTCState.initializing();
  }

/*  Future<void> createPeerConnection(Map<String, dynamic> configuration) async {
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
  }*/
}

// WebRTC Video State Notifier
class WebRTCVideoStateNotifier extends StateNotifier<WebRTCVideoState> {
  WebRTCVideoStateNotifier()
      : super(WebRTCVideoState(
            localRenderer: RTCVideoRenderer(),
            remoteRenderer: RTCVideoRenderer()));

  Future<void> initialize() async {
    await state.localRenderer.initialize();
    await state.remoteRenderer.initialize();
  }

  void updateWebRTCVideoState(WebRTCVideoState newState) {
    state = newState;
  }

  void disposeRenderer() {
    state.localRenderer.dispose();
    state.remoteRenderer.dispose();
    state = state.copyWith(isConnected: false);
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
