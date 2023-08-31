import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CubeDialogController extends StateNotifier<CubeDialog?> {
  CubeDialogController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  Future<void> _initialize() async {}

  createNewGroupDialog() async {
    CubeDialog newGroupDialog = CubeDialog(
      CubeDialogType.GROUP,
    );

    await createDialog(newGroupDialog)
        .then((createdDialog) => null)
        .catchError((onError) => null);
  }
}

class CubeDialogStateController extends StateNotifier<CubeChatConnectionState> {
  CubeDialogStateController(this.ref) : super(CubeChatConnectionState.Idle);

  final Ref ref;

  connectionStateStream() async {
    var cubeChatConnectionStateSubscription =
        CubeChatConnection.instance.connectionStateStream.listen((state) {
      log("New chat connection state is $state");

      switch (state) {
        case CubeChatConnectionState.Idle:
        // TODO: instance of connection was created.
        case CubeChatConnectionState.Connecting:
        // TODO: Handle this case.
        case CubeChatConnectionState.Authenticated:
        // TODO: user successfully authorised on ConnectyCube server.
        case CubeChatConnectionState.AuthenticationFailure:
        // TODO: error(s) was occurred during authorisation on ConnectyCube server.
        case CubeChatConnectionState.Reconnecting:
        // TODO: started reconnection to the chat.
        case CubeChatConnectionState.Resumed:
        // TODO: chat connection was resumed.
        case CubeChatConnectionState.Ready:
        // TODO: chat connection fully ready for realtime communications.
        case CubeChatConnectionState.Closing:
        // TODO: Handle this case.
        case CubeChatConnectionState.ForceClosed:
        // TODO: chat connection was interrupted.
        case CubeChatConnectionState.Closed:
          // TODO: chat connection was closed.
          Connectivity().checkConnectivity().then((connectivityType) {
            if (connectivityType != ConnectivityResult.none) {
              if (CubeChatConnection.instance.currentUser != null) {
                CubeChatConnection.instance.relogin();
              }
            }
          });
          break;
      }
    });
  }

  reconnection() {
    CubeChatConnectionSettings chatConnectionSettings =
        CubeChatConnectionSettings.instance;
    chatConnectionSettings.reconnectionTimeout = 5000;
    chatConnectionSettings.totalReconnections = 5;
    var connectivityStateSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityType) {
      if (connectivityType != ConnectivityResult.none) {
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
