import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/chat/data/data_sources/local/pref_util.dart';

// <---------------- Cube Instances Providers -------------------> //

final cubeSettingsProvider =
    Provider<CubeSettings>((ref) => CubeSettings.instance);

final cubeChatConnectionProvider =
    Provider<CubeChatConnection>((ref) => CubeChatConnection.instance);

final cubeSessionManagerProvider =
    Provider<CubeSessionManager>((ref) => CubeSessionManager.instance);

final cubeChatConnectionSettingsProvider = Provider<CubeChatConnectionSettings>(
    (ref) => CubeChatConnectionSettings.instance);

// <---------------- Cube Provider --------------------> //
final cubeProvider = Provider<CubeProvider>((_) => CubeProvider());

final cubeEntityProvider = Provider<CubeEntity>((ref) => CubeEntity());

class CubeConnection {
  final CubeSettings settings = CubeSettings.instance;

  initConnectyCube() {
    init("XXX", "XXXXXXXXXXXXXXX", "XXXXXXXXXXXXXXX",
        onSessionRestore: restoreSession);
  }

  Future<CubeSession> restoreSession() async {
    CubeUser? savedUser = await SharedPrefs.instance.getUser();
    return createSession(savedUser);
  }

  setEndpoints(String apiEndpoint, String chatEndpoint) {
    settings.setEndpoints(apiEndpoint, chatEndpoint);
  }
}
