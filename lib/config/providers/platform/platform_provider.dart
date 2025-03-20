import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Créez un Stream qui émet les changements du TargetPlatform
Stream<TargetPlatform> targetPlatformStream() async* {
  // Vous pouvez ajouter des conditions pour émettre des valeurs
  yield defaultTargetPlatform; // Envoie la plateforme actuelle

  // Si vous voulez écouter les changements, vous pouvez les ajouter ici
  // (par exemple en fonction de la réactivité à un changement d'état).
  await Future.delayed(Duration(seconds: 5));
  yield TargetPlatform.android;

  await Future.delayed(Duration(seconds: 5));
  yield TargetPlatform.iOS;
}

final targetPlatformProvider = StreamProvider<TargetPlatform>(
  (ref) => targetPlatformStream(),
  name: 'platformProvider',
);

final platformProvider = StateProvider<TargetPlatform>(
  (final Ref<TargetPlatform> ref) => defaultTargetPlatform,
  name: 'platformProvider',
);

final backgroundTaskProvider =
    StateNotifierProvider<BackgroundTaskNotifier, bool>((ref) {
  return BackgroundTaskNotifier();
});

class BackgroundTaskNotifier extends StateNotifier<bool> {
  BackgroundTaskNotifier() : super(false);

  // Initialiser une tâche en arrière-plan et gérer les erreurs
  Future<void> setTaskStarted() async {
    try {
      // Initialiser le processus en arrière-plan
      final bool initialized = await FlutterBackground.initialize();
      if (initialized) {
        state = true;
      } else {
        state = false;
      }
    } on FlutterError catch (e) {
      // Gérer les erreurs spécifiques
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        stack: e.stackTrace,
        context: ErrorDescription('Failed to initialize background task'),
      ));
      state = false;
    } catch (e) {
      // Capturer toutes autres erreurs
      state = false;
      developer.log(
          'Erreur inconnue lors de l\'initialisation de la tâche en arrière-plan: $e');
    }
  }

  // Marquer la tâche comme en cours
  Future<void> setTaskInProgress(bool inProgress) async {
    try {
      if (inProgress) {
        await FlutterBackground.enableBackgroundExecution();
        state = true;
      } else {
        await FlutterBackground.disableBackgroundExecution();
        state = false;
      }
    } on FlutterError catch (e) {
      // Gérer les erreurs spécifiques
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        stack: e.stackTrace,
        context:
            ErrorDescription('Failed to evaluate background task execution'),
      ));
      state = false;
    } catch (e) {
      state = false;
      developer
          .log('Erreur lors de l\'exécution de la tâche en arrière-plan: $e');
    }
  }

  // Marquer la tâche comme terminée
  Future<void> setTaskCompleted() async {
    try {
      if (FlutterBackground.isBackgroundExecutionEnabled) {
        state = true;
      } else {
        await FlutterBackground.disableBackgroundExecution();
        state = false;
      }
    } on FlutterError catch (e) {
      // Gérer les erreurs spécifiques
      FlutterError.reportError(FlutterErrorDetails(
        exception: e,
        stack: e.stackTrace,
        context: ErrorDescription(
            'Failed to evaluate the complete background task execution'),
      ));
      state = false;
    } catch (e) {
      state = false;
      developer.log('Erreur lors de la fin de la tâche en arrière-plan: $e');
    }
  }

  // Marquer la tâche comme en pause
  Future<void> setTaskPaused() async {
    await FlutterBackground.disableBackgroundExecution();
    state = false;
  }

  // Marquer la tâche comme échouée
  Future<void> setTaskFailed() async {
    await FlutterBackground.disableBackgroundExecution();
    state = false;
  }
}
