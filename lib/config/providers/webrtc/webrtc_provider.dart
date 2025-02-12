import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as web_r_t_c;

final webrtcInitProvider = FutureProvider<bool>((ref) async {
/*  final conn = ref.watch(webRTCStateProvider);


  if(conn.peerConnection != null) {
    conn.peerConnection?.dispose();
    return true;
  } else if (conn.peerConnection?.connectionState != RTCPeerConnectionState.RTCPeerConnectionStateClosed) {
    conn.peerConnection?.getConnectionState();
    return true;
  } else {
    conn.peerConnection?.getConnectionState();
    return false;
  }*/

  return await Future.delayed(
      Duration(seconds: 1), () => web_r_t_c.WebRTC.initialized);
});

/*
final audioOutputConfigProvider = StateProvider<ConnectionAudioOutputOptions>(
    (ref) {
      final _state = ref.watch(webrtcInitProvider.future);
      return ConnectionAudioOutputOptions(_state, deviceId: deviceId)
    });

final androidAudioConfigProvider = Provider<AndroidAudioConfiguration>((ref) =>
    AndroidAudioConfiguration(
        androidAudioAttributesContentType:
            AndroidAudioAttributesContentType.unknown));

final androidAudioAttributesContentTypeProvider =
    StateProvider<List<AndroidAudioAttributesContentType>>(
        (ref) => AndroidAudioAttributesContentType.values);

class ConnectionAudioOutputOptions extends StateNotifier<AudioOutputOptions> {
  ConnectionAudioOutputOptions(super._state, {required this.preload, required String deviceId});
  final Future<bool> preload;
}
*/
