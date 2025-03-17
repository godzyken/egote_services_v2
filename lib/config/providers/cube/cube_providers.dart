import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/domain/providers/user_service_provider.dart';
import '../../../features/chat/application/controllers/cube_dialog_controller.dart';

// <---------------- Cube Instances Providers -------------------> //

final cubeSettingsProvider =
    Provider<CubeSettings>((ref) => CubeSettings.instance);

final cubeChatConnectionProvider =
    Provider<CubeChatConnection>((ref) => CubeChatConnection.instance);

final cubeSessionManagerProvider =
    Provider<CubeSessionManager>((ref) => CubeSessionManager.instance);

final cubeChatConnectionSettingsProvider =
    FutureProvider<CubeChatConnectionSettings>((ref) async {
  try {
    final cubeChatConnectionSettings = CubeChatConnectionSettings.instance;

    cubeChatConnectionSettings.reconnectionTimeout = 1000;
    cubeChatConnectionSettings.totalReconnections = 3;

    return cubeChatConnectionSettings;
  } catch (e) {
    throw Exception(
        'Erreur lors de la récupération des paramètres de connexion à CubeChat : $e');
  }
});

// <---------------- Cube Provider --------------------> //
final cubeProvider = Provider<CubeProvider>((_) => CubeProvider());

final cubeEntityProvider = Provider<CubeEntity>((ref) => CubeEntity());

class CubeChatConnectionNotifier
    extends StateNotifier<CubeChatConnectionState> {
  CubeChatConnectionNotifier() : super(CubeChatConnectionState.Ready);

  final CubeChatConnectionSettings _settings =
      CubeChatConnectionSettings.instance;

  static const int maxReconnectionAttempts = 3;
  static const int reconnectionDelay = 2000;

  Future<void> connect() async {
    try {
      state = CubeChatConnectionState.Connecting;

      _settings.reconnectionTimeout = 1000;
      _settings.totalReconnections = maxReconnectionAttempts;

      // Tentative de connexion à CubeChat
      await _attemptConnection();

      state = CubeChatConnectionState.Ready;
    } catch (e) {
      state = CubeChatConnectionState.Closed;
    }
  }

  Future<void> disconnect() async {
    try {
      // Logique de déconnexion
      await Future.delayed(Duration(seconds: 2));
      state = CubeChatConnectionState.Closed; // Déconnexion réussie
    } catch (e) {
      state = CubeChatConnectionState.Closed;
      developer.log("Erreur lors de la déconnexion : $e");
    }
  }

  Future<void> reconnect() async {
    int attemptsCount = 0;
    state = CubeChatConnectionState.Connecting;
    while (attemptsCount < maxReconnectionAttempts) {
      try {
        state = CubeChatConnectionState.Reconnecting;
        await Future.delayed(Duration(milliseconds: reconnectionDelay));

        await _attemptConnection();

        state = CubeChatConnectionState.Ready;
        break;
      } catch (e) {
        attemptsCount++;
        if (attemptsCount >= maxReconnectionAttempts) {
          state = CubeChatConnectionState.Closed;
          developer.log(
              "Erreur lors de la ré-connexion après $attemptsCount tentatives : $e");
        } else {
          developer.log("Reconnexion échouée, tentative $attemptsCount...");
        }
      }
    }
  }

  Future<void> _attemptConnection() async {
    await Future.delayed(Duration(seconds: 2));

    bool success = true;
    if (success) {
      state = CubeChatConnectionState.Ready;
    }
  }
}

final cubeChatConnectionNotifierProvider =
    StateNotifierProvider<CubeChatConnectionNotifier, CubeChatConnectionState>(
        (ref) => CubeChatConnectionNotifier());

final cubeUserProvider = FutureProvider<CubeUser?>((ref) async {
  final userService = ref.watch(userServiceProvider);
  final user = await userService.createCubeUserFromFirebase();
  return user;
});

final cubeDialogueProvider = FutureProvider<CubeDialog?>((ref) async {
  final type = ref.watch(cubeDialogTypeProvider.notifier).state;
  return CubeDialog(type);
});

final cubeDialogStateControllerProvider =
    StateNotifierProvider<CubeDialogStateController, RTCDataChannelState>(
        (ref) => CubeDialogStateController(ref));

final cubeDialogControllerProvider =
    FutureProvider<CubeDialogController>((ref) async {
  return CubeDialogController(ref);
});

final cubeDialogTypeProvider = StateProvider<int>((ref) {
  return CubeDialogType.BROADCAST;
});
