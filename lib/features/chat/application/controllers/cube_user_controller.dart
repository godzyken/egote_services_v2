import 'dart:developer' as developer;

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CubeUserController extends AsyncNotifier<CubeUser?> {
  @override
  Future<CubeUser?> build() async {
    return _initialize();
  }

  Future<CubeUser?> _initialize() async {
    try {
      final userModelEntity = ref.watch(userNotifierProvider.notifier);
      final authModelEntity = ref.watch(autoAuthControllerProvider);

      if (userModelEntity.previousUser?.id != null && authModelEntity != null) {
        return CubeUser(
          id: authModelEntity.userEntityModel.id.value,
          fullName: authModelEntity.userEntityModel.name,
          email: authModelEntity.authUser.email!,
          login: authModelEntity.userEntityModel.name,
          externalId: userModelEntity.previousUser!.id.value,
          phone: authModelEntity.authUser.phone,
        );
      }
      return null;
    } on AuthException catch (e) {
      developer.log(e.toString());
      return null;
    }
  }
}
