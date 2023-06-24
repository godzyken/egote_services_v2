import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/application/controller/auth_controller.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/supabase/supabase_providers.dart';
import '../../infrastructure/repositories/auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final prefs = ref.read(sharedPreferencesProvider).asData!.value;
  final client = ref.watch(supabaseClientProvider).auth;

  return AuthRepository(AuthTokenLocalDataSource(prefs), client);
},
    dependencies: [sharedPreferencesProvider, supabaseClientProvider],
    name: 'Auth repository provider');

final authStateListenable = ValueNotifier<bool>(false);

final autoAuthControllerProvider =
    StateNotifierProvider<AutoAuthController, UserModel?>(
        (ref) => AutoAuthController(ref),
    name: 'auto controller authentication state notifier');

final authProvider = StateNotifierProvider.autoDispose<AuthController, AsyncValue<UserModel?>>(
        (ref) {
      final repo = ref.watch(authRepositoryProvider);
      return AuthController(repo);
    },
  dependencies: [authRepositoryProvider],
  name: 'authentication always listener async values state notifier',
);
