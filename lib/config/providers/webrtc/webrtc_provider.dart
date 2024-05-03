import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

final webrtcInitProvider = FutureProvider<bool>((ref) async {
  return WebRTC.initialized;
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
