import 'package:egote_services_v2/features/chat/application/services/connectycube_call_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/providers/cube/cube_providers.dart';
import '../services/i_call_service.dart';

final callServiceProvider = Provider<ICallService>((ref) {
  final cubeUser = ref.watch(cubeUserProvider);
  if (cubeUser.value == null) {
    throw Exception('User not logged in');
  }
  return ConnectyCubeCallService(currentUserId: cubeUser.value!.id!);
});
