import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:egote_services_v2/config/providers/connectivity/connectivity_providers.dart';
import 'package:egote_services_v2/config/providers/cube/cube_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CubeDialogController extends StateNotifier<CubeDialog?> {
  CubeDialogController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  Future<void> _initialize() async {
    _ref.notifyListeners();
  }

  Future<RTCDataChannelState> channelInit(int? id) async {
    try {
      RTCDataChannelInit channelInit = RTCDataChannelInit();
      if (channelInit.id == id) {
        return rtcDataChannelStateForString(state!.name!);
      } else {
        return rtcDataChannelStateForString(channelInit.protocol);
      }
    } catch (e) {
      developer.log("Erreur lors de l'initialisation du channel : $e");
      return RTCDataChannelState.RTCDataChannelClosed;
    }
  }

  Future<int?> createNewGroupDialog(CubeDialog newGroupDialog) async {
    try {
      CubeDialog groupDialog = CubeDialog(CubeDialogType.GROUP,
          dialogId: newGroupDialog.dialogId, name: newGroupDialog.name);

      final createdGroupDialog = await _createGroupDialog(groupDialog);
      state = createdGroupDialog;

      final dialogId = int.parse(createdGroupDialog!.dialogId!);
      return dialogId;
    } catch (e) {
      developer.log("Erreur lors de la création du groupe : $e");
      return null;
    }
  }

  Future<CubeDialog?> _createGroupDialog(CubeDialog groupDialog) async {
    try {
      List<CubeUser> users = [];
      final cubeUser = await _ref.watch(cubeUserProvider.future);
      if (cubeUser != null) {
        users.add(cubeUser);
      }

      CubeDialog group = CubeDialog(
        CubeDialogType.GROUP,
        dialogId: groupDialog.dialogId,
        name: groupDialog.name,
        occupantsIds: users.map((user) => user.id!).toList(),
        photo: groupDialog.photo,
        description: groupDialog.description,
      );

      CubeDialog createdGroup = await createDialog(group);

      return createdGroup;
    } catch (e) {
      developer.log("Erreur lors de la création du groupe : $e");
      return null;
    }
  }

  Future<List<CubeDialog>> fetchAllDialogs() async {
    try {
      // TODO: à remplacer par une API réelle

      await Future.delayed(Duration(seconds: 2));

      List<CubeDialog> dialogs = [
        CubeDialog(CubeDialogType.PRIVATE,
            dialogId: '12345', name: 'Dialogue 1'),
        CubeDialog(CubeDialogType.GROUP, dialogId: '67890', name: 'Groupe 2'),
      ];

      return dialogs;
    } catch (e) {
      developer.log("Erreur lors de la récupération des dialogs : $e");
      return [];
    }
  }

  Future<bool> deleteDialog(String dialogId) async {
    try {
      // TODO: Logique pour supprimer un dialogue (ici, c'est une simulation)
      await Future.delayed(Duration(seconds: 1));

      return true;
    } catch (e) {
      developer.log("Erreur lors de la suppression du dialogue : $e");
      return false;
    }
  }

  Future<List<String>> getUserPermissions(String dialogId, int userId) async {
    try {
      // TODO: permissions fictives à remplacer par une API réelle
      await Future.delayed(Duration(seconds: 1));

      if (dialogId == '12345') {
        return ['read', 'write'];
      } else {
        return ['read'];
      }
    } catch (e) {
      developer.log(
          "Erreur lors de la récupération des permissions de l'utilisateur : $e");
      return [];
    }
  }
}

class CubeDialogStateController extends StateNotifier<RTCDataChannelState> {
  CubeDialogStateController(this.ref)
      : super(RTCDataChannelState.RTCDataChannelClosed) {
    _initialize();
  }

  final Ref ref;

  StreamSubscription<List<ConnectivityResult>>? connectivityStateSubscription;
  StreamSubscription<MediaStream>? connectionStateSubscription;
  CubeChatConnectionSettings? chatConnectionSettings;

  List<MediaStreamTrack>? tracks;
  bool? isChatDisconnected;

  Future<void> _initialize() async {
    ref.notifyListeners();
    await switcherState();
  }

  switcherState() async {
    switch (state) {
      case RTCDataChannelState.RTCDataChannelConnecting:
        // TODO: Handle this case.
        throw UnimplementedError();
      case RTCDataChannelState.RTCDataChannelOpen:
        // TODO: Handle this case.
        throw UnimplementedError();
      case RTCDataChannelState.RTCDataChannelClosing:
        // TODO: Handle this case.
        throw UnimplementedError();
      case RTCDataChannelState.RTCDataChannelClosed:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Future<void> initializeChatConnection() async {
    final cubeChatConnectionSettingsResult =
        await ref.watch(cubeChatConnectionSettingsProvider.future);

    final settings = cubeChatConnectionSettingsResult;

    settings.reconnectionTimeout = 5000;
    settings.totalReconnections = 5;

    final connectionState = ref.watch(cubeChatConnectionNotifierProvider);

    final isDisconnected =
        ref.watch(cubeChatConnectionProvider).chatConnectionState ==
            connectionState;

    final connectivityNotifier = ref.read(connectivityStatusProviders.notifier);

    if (connectivityNotifier.subscription != null) {
      connectivityNotifier.subscription!.resume();
    } else {
      developer.log('Warning: Connectivity subscription is null');
    }

    developer.log('Chat connection initialized. Disconnected: $isDisconnected');
  }

  Future<void> connectionStateStream() async {
    connectionStateSubscription = createLocalMediaStream('Subscribe')
        .asStream()
        .listen((mediaStream) async {
      developer.log("New chat connection state is $mediaStream");

      tracks = mediaStream.getTracks();

      for (var track in tracks!) {
        if (tracks!.isEmpty) {
          return await mediaStream.addTrack(track);
        }
      }
    });

    return connectionStateSubscription!.resume();
  }

  Future<void> reconnection() async {
    chatConnectionSettings =
        await ref.watch(cubeChatConnectionSettingsProvider.future);

    chatConnectionSettings!.reconnectionTimeout = 5000;
    chatConnectionSettings!.totalReconnections = 5;

    isChatDisconnected =
        ref.watch(cubeChatConnectionProvider).chatConnectionState ==
            CubeChatConnectionState.Closed;

    connectivityStateSubscription =
        ref.watch(connectivityStatusProviders.notifier).subscription!;

    return connectivityStateSubscription!.resume();
  }

  Future<void> deconnection() async {
    if (connectionStateSubscription != null) {
      ref.watch(cubeChatConnectionProvider).logout();
      return await connectionStateSubscription!.cancel();
    } else {
      ref.watch(cubeChatConnectionProvider).destroy();
    }
  }
}
