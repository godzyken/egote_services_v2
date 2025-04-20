import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/devis_calculator_service.dart';

final devisCalculatorProdider =
    Provider<DevisCalculatorService>((ref) => DevisCalculatorService());
