import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/middlewares/role_base_guard.dart';

class RedirectGuardPage extends ConsumerWidget {
  const RedirectGuardPage(this.state, {super.key});
  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guard = RoleBasedGuard(ref);
    final redirectPath = guard.redirect(state);
    if (redirectPath != null && redirectPath != state.uri.toString()) {
      Future.microtask(() {
        if (context.mounted) {
          context.go(redirectPath);
        }
      });
    }
    return const SizedBox.shrink();
  }
}
