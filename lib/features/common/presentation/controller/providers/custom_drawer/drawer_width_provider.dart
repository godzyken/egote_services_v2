
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/app_shared/extensions/drawer_width.dart';

final drawerWidthProvider = StateProvider<double>((StateProviderRef<double> ref) {
  return drawerWidth();
});