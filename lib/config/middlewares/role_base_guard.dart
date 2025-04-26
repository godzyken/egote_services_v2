import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/model/user_app_role.dart';
import '../../features/auth/application/wrapper/adapter/app_user.dart';
import '../../features/auth/presentation/controller/user_controller_state.dart';
import '../../features/home/domain/entities/notifier/application_state.dart';

class RoleBasedGuard {
  final WidgetRef ref;

  RoleBasedGuard(this.ref);

  String? redirect(GoRouterState state) {
    final user = ref.read(authStateProvider);
    final userState = ref.read(userControllerStateProvider);

    final path = state.uri.path;

    final isLoggedIn = user != null;
    final userRole = userState.maybeWhen(
      data: (data) => parseUserRole(data.role),
      orElse: () => null,
    );

    final isProfileComplete = userState.maybeWhen(
      data: (data) => data.isComplete,
      orElse: () => false,
    );

    // Auth check
    if (!isLoggedIn) return '/auth';

    // Profile completion check
    if (!isProfileComplete && path != '/complete-profile') {
      return '/complete-profile';
    }

    // Role restrictions
    if (path.startsWith('/admin') && userRole != 'admin') {
      return '/not-authorized';
    }

    if (path.startsWith('/support') && userRole != 'agent') {
      return '/not-authorized';
    }

    // Default redirection
    if (path == '/') {
      switch (userRole) {
        case UserLevel.admin:
          return '/admin/dashboard';
        case UserLevel.support:
          return '/support';
        case UserLevel.user:
        default:
          return '/user_home';
      }
    }

    return null;
  }
}
