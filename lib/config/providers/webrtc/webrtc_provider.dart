import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

final webrtcInitProvider = FutureProvider<WebRTC>((ref) async {
  if (!WebRTC.initialized) {
    WebRTC.initialize();
    WebRTC.invokeMethod('initialize()');
    return WebRTC();
  }
  // return WebRTC();
  return await WebRTC.invokeMethod('WebRTC.initialize()');
});

final audioOutputConfigProvider = Provider<AudioOutputOptions>(
    (ref) => AudioOutputOptions(deviceId: ref.state.deviceId));

final androidAudioConfigProvider = Provider<AndroidAudioConfiguration>((ref) =>
    AndroidAudioConfiguration(
        androidAudioAttributesContentType:
            AndroidAudioAttributesContentType.unknown));

final androidAudioAttributesContentTypeProvider =
    StateProvider<List<AndroidAudioAttributesContentType>>(
        (ref) => AndroidAudioAttributesContentType.values);
