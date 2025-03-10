import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
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
    RTCDataChannelInit channelInit = RTCDataChannelInit();
    if (channelInit.id == id) {
      return rtcDataChannelStateForString(state!.name!);
    } else {
      return rtcDataChannelStateForString(channelInit.protocol);
    }
  }

  Future<int?> createNewGroupDialog(CubeDialog newGroupDialog) async {
    CubeDialog groupDialog = CubeDialog(CubeDialogType.GROUP,
        dialogId: newGroupDialog.dialogId, name: newGroupDialog.name);

    return await createNewGroupDialog(groupDialog)
        .then((createdDialog) => groupDialog.type)
        .catchError((onError) => onError);
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
        await ref.watch(cubeChatConnectionSettingsProvider);

    chatConnectionSettings!.reconnectionTimeout = 5000;
    chatConnectionSettings!.totalReconnections = 5;

    isChatDisconnected =
        ref.watch(cubeChatConnectionProvider).chatConnectionState ==
            CubeChatConnectionState.Closed;

    connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityType) {
      for (var conn in connectivityType) {
        switch (conn) {
          case ConnectivityResult.mobile:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.bluetooth:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.wifi:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.ethernet:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.none:
            isChatDisconnected =
                ref.watch(cubeChatConnectionProvider).chatConnectionState ==
                    CubeChatConnectionState.Closed;

            if (isChatDisconnected! &&
                ref.watch(cubeChatConnectionProvider).currentUser != null) {
              ref.watch(cubeChatConnectionProvider).relogin();
            }

          case ConnectivityResult.vpn:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.other:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      }
    });

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
