import 'package:egote_services_v2/config/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/states/call_state/call_state.dart';
import '../services/webrtc_service.dart';

class CallNotifier extends StateNotifier<CallState> {
  final WebRTCP2PService _webrtcService;

  CallNotifier(this._webrtcService) : super(const CallState()) {
    _webrtcService.onCallEnded = _onCallEnded;
    _webrtcService.onError = _onError;

    // Tentative de reconnexion automatique à l'init
    _tryReconnect();
  }

  void _onCallEnded() {
    state = state.copyWith(status: CallStatus.ended);
  }

  void _onError(String error) {
    state = state.copyWith(status: CallStatus.error, errorMessage: error);
  }

  Future<void> _tryReconnect() async {
    final hasData = _webrtcService.prefs.containsKey('opponentsIds');
    if (hasData) {
      state = state.copyWith(status: CallStatus.reconnecting);
      await _webrtcService.tryReconnectIfNeeded();
      state = state.copyWith(status: CallStatus.calling);
    }
  }

  void startCall(List<int> opponents, {bool isVideo = true}) {
    state = state.copyWith(status: CallStatus.calling);
    _webrtcService.startCall(opponentsIds: opponents, isVideo: isVideo);
  }

  void acceptCall() {
    state = state.copyWith(status: CallStatus.inCall);
    _webrtcService.acceptCall();
  }

  void hangUp() {
    state = state.copyWith(status: CallStatus.ended);
    _webrtcService.hangUp();
  }

  void rejectCall() {
    state = state.copyWith(status: CallStatus.ended);
    _webrtcService.rejectCall();
  }

  bool get isInCall => _webrtcService.isInCall;
}

final callNotifierProvider =
    StateNotifierProvider<CallNotifier, CallState>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider).maybeWhen(
        data: (prefs) => prefs,
        orElse: () => null,
      );
  if (sharedPrefs == null) {
    throw Exception('SharedPreferences not initialized');
  }
  final webRTCP2PService = WebRTCP2PService(prefs: sharedPrefs);
  return CallNotifier(webRTCP2PService);
});
