import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
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
    state = CubeUser();
    CubeUser? newUser;

    try {
      final userModelEntity = _ref.watch(userNotifierProvider.notifier);
      final authModelEntity = _ref.watch(autoAuthControllerProvider);

      final  userModel = UserModel.complete(
          id: userModelEntity.previousUser!.id,
          userEntityModel: userModelEntity.previousUser!,
          authUser: AuthUser(
              id: authModelEntity!.id.toString(),
              appMetadata: authModelEntity.authUser.appMetadata,
              userMetadata: authModelEntity.authUser.userMetadata!,
              aud: authModelEntity.authUser.aud,
              email: authModelEntity.authUser.email,
              phone: authModelEntity.authUser.phone,
              createdAt: authModelEntity.authUser.createdAt,
              role: authModelEntity.authUser.role!,
              updatedAt: authModelEntity.authUser.updatedAt!
          ),
          cubeUser: newUser = CubeUser(
            id: authModelEntity.id.value,
            fullName: authModelEntity.userEntityModel.name,
            email: authModelEntity.authUser.email!,
            login: authModelEntity.authUser.email,
            externalId: userModelEntity.previousUser!.id.value,
            phone: authModelEntity.authUser.phone,
          )
      );

      userModel.userEntityModel.isComplete ? state = newUser :  state = null;
    } catch (e) {
      log(e.toString());
    }
  }
}