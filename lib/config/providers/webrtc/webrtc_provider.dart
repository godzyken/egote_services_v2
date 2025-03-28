import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:sentry_flutter/sentry_flutter.dart';

final webrtcProvider =
    StateNotifierProvider<WebRTCNotifier, webrtc.RTCSessionDescription?>(
  (ref) => WebRTCNotifier(),
);

class WebRTCNotifier extends StateNotifier<webrtc.RTCSessionDescription?> {
  WebRTCNotifier() : super(null);

  late final webrtc.RTCVideoRenderer localRenderer;
  late final webrtc.RTCVideoRenderer remoteRenderer;
  late final webrtc.RTCPeerConnection peerConnection;
  late final webrtc.MediaStream localStream;

  Future<void> initialize() async {
    try {
      localRenderer = webrtc.RTCVideoRenderer();
      remoteRenderer = webrtc.RTCVideoRenderer();

      await localRenderer.initialize();
      await remoteRenderer.initialize();

      await _setupWebRTC();

      // Update state after initialization
      state = null; // Can replace with actual RTCSessionDescription if needed
    } catch (e, s) {
      if (kDebugMode) {
        developer.log('Error initializing WebRTC: $e', stackTrace: s);
      }
      // Optionally, report the error
      await Sentry.captureException(e, stackTrace: s);
    }
  }

  Future<void> _setupWebRTC() async {
    // WebRTC setup code here...
    peerConnection = await webrtc.createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'}
      ],
    });

    localStream = await webrtc.navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    localStream.getTracks().forEach((track) {
      peerConnection.addTrack(track, localStream);
    });

    localRenderer.srcObject = localStream;

    peerConnection.onTrack = (webrtc.RTCTrackEvent event) {
      remoteRenderer.srcObject = event.streams[0];
    };
  }

  @override
  Future<void> dispose() async {
    try {
      await localRenderer.dispose();
      await remoteRenderer.dispose();
      await peerConnection.close();
      await localStream.dispose();
    } catch (e, s) {
      if (kDebugMode) {
        developer.log('Error during dispose: $e', stackTrace: s);
      }
      await Sentry.captureException(e, stackTrace: s);
    }

    super.dispose();
  }
}

final webrtcInitProvider = FutureProvider<bool>((ref) async {
  try {
    // Check if WebRTC is initialized already
    bool isInitialized = webrtc.WebRTC.initialized;

    // If WebRTC is not initialized, try initializing it
    if (!isInitialized) {
      await webrtc.WebRTC.initialize(options: {
        'androidAudioConfiguration':
            webrtc.AndroidAudioConfiguration.media.toMap(),
      });
      webrtc.Helper.setAndroidAudioConfiguration(
          webrtc.AndroidAudioConfiguration.media);
    }

    // Ensure the initialization is complete
    return webrtc.WebRTC.initialized;
  } catch (e, s) {
    // Log the error for debugging purposes
    if (kDebugMode) {
      developer.log('Error initializing WebRTC: $e', stackTrace: s);
    }
    // Optionally, report the error to a service like Sentry
    await Sentry.captureException(e, stackTrace: s);
    return false;
  }
});
