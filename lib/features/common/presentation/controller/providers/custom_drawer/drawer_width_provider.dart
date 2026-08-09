import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/app_shared/extensions/drawer_width.dart';

/// Notifier permettant de gérer la largeur du Drawer
class DrawerWidthNotifier extends Notifier<double> {
  @override
  double build() {
    return drawerWidth();
  }

  /// Permet de modifier la largeur du Drawer
  void setWidth(double width) {
    state = width;
  }
}

/// Provider du DrawerWidth pour Riverpod 3
final drawerWidthProvider = NotifierProvider<DrawerWidthNotifier, double>(
  DrawerWidthNotifier.new,
  name: 'drawerWidthProvider',
);