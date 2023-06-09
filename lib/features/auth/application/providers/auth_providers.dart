import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/sign_in/sign_in_state.dart';
import '../../domain/entities/sign_up/sign_up_state.dart';
import '../../domain/providers/auth_repository_provider.dart';
import '../controller/controller_extensions.dart';

final signInWithGoogleProvider =
StateNotifierProvider.autoDispose<SignInWithGoogleController, bool>((ref) {
  return SignInWithGoogleController(ref);
});

final loginControllerNotifierProvider = StateNotifierProvider.autoDispose<
    LoginControllerNotifier,
    SignInState>(
        (ref) => LoginControllerNotifier(ref.watch(authRepositoryProvider)),
    dependencies: [authRepositoryProvider],
    name: 'Sign In state notifier provider');

final signUpProvider =
StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
        (ref) => SignUpController(ref.watch(authRepositoryProvider)),
    dependencies: [authRepositoryProvider],
    name: 'Sign Up state notifier provider');