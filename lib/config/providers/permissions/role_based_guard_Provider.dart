import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../middlewares/role_base_guard.dart';

final roleBasedGuardProvider =
    Provider.family<RoleBasedGuard, GoRouterState>((ref, state) {
  final readRef = ref.state.ref;
  return RoleBasedGuard(readRef);
});
