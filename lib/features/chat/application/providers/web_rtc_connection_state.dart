import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/chat/application/providers/web_rtc_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/webrtc/webrtc_provider.dart';
import '../../../common/domain/entities/states/webrtc_state.dart';
import '../../../common/domain/entities/states/webrtc_video_state.dart';

final webRTCStateProvider = StateNotifierProvider<WebRTCNotifier, WebRTCState>(
    (ref) => WebRTCNotifier(ref));

final webRTCVideoStateProvider =
    StateNotifierProvider<WebRTCVideoStateNotifier, WebRTCVideoState>(
        (ref) => WebRTCVideoStateNotifier());

final webRTCPeerConnectionStateProvider = StateNotifierProvider<
    WebRTCPeerConnectionStateNotifier,
    RTCPeerConnection?>((ref) => WebRTCPeerConnectionStateNotifier());
