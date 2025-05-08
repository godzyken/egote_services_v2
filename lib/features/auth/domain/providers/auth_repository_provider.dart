import 'package:egote_services_v2/features/auth/application/controller/auth_controller.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/list_generate_link_type_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/customer/shared_prefs_provider.dart';
import '../../../../config/providers/supabase/supabase_providers.dart';
import '../../infrastructure/repositories/auth_repository.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  final prefsValue = ref.watch(sharedPrefsAsyncNotifierProvider);

  final client = ref.watch(supabaseClientProvider).auth;
  final link = ref.watch(generateLinkTypeNotifierProvider);

  ref.keepAlive();

  if (!prefsValue.hasValue) {
    throw Exception('Shared preferences not initialized');
  }

  final prefs = prefsValue.requireValue;

  client.startAutoRefresh();
  prefs.prefs.reload();

  return AuthRepository(AuthTokenLocalDataSource(prefs), client, link);
}, name: 'Auth repository provider');

final authStateListenable = ValueNotifier<bool>(false);

final autoAuthControllerProvider =
    StateNotifierProvider<AutoAuthController, UserModel?>(
        (ref) => AutoAuthController(ref),
        name: 'auto controller authentication state notifier');

final authProvider = StateNotifierProvider.autoDispose<AuthUserController,
    AsyncValue<UserModel?>>(
  (ref) {
    final repo = ref.watch(authRepositoryProvider);
    return AuthUserController(repo);
  },
  name: 'authentication always listener async values state notifier',
);
