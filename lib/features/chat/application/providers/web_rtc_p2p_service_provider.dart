import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/customer/shared_prefs_provider.dart';
import '../services/webrtc_service.dart';

final webRTCP2PServiceProvider = Provider<WebRTCP2PService>((ref) {
  final sharedPrefs = ref.read(sharedPrefsAsyncNotifierProvider);
  final sharedPreferences = sharedPrefs.when(
    data: (data) => data,
    error: (error, stackTrace) {
      throw Exception('SharedPreferences are not initialized.');
    },
    loading: () => throw Exception('SharedPreferences are not initialized.'),
  );
  if (sharedPreferences == null) {
    throw Exception('SharedPreferences are not initialized.');
  }
  // Créer une instance de WebRTCP2PService ici
  final service = WebRTCP2PService(prefs: sharedPreferences);
  ref.onDispose(() => service.dispose());
  return service;
});
