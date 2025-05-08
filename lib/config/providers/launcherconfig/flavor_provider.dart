import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../environements/flavors.dart';

/// Provider global exposant le Flavor courant
final flavorProvider = Provider<Flavor>((ref) {
  return F.appFlavor;
});
