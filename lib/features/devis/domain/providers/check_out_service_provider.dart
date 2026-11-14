import 'package:egote_services_v2/features/devis/domain/services/check_out_service.dart';
import 'package:egote_services_v2/features/devis/domain/services/mock_checkout_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider pour CheckoutService avec MockCheckoutService par défaut
/// (Surchargable via ProviderScope(overrides: [...]) si besoin).
final checkoutServiceProvider = Provider<CheckoutService>((ref) {
  return MockCheckoutService();
});
