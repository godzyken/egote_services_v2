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
    localRenderer = webrtc.RTCVideoRenderer();
    remoteRenderer = webrtc.RTCVideoRenderer();

    await localRenderer.initialize();
    await remoteRenderer.initialize();

    await _setupWebRTC();
  }

  Future<void> _setupWebRTC() async {
    // Initialisation de la connexion WebRTC
    peerConnection = await webrtc.createPeerConnection({
      'iceServers': [
        {
          'urls': 'stun:stun.l.google.com:19302',
        },
      ],
    });

    // Capture du flux local
    localStream = await webrtc.navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': true,
    });

    // Ajout du flux local à la connexion
    localStream.getTracks().forEach((track) {
      peerConnection.addTrack(track, localStream);
    });

    // Définir le flux local pour le rendre visible dans l'interface utilisateur
    localRenderer.srcObject = localStream;

    // Écoute des événements de la connexion WebRTC (par exemple, onTrack)
    peerConnection.onTrack = (webrtc.RTCTrackEvent event) {
      remoteRenderer.srcObject = event.streams[0];
    };

    // D'autres configurations...
  }

  @override
  Future<void> dispose() async {
    await localRenderer.dispose();
    await remoteRenderer.dispose();
    await peerConnection.close();
    await localStream.dispose();
    super.dispose();
  }
}

final webrtcInitProvider = FutureProvider<bool>((ref) async {
  try {
    bool? isOn = webrtc.WebRTC.initialized;

    if (isOn == false) {
      await webrtc.WebRTC.initialize(options: {
        'androidAudioConfiguration':
            webrtc.AndroidAudioConfiguration.media.toMap()
      });
      webrtc.Helper.setAndroidAudioConfiguration(
          webrtc.AndroidAudioConfiguration.media);
    }
  } on ExceptionStackTraceExtractor catch (e, s) {
    if (kDebugMode) {
      developer.log('Future web rtc init provider: $e', stackTrace: s);
    }
    return false;
  }

  return await Future.delayed(
      Duration(seconds: 1), () => webrtc.WebRTC.initialized);
});
