import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/entities_extension.dart';
import '../../../controller/auth_controller_state.dart';
import '../../../states/auth/auth_state.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerStateProvider);

    return authState.when(() => const LoginScreen(),
        authenticated: (AuthStatus status, UserModel userEntity) {
          final preload = userEntity.userEntityModel.isComplete != true;
          return _buildAuthenticatedUI(status, preload, userEntity);
        },
        unauthenticated: (AuthStatus status) => const SignUpScreen());
  }

  Widget _buildAuthenticatedUI(
      AuthStatus status, bool preload, UserModel userEntity) {
    switch (status) {
      case AuthStatus.authenticated:
        return UserHomeScreen(
            preload: preload, pid: userEntity.userEntityModel.id.toString());
      case AuthStatus.unauthenticated:
        return const LoginScreen();
    }
  }
}
