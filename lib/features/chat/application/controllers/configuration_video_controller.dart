import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/chat/domain/models/states/video_call_state/video_call_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigVideoController extends StateNotifier<VideoCallSate> {
  ConfigVideoController() : super(VideoCallSate());

  final P2PClient _callClient = P2PClient.instance;
  P2PSession? _session;
  Set<int> _opponents = {};

  Future<void> initCall(Set<int> opponents, int callType) async {
    _opponents = opponents;
    _callClient.init();

    _session = _callClient.createCallSession(callType, opponents);

    final localRenderer = RTCVideoRenderer();
    await localRenderer.initialize();

    final remoteRenderer = RTCVideoRenderer();
    await remoteRenderer.initialize();

    _session!.onLocalStreamReceived = (mediaStream) async {
      localRenderer.srcObject = mediaStream;
      state = state.copyWith(localRenderer: localRenderer);
    };

    _session!.onRemoteStreamReceived = (session, userId, mediaStream) {
      remoteRenderer.srcObject = mediaStream;
      state = state.copyWith(remoteRenderer: remoteRenderer);
    };

    _session!.onSessionClosed = (_) async {
      _callClient.destroy();
      await localRenderer.dispose();
      await remoteRenderer.dispose();
      state = const VideoCallSate();
    };

    _session!.startCall();
    state = state.copyWith(inCall: true);
  }

  Future<void> hangUp() async {
    _session?.hungUp();
    _callClient.destroy();

    await state.localRenderer?.dispose();
    await state.remoteRenderer?.dispose();

    state = const VideoCallSate();
  }
}
