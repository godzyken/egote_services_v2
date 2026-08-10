import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for [AppRouterNotifier]
final appRouterNotifierProvider = NotifierProvider<AppRouterNotifier, void>(AppRouterNotifier.new);

class AppRouterNotifier extends Notifier<void> implements Listenable {
  final List<VoidCallback> _listeners = [];

  @override
  void build() {
    // Listen to dependencies here if needed to trigger router refresh
    // Example: ref.listen(authStateProvider, (prev, next) => _notifyListeners());
  }

  /// Informs GoRouter that an auth/navigation state change occurred
  void notifyListeners() {
    for (final listener in List<VoidCallback>.from(_listeners)) {
      listener();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}
