import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider simple (non modifiable de l'extérieur).
/// À surcharger via ProviderScope(overrides: [...]) avec la vraie implémentation.
final checkoutServiceProvider = Provider<CheckoutService>((ref) {
  throw UnimplementedError('checkoutServiceProvider doit être surchargé');
});
