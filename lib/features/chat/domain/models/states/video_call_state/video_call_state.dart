import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_call_state.freezed.dart';

@freezed
class VideoCallSate with _$VideoCallSate {
  const factory VideoCallSate({
    @Default(false) bool inCall,
    RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
  }) = _VideoCallSate;
}
