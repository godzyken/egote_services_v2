import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:connectycube_sdk/connectycube_calls.dart';

import '../../data/data_sources/local/pref_util.dart';

typedef StreamCallback = void Function(MediaStream stream);
typedef ErrorCallback = void Function(String message);

class WebRTCP2PService {
  final P2PClient _client = P2PClient.instance;
  P2PSession? _session;

  // Sauvegarde pour reconnexion
  Set<int>? _lastOpponents;
  bool _lastCallWasVideo = true;
  Duration _lastTimeout = const Duration(seconds: 30);

  // Config reconnexion
  final int _maxReconnectAttempts = 3;
  int _currentReconnectAttempt = 0;
  Duration _reconnectDelay = const Duration(seconds: 2);

  // Variables pour gérer SharedPreferences
  SharedPrefs prefs;

  /// Callbacks
  StreamCallback? onLocalStream;
  StreamCallback? onRemoteStream;
  VoidCallback? onCallEnded;
  ErrorCallback? onError;
  VoidCallback? onTimeout;

  Timer? _callTimeoutTimer;
  bool _intentionalHangUp = false;

  WebRTCP2PService({required this.prefs}) {
    _client.init();

    _client.onReceiveNewSession = _onReceiveNewSession;
    _client.onSessionClosed = _onSessionClosed;

    _initPrefs();
  }

  void _initPrefs() async {
    prefs = await SharedPrefs.create();
    _reconnectDelay =
        Duration(seconds: prefs.prefs.getInt('reconnectDelay') ?? 2);
  }

  void dispose() {
    _cancelTimeout();
    _client.destroy();
  }

  /// Démarre un appel
  void startCall({
    required List<int> opponentsIds,
    bool isVideo = true,
    Duration timeout = const Duration(seconds: 30),
  }) {
    final callType = isVideo ? CallType.VIDEO_CALL : CallType.AUDIO_CALL;
    _lastOpponents = opponentsIds.toSet();
    _lastCallWasVideo = isVideo;
    _lastTimeout = timeout;
    _currentReconnectAttempt = 0;

    _session = _client.createCallSession(
      callType,
      _lastOpponents!, // ✅ Important : Set<int>
    );

    _setupStreams();
    _session?.startCall();

    _intentionalHangUp = false;

    _callTimeoutTimer = Timer(timeout, () {
      developer.log("📞 Appel terminé (timeout)");
      onTimeout?.call();
      hangUp();
    });

    // Enregistre la valeur dans SharedPreferences
    _saveReconnectData(opponentsIds, isVideo, timeout);
  }

  /// Accepte un appel entrant
  void acceptCall() {
    if (_session != null) {
      _setupStreams();
      _session!.acceptCall();
      _cancelTimeout();
    }
  }

  /// Rejette l’appel
  void rejectCall() {
    _intentionalHangUp = true;
    _session?.reject();
    _session = null;
    _cancelTimeout();
    _clearReconnectData();
  }

  /// Termine l’appel
  void hangUp() {
    _intentionalHangUp = true;
    _session?.hungUp();
    _session = null;
    _cancelTimeout();
    _clearReconnectData();
  }

  /// Reçoit une session entrante
  void _onReceiveNewSession(P2PSession incomingSession) {
    if (_session != null && _session!.sessionId != incomingSession.sessionId) {
      // Refuse si un autre appel est en cours
      incomingSession.reject();
      return;
    }

    _session = incomingSession;
    developer.log("📞 Nouvelle session entrante");

    // Si tu veux déclencher automatiquement accept/reject
    // tu peux appeler acceptCall() ici
    _setupStreams();
  }

  void _onSessionClosed(P2PSession session) {
    if (_session?.sessionId == session.sessionId) {
      developer.log("📞 Session fermée");

      final wasInterrupted = !_intentionalHangUp;
      _session = null;
      developer.log("📴 Appel terminé");
      _cancelTimeout();
      onCallEnded?.call();

      if (wasInterrupted && _lastOpponents != null) {
        developer.log('🔁 Tentative de reconnexion...');
        _attemptReconnect();
      }
    }
  }

  void _attemptReconnect() async {
    if (_currentReconnectAttempt >= _maxReconnectAttempts) {
      developer.log("❌ Nombre maximal de tentatives atteint");
      return;
    }

    _currentReconnectAttempt++;

    final delay = _reconnectDelay * _currentReconnectAttempt;
    developer.log(
        "🔁 Tentative #$_currentReconnectAttempt dans ${delay.inSeconds}s...");

    List<int>? savedOpponents = prefs.prefs
        .getStringList('opponentsIds')
        ?.map((id) => int.parse(id))
        .toList();

    bool? savedIsVideo = prefs.prefs.getBool('isVideo');
    Duration? savedTimeout =
        Duration(seconds: prefs.prefs.getInt('timeout') ?? 30);

    if (savedOpponents != null && savedIsVideo != null) {
      Future.delayed(delay, () {
        startCall(
          opponentsIds: savedOpponents,
          isVideo: savedIsVideo,
          timeout: savedTimeout,
        );
      });
    }
  }

  void _setupStreams() {
    if (_session == null) return;

    _session!.onLocalStreamReceived = (MediaStream stream) {
      developer.log("🎙️ Flux local reçu");
      onLocalStream?.call(stream);
    };

    _session!.onRemoteStreamReceived = (session, userId, stream) {
      developer.log("📡 Flux distant reçu");
      onRemoteStream?.call(stream);
    };
  }

  void _cancelTimeout() {
    _callTimeoutTimer?.cancel();
    _callTimeoutTimer = null;
  }

  // Sauvegarder les données de reconnexion
  Future<void> _saveReconnectData(
      List<int> opponentsIds, bool isVideo, Duration timeout) async {
    await prefs.prefs.setStringList(
        'opponentsIds', opponentsIds.map((id) => id.toString()).toList());
    await prefs.prefs.setBool('isVideo', isVideo);
    await prefs.prefs.setInt('timeout', timeout.inSeconds);
    await prefs.prefs.setBool('shouldReconnect', true);
  }

  // Effacer les données de reconnexion
  Future<void> _clearReconnectData() async {
    await prefs.prefs.remove('opponentsIds');
    await prefs.prefs.remove('isVideo');
    await prefs.prefs.remove('timeout');
    await prefs.prefs.setBool('shouldReconnect', false);
  }

  Future<void> tryReconnectIfNeeded() async {
    final opponentsStr = prefs.prefs.getStringList('opponentsIds');
    final isVideo = prefs.prefs.getBool('isVideo') ?? true;
    final timeoutSeconds = prefs.prefs.getInt('timeout') ?? 30;
    final shouldReconnect = prefs.prefs.getBool('shouldReconnect') ?? false;

    if (!shouldReconnect) {
      developer.log("🚫 Reconnexion non autorisée");
      return;
    }

    if (opponentsStr != null) {
      final opponentsIds = opponentsStr.map((e) => int.parse(e)).toList();

      // relancer l'appel avec les données sauvegardées
      startCall(
        opponentsIds: opponentsIds,
        isVideo: isVideo,
        timeout: Duration(seconds: timeoutSeconds),
      );
    }

    await _clearReconnectData();
  }

  bool get isInCall => _session != null;
}
