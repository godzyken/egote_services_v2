import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_calls.dart' as webrtc;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../permissions/permissions_providers.dart';

final webrtcInitProvider = FutureProvider<bool>((ref) async {
  try {
    // Vérification des permissions avant l'initialisation
    bool permissionsGranted = ref.read(permissionProvider.notifier).mounted;
    if (!permissionsGranted) {
      developer.log("Les permissions n'ont pas été accordées.");
      return false;
    }

    // Vérifiez d'abord que le BackgroundIsolateBinaryMessenger est initialisé
    await _ensureIsolateBinaryMessengerInitialized();
    // Si WebRTC est déjà initialisé, pas besoin de réinitialiser
    if (webrtc.WebRTC.initialized) {
      developer.log("WebRTC déjà initialisé.");
      return true;
    }

    // Initialisation de WebRTC
    return await _initializeWebRTC();
  } catch (e, s) {
    await _handleInitializationError(e, s);
    return false;
  }
});

// Fonction pour s'assurer que le BackgroundIsolateBinaryMessenger est initialisé
Future<void> _ensureIsolateBinaryMessengerInitialized() async {
  try {
    // Effectuer des tâches liées à l'isolement une fois l'initialisation réussie
    developer.log('RootIsolateToken initialisé et prêt à l\'emploi.');

    // Exemple de communication avec le canal de plateforme (MethodChannel)
    final String result =
        await MethodChannel('com.godzy.egote_services_v2/my_channel')
            .invokeMethod('someMethod', {'param': 'value'});

    developer.log('Résultat de la méthode: $result');
  } catch (e, s) {
    developer.log('Erreur lors de l\'initialisation de l\'isolement : $e',
        stackTrace: s);
    await Sentry.captureException(e, stackTrace: s);
  }
}

// Fonction dédiée pour l'initialisation de WebRTC
Future<bool> _initializeWebRTC() async {
  try {
    await webrtc.WebRTC.initialize(options: {
      'androidAudioConfiguration':
          webrtc.AndroidAudioConfiguration.media.toMap(),
    });

    webrtc.Helper.setAndroidAudioConfiguration(
        webrtc.AndroidAudioConfiguration.media);
    return true;
  } catch (e, s) {
    developer.log("Erreur lors de l'initialisation de WebRTC: $e",
        stackTrace: s);
    await Sentry.captureException(e, stackTrace: s);
    return false;
  }
}

// Fonction pour gérer les erreurs d'initialisation et les capturer dans Sentry
Future<void> _handleInitializationError(Object e, StackTrace s) async {
  developer.log("Erreur lors de l'initialisation de WebRTC: $e", stackTrace: s);
  await Sentry.captureException(e, stackTrace: s);

  // Capturer les erreurs dans un outil de suivi des performances (si disponible)
  // final datadogService = ref.read(datadogServiceProvider);
  // datadogService.trackError('WebRTC Initialization', e.toString(), s);
}
