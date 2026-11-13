import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Interface for all ecosystem modules in the Construction 4.0 ecosystem (Mosaic Hub compatible)
abstract class AppModule {
  String get id => '';

  String get name => '';

  String get description => '';

  IconData get icon => Icons.extension;

  Color get accentColor => Colors.blue;

  int get sortOrder => 100;

  bool get isPinnedByDefault => false;

  String get initialRoute => '/';

  /// Returns the list of routes provided by this module
  List<RouteBase> get routes;
}
