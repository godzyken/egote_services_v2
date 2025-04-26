import 'package:freezed_annotation/freezed_annotation.dart';

part 'call_state.freezed.dart';

enum CallStatus {
  idle,
  calling,
  inCall,
  reconnecting,
  ended,
  error,
}

@freezed
class CallState with _$CallState {
  const factory CallState({
    @Default(CallStatus.idle) CallStatus status,
    String? errorMessage,
  }) = _CallState;
}
