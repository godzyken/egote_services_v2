import 'package:egote_services_v2/features/auth/domain/providers/user_service_provider.dart';
import 'package:egote_services_v2/features/auth/domain/service/auth_service.dart';
import 'package:egote_services_v2/features/auth/domain/service/check_out_user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/providers/supabase/supabase_providers.dart';
import '../service/firebase_service.dart';
import '../service/supabase_auth_service.dart';
import '../service/user_service.dart';

part 'check_out_user_service_provider.g.dart';

@riverpod
CheckOutUserService getCheckoutUserService(Ref ref) {
  final userService = ref.watch(userServiceProvider);

  return userService.supabaseAuthService.when(
    data: (user) {
      final service = FirebaseAuthService.createCubeUser(
          supabaseAuthService: AsyncData(user));

      final client = ref.watch(supabaseClientProvider);

      final supabaseAuthService = SupabaseAuthService(client);

      final authService = AuthService();

      final firebaseService = FirebaseService();

      return CheckOutUserService.fromFirebaseAuthService(
          service, supabaseAuthService, authService, firebaseService);
    },
    error: (error, stackTrace) =>
        throw Exception('Erreur lors du chargement du CheckoutUserService :'),
    loading: () =>
        throw Exception('Le Service utilisateur is en chargement...'),
  );
}
