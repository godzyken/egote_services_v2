import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/devis_service.dart';

final devisServiceNotifierProvider =
    ChangeNotifierProvider<DevisServiceNotifier>(
  (ref) {
    return DevisServiceNotifier(ref);
  },
);
