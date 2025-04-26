import 'package:connectycube_sdk/connectycube_calls.dart';

abstract class ICallService {
  Future<void> initSession(List<int> opponents, {bool isVideo = true});
  Future<void> startCall({required String dialogId});
  Future<void> acceptCall({required String dialogId});
  Future<void> rejectCall();
  Future<void> hangUp();
  void listenToCallEvents({
    required Function(MediaStream localStream) onLocalStream,
    required Function(MediaStream remoteStream) onRemoteStream,
    required Function() onDisconnected,
  });
}
