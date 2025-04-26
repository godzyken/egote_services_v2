import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers.dart';
import '../services/webrtc_service.dart';

final webRTCP2PServiceProvider = Provider<WebRTCP2PService>((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider).value;
  if (sharedPreferences == null) {
    throw Exception('SharedPreferences are not initialized.');
  }
  // Créer une instance de WebRTCP2PService ici
  final service = WebRTCP2PService(prefs: sharedPreferences);
  ref.onDispose(() => service.dispose());
  return service;
});
