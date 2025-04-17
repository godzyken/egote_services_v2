import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_controller.dart';
import '../providers/user_profile_providers.dart';

class AuthSessionManager {
  final Ref ref;

  AuthSessionManager(this.ref);

  Future<void> onLogin(User user) async {
    final userController = ref.read(userControllerProvider);

    final exists = await userController.checkCubeUserExists(user.uid);
    if (!exists) {
      await userController.createCubeUserFromFirebaseUser(user);
    }

    // Optionnel : charger le profil fraîchement créé
    await ref.read(userProfileProvider.notifier).loadUser(user.uid);
  }
}
