import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as web_r_t_c;

import '../../domain/models/entities/webrtc_connection/web_rtc_connection_state.dart';

class WebRTCStateNotifier extends StateNotifier<WebRTCState> {
  WebRTCStateNotifier(this.peerConnection, this._ref)
      : super(WebRTCState(localRenderer: null, remoteRenderer: null));

  final Ref _ref;
  final RTCPeerConnection peerConnection;

  Future<void> initialize() async {
    final webRTCState = _ref.read(webRTCStateProvider);
    final localRenderer = webRTCState.localRenderer;
    final remoteRenderer = webRTCState.remoteRenderer;
    state = WebRTCState(
        peerConnection: peerConnection,
        localRenderer: localRenderer,
        remoteRenderer: remoteRenderer);

    final webRTCVideoState = _ref.read(webRTCVideoSateProvider);

    state = WebRTCState(
        peerConnection: peerConnection,
        localRenderer: webRTCVideoState.localRenderer,
        remoteRenderer: webRTCVideoState.remoteRenderer);

    await localRenderer?.initialize();
    await remoteRenderer?.initialize();

    state = WebRTCState(
        peerConnection: peerConnection,
        localRenderer: localRenderer,
        remoteRenderer: remoteRenderer);

    // await localRenderer?.srcObject = peerConnection.getLocalStreams()[0];
    // await remoteRenderer?.srcObject = peerConnection.getRemoteStreams()[0];

    return await Future.delayed(
        Duration(seconds: 1), () => web_r_t_c.WebRTC.initialized);
  }

  Future<void> createPeerConnection(Map<String, dynamic> configuration) async {
    final pc = await web_r_t_c.createPeerConnection(configuration);

    // Create a local media stream
    final localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    // Add local stream to the peer connection
    localStream.getTracks().forEach((track) {
      pc.addTrack(track, localStream);
    });

    final webRTCVideoState = _ref.read(webRTCVideoSateProvider);

    state = WebRTCState(
        peerConnection: pc,
        localStream: localStream,
        localRenderer: webRTCVideoState.localRenderer,
        remoteRenderer: webRTCVideoState.remoteRenderer);
  }
}

class WebRTCVideoStateNotifier extends StateNotifier<WebRTCVideoState> {
  WebRTCVideoStateNotifier(this.renderer, this.remoteRenderer)
      : super(WebRTCVideoState(
            localRenderer: renderer, remoteRenderer: remoteRenderer));

  final RTCVideoRenderer renderer;
  final RTCVideoRenderer remoteRenderer;

  RTCPeerConnection? peerConnection;

  // Initialize the video renderer
  Future<void> initialize() async {
    RTCVideoRenderer renderer = RTCVideoRenderer();
    RTCVideoRenderer remoteRenderer = RTCVideoRenderer();
    await renderer.initialize();
    await remoteRenderer.initialize();

    state =
        state.copyWith(localRenderer: renderer, remoteRenderer: remoteRenderer);
  }

  // Dispose renderer when no longer needed
  void disposeRenderer() {
    state.localRenderer.dispose();
    state = state.copyWith(
        isConnected: isMobile == true
            ? isDesktop == true
                ? true
                : false
            : isWeb,
        localRenderer: renderer,
        peerConnection: peerConnection,
        remoteRenderer: remoteRenderer);
  }

  void updateWebRTCVideoState(WebRTCVideoState newState) {
    state = newState;
  }
}

// WebRTC StateProvider
final webRTCVideoStateNotifierProvider =
    StateNotifierProvider<WebRTCVideoStateNotifier, WebRTCVideoState?>((ref) {
  final renderer = ref.watch(webRTCStateProvider).localRenderer;
  final remoteRenderer = ref.watch(webRTCStateProvider).remoteRenderer;
  return WebRTCVideoStateNotifier(renderer!, remoteRenderer!);
});

// WebRTC StateNotifier to manage WebRTC connection
class WebRTCVideoRendererStateNotifier
    extends StateNotifier<RTCVideoRenderer?> {
  WebRTCVideoRendererStateNotifier() : super(null);

  // Initialize the video renderer
  Future<void> initialize() async {
    RTCVideoRenderer renderer = RTCVideoRenderer();
    await renderer.initialize();
    state = renderer;
  }

  // Dispose renderer when no longer needed
  void disposeRenderer() {
    state?.dispose();
    state = null;
  }

  updateWebRTCState(RTCVideoRenderer newState) {
    state = newState;
  }
}

class WebRTCPeerConnectionStateNotifier
    extends StateNotifier<RTCPeerConnection?> {
  WebRTCPeerConnectionStateNotifier() : super(null);

  updateWebRTCState(RTCPeerConnection newState) {
    state = newState;
  }

  disposeWebRTCState() {
    state?.dispose();
    state = null;
  }
}
