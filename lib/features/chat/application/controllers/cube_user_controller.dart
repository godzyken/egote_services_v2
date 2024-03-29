import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class CubeUserController extends StateNotifier<CubeUser?> {
  CubeUserController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;

  Future<void> _initialize() async {
    try {
      final userModelEntity = _ref.watch(userNotifierProvider.notifier);
      final authModelEntity = _ref.watch(autoAuthControllerProvider);

      do {
        state = CubeUser(
          id: authModelEntity?.userEntityModel.id.value,
          fullName: authModelEntity!.userEntityModel.name,
          email: authModelEntity.authUser.email!,
          login: authModelEntity.userEntityModel.name,
          externalId: userModelEntity.previousUser!.id.value,
          phone: authModelEntity.authUser.phone,
        );
      } while (userModelEntity.previousUser!.id == authModelEntity.id);
    } on AuthException catch (e) {
      log(e.toString());
      state = CubeUser();
    }
  }
}
