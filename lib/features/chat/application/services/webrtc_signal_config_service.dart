import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SignallingService {
  // instance of Socket
  Socket? socket;
  // instance of SignallingService
  SignallingService._();
  static final instance = SignallingService._();

  init({required String websocketUrl, required String selfCallerID}) {
    // init Socket
    socket = io(websocketUrl, {
      "transports": ['websocket'],
      "query": {"callerId": selfCallerID}
    });

    // listen onConnect event
    socket!.onConnect((data) {
      log("Socket connected !!");
    });

    // listen onConnectError event
    socket!.onConnectError((data) {
      log("Connect Error $data");
    });

    // connect socket
    socket!.connect();
  }
}

final signallingServiceProvider = Provider<SignallingService>((ref) {
  return SignallingService.instance;
});

class ConfigVideoService {
  P2PClient callClient = P2PClient.instance;

  Set<int> opponentsIds = {};
  int callType = CallType.VIDEO_CALL;

  Map<String, String> userInfo = {};

  P2PSession? callSession;
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  void init() {
    createCallSession(callType, opponentsIds);
    _remoteRenderer = RTCVideoRenderer();
  }

  Future<P2PClient> createCallSession(callType, opponentsIds) async {
    callClient.init();
    callClient.onReceiveNewSession = (incomingCallSession) {};
    callClient.onSessionClosed = (closedCallSession) {};

    return await Future.delayed(Duration(seconds: 1), () {
      callClient.createCallSession(callType, opponentsIds);
      return callClient;
    });
  }

  Future<P2PSession> startCallSession(callType, opponentsIds) async {
    P2PSession callSession =
        callClient.createCallSession(callType, opponentsIds);

    callSession.onLocalStreamReceived = (mediaStream) async {
      // called when local media stream completely prepared

      RTCVideoRenderer localRender = RTCVideoRenderer();
      await localRender.initialize();
      localRender.srcObject = mediaStream;
      // display the stream in UI
      // ... Ex : setState(() { _localRenderer = localRenderer; })
      callSession.acceptCall(userInfo);
    };

    callSession.onRemoteStreamReceived =
        (callSession, opponentId, mediaStream) async {
      _remoteRenderer = RTCVideoRenderer();
      await _remoteRenderer.initialize();
      _remoteRenderer.srcObject = mediaStream;
      // display the stream in UI
      // ... Ex : setState(() { _remoteRenderer = remoteRenderer; })

      // display the stream in UI
      // ...RTCVideoView(streamRender);
      RTCVideoView remoteVideoView = RTCVideoView(_remoteRenderer,
          mirror: true, filterQuality: FilterQuality.medium);
      await remoteVideoView.videoRenderer.initialize();
    };

    callSession.onRemoteStreamRemoved =
        (callSession, opponentId, mediaStream) async {
      _remoteRenderer.srcObject = null;
      _remoteRenderer.dispose();
      _remoteRenderer.removeListener(
        () => Action.DELETE,
      );
      // called when remote media was removed
    };

    callSession.onUserNoAnswer = (callSession, opponentId) {
      // called when did not receive an answer from opponent during timeout (default timeout is 60 seconds)
      callSession.reject(userInfo);
      rejectCall(callSession.sessionId, opponentsIds, userInfo: userInfo);
    };

    callSession.onCallRejectedByUser = (callSession, opponentId, [userInfo]) {
      // called when received 'reject' signal from opponent
      String callSessionId = callSession.sessionId;
      Set<int> callMembers = {opponentId};
      callSession.reject(userInfo);
      rejectCall(callSessionId, callMembers, userInfo: userInfo);
    };

    callSession.onCallAcceptedByUser =
        (callSessionId, callMembers, [userInfo]) {
      callSession.acceptCall(userInfo);
    };

    callSession.onReceiveHungUpFromUser =
        (callSession, opponentId, [userInfo]) {
      // called when received 'hungUp' signal from opponent
      callSession.hungUp(userInfo);
    };

    callSession.onSessionClosed = (callSession) {
      // called when current session was closed
      callSession.closeCurrentSession();
    };

    callSession.startCall(userInfo);

    return callSession;
  }

  void dispose() {
    callClient.destroy();
  }
}

final configVideoServiceProvider = Provider<ConfigVideoService>((ref) {
  return ConfigVideoService();
});
