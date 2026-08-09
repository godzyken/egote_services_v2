import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// --- PROVIDERS ---

final cubeDialogControllerProvider =
NotifierProvider<CubeDialogController, CubeDialog?>(
  CubeDialogController.new,
);

final cubeDialogStateControllerProvider =
NotifierProvider<CubeDialogStateController, RTCDataChannelState>(
  CubeDialogStateController.new,
);

// --- CONTROLLERS ---

class CubeDialogController extends Notifier<CubeDialog?> {
  @override
  CubeDialog? build() {
    return null;
  }

  Future<RTCDataChannelState> channelInit(int? id) async {
    RTCDataChannelInit channelInit = RTCDataChannelInit();
    if (channelInit.id == id) {
      return rtcDataChannelStateForString(state?.name ?? '');
    } else {
      return rtcDataChannelStateForString(channelInit.protocol);
    }
  }

  Future<CubeDialog?> createNewGroupDialog(CubeDialog newGroupDialog) async {
    CubeDialog groupDialog = CubeDialog(
      CubeDialogType.GROUP,
      dialogId: newGroupDialog.dialogId,
      name: newGroupDialog.name,
    );

    try {
      final createdDialog = await createDialog(groupDialog);
      state = createdDialog;
      return createdDialog;
    } catch (onError) {
      developer.log("Erreur création groupe: $onError");
      rethrow;
    }
  }
}

class CubeDialogStateController extends Notifier<RTCDataChannelState> {
  StreamSubscription? _connectivitySubscription;

  @override
  RTCDataChannelState build() {
    ref.onDispose(() {
      _connectivitySubscription?.cancel();
    });

    return RTCDataChannelState.RTCDataChannelClosed;
  }

  Future<void> connectionStateStream() async {
    // 1. Récupération du MediaStream local
    final MediaStream mediaStream = await createLocalMediaStream('Subscribe');

    developer.log("Nouveau media stream initialisé: ${mediaStream.id}");

    // 2. Traitement direct de la liste synchronisée de pistes (MediaStreamTrack)
    final List<MediaStreamTrack> tracks = mediaStream.getTracks();

    if (tracks.isEmpty) {
      developer.log("Aucune piste vidéo/audio trouvée dans le mediaStream");
    } else {
      for (final track in tracks) {
        developer.log("Piste trouvée - ID: ${track.id}, Kind: ${track.kind}");
      }
    }

    // 3. Écoute dynamique de l'ajout de nouvelles pistes sur le MediaStream
    mediaStream.onAddTrack = (MediaStreamTrack track) {
      developer.log("Nouvelle piste ajoutée au stream: ${track.id}");
    };

    // 4. Vérification de l'état du chat ConnectyCube
    final currentChatState = CubeChatConnection.instance.chatConnectionState;

    if (currentChatState == CubeChatConnectionState.Closed) {
      final connectivityResults = await Connectivity().checkConnectivity();
      if (!connectivityResults.contains(ConnectivityResult.none)) {
        if (CubeChatConnection.instance.currentUser != null) {
          CubeChatConnection.instance.relogin();
        }
      }
    }
  }

  void setupReconnectionListener() {
    CubeChatConnectionSettings.instance
      ..reconnectionTimeout = 5000
      ..totalReconnections = 5;

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((results) {
          if (!results.contains(ConnectivityResult.none)) {
            bool isChatDisconnected =
                CubeChatConnection.instance.chatConnectionState ==
                    CubeChatConnectionState.Closed;

            if (isChatDisconnected &&
                CubeChatConnection.instance.currentUser != null) {
              CubeChatConnection.instance.relogin();
            }
          }
        });
  }
}