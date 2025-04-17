import 'dart:async';

import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/user_controller.dart';

final userProfileProvider =
    AsyncNotifierProvider<UserProfileNotifier, CubeUser?>(() {
  return UserProfileNotifier();
});

class UserProfileNotifier extends AsyncNotifier<CubeUser?> {
  @override
  FutureOr<CubeUser?> build() async {
    final user = ref.watch(authStateProvider);
    if (user == null) return null;

    final controller = ref.read(userControllerProvider);
    return await controller.fetchUser(user.uid);
  }

  Future<void> loadUser(String userId) async {
    final controller = ref.read(userControllerProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await controller.fetchUser(userId);
    });
  }
}
