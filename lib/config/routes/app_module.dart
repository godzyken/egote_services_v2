import 'package:go_router/go_router.dart';

/// Interface for all ecosystem modules (bat_track_v1, Compta4me, etc.)
abstract class AppModule {
  /// Returns the list of routes provided by this module
  List<RouteBase> get routes;
}
