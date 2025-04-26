import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/app_init_service.dart';

class AppInitRefreshNotifier extends ChangeNotifier {
  late final ProviderSubscription _subscription;

  AppInitRefreshNotifier(Ref ref) {
    // Écoute l'évolution de appInitServiceProvider (AsyncNotifier)
    _subscription = ref.listen<AsyncValue<void>>(
      appInitServiceProvider,
      (previous, next) {
        notifyListeners(); // GoRouter va faire un refresh
      },
      fireImmediately: true, // pour déclencher immédiatement
    );
  }

  @override
  void dispose() {
    _subscription.close(); // Nettoyage
    super.dispose();
  }
}

final routerRefreshStreamProvider = Provider<ChangeNotifier>((ref) {
  return AppInitRefreshNotifier(ref);
});
