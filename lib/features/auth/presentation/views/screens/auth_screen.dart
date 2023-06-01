import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/auth/presentation/views/screens/auth_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final _authState = ref.watch(authStateChangesProvider);

      return _authState.when(
          data: (user) {
            if (user != null) return UserHomeScreen(pid: user.uid);
            return const LoginScreen();
          },
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )
      );
  }
}
