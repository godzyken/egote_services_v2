import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
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
      : super(RTCDataChannelState.RTCDataChannelClosed);

  final Ref ref;

  connectionStateStream() async {
    final cubeChatConnectionStateSubscription =
        createLocalMediaStream('Subscribe')
            .asStream()
            .listen((mediaStream) async {
      developer.log("New chat connection state is $mediaStream");

      final tracks = mediaStream.getTracks();

      for (var track in tracks) {
        if (tracks.isEmpty) {
          return await mediaStream.addTrack(track);
        }
      }

      switch (state) {
        case RTCDataChannelState.RTCDataChannelConnecting:
          // TODO: Handle this case.
          Connectivity().checkConnectivity().then((connectivityType) {
            for (var conn in connectivityType) {
              switch (conn) {
                case ConnectivityResult.mobile:
                  // TODO: Handle this case.
                  throw UnimplementedError();
                case ConnectivityResult.wifi:
                // TODO: Handle this case.
                case ConnectivityResult.bluetooth:
                  // TODO: Handle this case.
                  throw UnimplementedError();
                case ConnectivityResult.ethernet:
                  // TODO: Handle this case.
                  throw UnimplementedError();
                case ConnectivityResult.none:
                  // TODO: Handle this case.
                  throw UnimplementedError();
                case ConnectivityResult.vpn:
                  // TODO: Handle this case.
                  throw UnimplementedError();
                case ConnectivityResult.other:
                  // TODO: Handle this case.
                  throw UnimplementedError();
              }
            }
            throw UnimplementedError();
          });
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
    });

    return cubeChatConnectionStateSubscription.resume();
  }

  reconnection() async {
    CubeChatConnectionSettings chatConnectionSettings =
        CubeChatConnectionSettings.instance;
    chatConnectionSettings.reconnectionTimeout = 5000;
    chatConnectionSettings.totalReconnections = 5;
    bool isChatDisconnected = CubeChatConnection.instance.chatConnectionState ==
        CubeChatConnectionState.Closed;

    var connectivityStateSubscription =
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
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.vpn:
            // TODO: Handle this case.
            throw UnimplementedError();
          case ConnectivityResult.other:
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      }

      if (isChatDisconnected &&
          CubeChatConnection.instance.currentUser != null) {
        CubeChatConnection.instance.relogin();
        isChatDisconnected = false;
      }
    });

    return connectivityStateSubscription.resume();
  }
}
