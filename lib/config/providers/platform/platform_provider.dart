import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Créez un Stream qui émet les changements du TargetPlatform
Stream<TargetPlatform> targetPlatformStream() async* {
  // Vous pouvez ajouter des conditions pour émettre des valeurs
  yield defaultTargetPlatform; // Envoie la plateforme actuelle

  // Si vous voulez écouter les changements, vous pouvez les ajouter ici
  // (par exemple en fonction de la réactivité à un changement d'état).
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

  void setTaskStarted(final FlutterExceptionHandler handler) async {
    try {
      state = await FlutterBackground.initialize();
    } on FlutterErrorDetailsForPointerEventDispatcher catch (e) {
      state = await FlutterBackground.disableBackgroundExecution();
      FlutterErrorDetails(
          exception: e.exception,
          stack: e.stack,
          context: e.context,
          informationCollector: e.informationCollector,
          library: e.library,
          silent: e.silent,
          stackFilter: e.stackFilter);
    }
  }

  void setTaskInProgress(bool inProgress) async {
    await FlutterBackground.enableBackgroundExecution();
    state = inProgress;
  }

  void setTaskCompleted() async {
    await FlutterBackground.disableBackgroundExecution();
    state = false;
  }

  void setTaskPaused() async {
    await FlutterBackground.disableBackgroundExecution();
    state = false;
  }

  void setTaskFailed() async {
    await FlutterBackground.disableBackgroundExecution();
    state = false;
  }
}
