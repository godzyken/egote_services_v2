import 'package:egote_services_v2/config/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_notifier.g.dart';

@riverpod
class AppRouterNotifier extends _$AppRouterNotifier implements Listenable {
  final List<VoidCallback> _listeners = [];

  List<RouteBase> get routes => $appRoutes;

  @override
  void build() {
    // Réagit à chaque modification d'état du Notifier
    // ref.listenSelf((previous, next) {
    //   _notifyListeners();
    // });
  }

  /// Informe GoRouter qu'un changement d'état d'authentification/navigation a eu lieu
  void _notifyListeners() {
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
