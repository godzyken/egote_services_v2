/*// TODO: Migration, `CubeDialog` est remplacé par 'CubeDialogMig'
class CubeDialogController extends StateNotifier<CubeDialogMig?> {
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

  Future<int?> createNewGroupDialog(CubeDialogMig newGroupDialog) async {
    CubeDialogMig groupDialog = CubeDialogMig(
        CubeDialogTypeMig.GROUP(newGroupDialog.type).id,
        dialogId: newGroupDialog.dialogId,
        name: newGroupDialog.name);

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

      */ /*switch (state) {
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
      }*/ /*
    });

    return cubeChatConnectionStateSubscription.resume();
  }

*/ /*reconnection() {
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
  }*/ /*
}*/
