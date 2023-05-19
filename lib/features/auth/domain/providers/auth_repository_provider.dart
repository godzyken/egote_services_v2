import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infrastructure/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authClient = ref.watch(supabaseClientProvider).auth;
  final prefs = ref.read(sharedPreferencesProvider).asData!.value;

  return AuthRepository(AuthTokenLocalDataSource(prefs), authClient);
},
    dependencies: [supabaseClientProvider, sharedPreferencesProvider],
    name: 'Auth repository provider');

final authStateListenable = ValueNotifier<bool>(false);

final authControllerProvider =
    StateNotifierProvider<AuthController, UserEntityModel?>(
        (ref) => AuthController(ref));
