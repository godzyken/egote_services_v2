import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

final webrtcProvider =
    StateNotifierProvider<WebRTCNotifier, RTCSessionDescription?>(
  (ref) => WebRTCNotifier(),
);

class WebRTCNotifier extends StateNotifier<RTCSessionDescription?> {
  WebRTCNotifier() : super(null);

  late final RTCVideoRenderer localRenderer;
  late final RTCVideoRenderer remoteRenderer;
  late final RTCPeerConnection peerConnection;
  late final MediaStream localStream;

  Future<void> initialize() async {
    localRenderer = RTCVideoRenderer();
    remoteRenderer = RTCVideoRenderer();

    await localRenderer.initialize();
    await remoteRenderer.initialize();

    await _setupWebRTC();
  }

  Future<void> _setupWebRTC() async {
    // Initialisation de la connexion WebRTC
    peerConnection = await createPeerConnection({
      'iceServers': [
        {
          'urls': 'stun:stun.l.google.com:19302',
        },
      ],
    });

    // Capture du flux local
    localStream = await navigator.mediaDevices.getUserMedia({
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
    peerConnection.onTrack = (RTCTrackEvent event) {
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
    bool? isOn = WebRTC.initialized;

    if (isOn == false) {
      await WebRTC.initialize();
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }

  return await Future.delayed(Duration(seconds: 1), () => WebRTC.initialized);
});
