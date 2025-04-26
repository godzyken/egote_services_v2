import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webrtc_video_state.freezed.dart';

@freezed
class WebRTCVideoState with _$WebRTCVideoState {
  const factory WebRTCVideoState({
    required RTCVideoRenderer localRenderer,
    required RTCVideoRenderer remoteRenderer,
    RTCPeerConnection? peerConnection,
    @Default(false) bool isConnected,
  }) = _WebRTCVideoState;
}
