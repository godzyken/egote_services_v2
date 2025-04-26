import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'webrtc_state.freezed.dart';

@freezed
class WebRTCState with _$WebRTCState {
  const factory WebRTCState.initializing() = _Initializing;
  const factory WebRTCState.initialized({
    required RTCPeerConnection peerConnection,
    required MediaStream localStream,
    required RTCVideoRenderer localRenderer,
    required RTCVideoRenderer remoteRenderer,
    @Default('') String iceState,
  }) = _Initialized;

  const factory WebRTCState.error({
    required String errorMessage,
  }) = _Error;
}

extension WebRTCStateX on WebRTCState {
  bool get isInitialized => maybeWhen(
        initialized: (_, __, ___, ____, _____) => true,
        orElse: () => false,
      );

  String get iceStatus => maybeWhen(
        initialized: (_, __, ___, ____, iceState) => iceState,
        orElse: () => '',
      );

  bool get renderersReady => maybeWhen(
        initialized: (_, __, local, remote, ____) =>
            local.srcObject != null && remote.srcObject != null,
        orElse: () => false,
      );
}
