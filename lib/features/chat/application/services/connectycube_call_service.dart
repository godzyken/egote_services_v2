import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart';

import 'i_call_service.dart';

class ConnectyCubeCallService implements ICallService {
  ConferenceSession? _session;
  final int currentUserId;

  ConnectyCubeCallService({required this.currentUserId});

  String? _lastDialogId;
  List<int>? _lastOpponents;
  bool _wasVideoCall = true;
  ConferenceRole? _lastRole;
  bool _isReconnecting = false;

  @override
  Future<void> initSession(List<int> opponents, {bool isVideo = true}) async {
    _lastOpponents = opponents;
    _wasVideoCall = isVideo;

    final int callType = isVideo ? CallType.VIDEO_CALL : CallType.AUDIO_CALL;

    _session = await ConferenceClient.instance.createCallSession(
      currentUserId,
      callType: callType,
    );
  }

  @override
  Future<void> startCall({required String dialogId}) async {
    _lastDialogId = dialogId;
    _lastRole = ConferenceRole.PUBLISHER;

    if (_session == null && _lastOpponents != null) {
      await initSession(_lastOpponents!, isVideo: _wasVideoCall);
    }

    await _session!.joinDialog(dialogId, (publishers) {
      developer.log("Rejoin la conference avec les publishers : $publishers");
    }, conferenceRole: ConferenceRole.PUBLISHER);
  }

  @override
  Future<void> acceptCall({required String dialogId}) async {
    _lastDialogId = dialogId;
    _lastRole = ConferenceRole.LISTENER;

    if (_session == null && _lastOpponents != null) {
      await initSession(_lastOpponents!, isVideo: _wasVideoCall);
    }

    await _session!.joinDialog(dialogId, (publishers) {
      developer.log(
          "Participant accepté, rejoin la conference avec les publishers : $publishers");
    }, conferenceRole: ConferenceRole.LISTENER);
  }

  @override
  Future<void> rejectCall() async {
    await hangUp();
  }

  @override
  Future<void> hangUp() async {
    _session?.leave();
    _session = null;
  }

  @override
  void listenToCallEvents({
    required Function(MediaStream localStream) onLocalStream,
    required Function(MediaStream remoteStream) onRemoteStream,
    required Function() onDisconnected,
  }) {
    if (_session == null) return;

    _session!.onLocalStreamReceived = (stream) {
      developer.log("Local stream received");
      onLocalStream(stream);
    };
    _session!.onRemoteStreamTrackReceived =
        (session, userId, stream, {trackId}) {
      developer.log("Remote stream received de $userId");
      onRemoteStream(stream);
    };
    _session!.onPublisherLeft = (userId) async {
      developer.log("Participant $userId a quitté la conference");

      if (userId == currentUserId) {
        await _tryReconnect();
      }

      onDisconnected();
    };
    _session!.onSessionClosed = (session) async {
      developer.log("La session a été fermée");
      await _tryReconnect();
      onDisconnected();
    };
    _session!.onError = (error) async {
      developer.log("Erreur lors de la réception du stream : $error");
      await _tryReconnect();
    };
  }

  Future<void> reconnect() async {
    if (_lastDialogId != null && _lastOpponents != null && _lastRole != null) {
      await initSession(_lastOpponents!, isVideo: _wasVideoCall);
      await _session!.joinDialog(_lastDialogId!, (publishers) {
        developer.log("Rejoin la conference avec les publishers : $publishers");
      }, conferenceRole: _lastRole!);
    } else {
      developer.log("Impossible de relancer la connexion");
    }
  }

  Future<void> _tryReconnect() async {
    if (_isReconnecting) {
      return;
    }
    _isReconnecting = true;

    try {
      developer.log("Tentative de ré-connexion...");
      await reconnect();
      developer.log("Ré-connexion réussie");
    } catch (e) {
      developer.log("Erreur lors de la ré-connexion : $e");
    } finally {
      _isReconnecting = false;
    }
  }
}
