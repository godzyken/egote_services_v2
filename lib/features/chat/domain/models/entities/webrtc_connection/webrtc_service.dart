import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SignallingService {
  // instance of Socket
  Socket? socket;

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

  void init() {
    createCallSession(callType, opponentsIds);
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

    callSession.onLocalStreamReceived = (mediaStream) {
      // called when local media stream completely prepared

      // display the stream in UI
      // ...
      callSession.acceptCall(userInfo);
    };

    callSession.onRemoteStreamReceived =
        (callSession, opponentId, mediaStream) async {
      // called when remote media stream received from opponent
      RTCVideoRenderer streamRender = RTCVideoRenderer();
      await streamRender.initialize();
      streamRender.srcObject = mediaStream;
      // display the stream in UI
      // ...streamRender.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitCover;

      // display the stream in UI
      // ...RTCVideoView(streamRender);
      RTCVideoView videoView = RTCVideoView(streamRender);
    };

    callSession.onRemoteStreamRemoved = (callSession, opponentId, mediaStream) {
      // called when remote media was removed
    };

    callSession.onUserNoAnswer = (callSession, opponentId) {
      // called when did not receive an answer from opponent during timeout (default timeout is 60 seconds)
    };

    callSession.onCallRejectedByUser = (callSession, opponentId, [userInfo]) {
      // called when received 'reject' signal from opponent
      String callSessionId;
      Set<int> callMembers = {};
      callMembers.add(opponentId);
      callSessionId = callSession.sessionId;

      callSession.reject(userInfo);

      rejectCall(callSessionId, callMembers, userInfo: userInfo);
    };

    /* callSession.onCallRejectedByOpponent = (callSessionId, callMembers, [userInfo]) {


      rejectCall(callSessionId, callMembers, userInfo: userInfo);
    }*/

    callSession.onCallAcceptedByUser = (callSession, opponentId, [userInfo]) {
      // called when received 'accept' signal from opponent
      callSession.acceptCall(userInfo);
    };

    callSession.onReceiveHungUpFromUser =
        (callSession, opponentId, [userInfo]) {
      // called when received 'hungUp' signal from opponent
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
