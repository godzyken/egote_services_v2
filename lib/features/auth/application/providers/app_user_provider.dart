import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/app_user_controller.dart';
import '../wrapper/adapter/app_user.dart';

final appUserProvider =
    StateNotifierProvider<AppUserController, AppUser?>((ref) {
  return AppUserController(ref);
});
