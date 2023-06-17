import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/entities_extension.dart';
import '../../controller/auth_controller_state.dart';
import '../../states/auth/auth_state.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final authState = ref.watch(authStateProvider);

      return authState.when(() => const LoginScreen(),
          authenticated: (AuthStatus status, UserModel userEntity) =>
              UserHomeScreen(pid: userEntity.id.value.toString()),
          unauthenticated: (AuthStatus status) => const SignUpScreen()
      );
  }
}
