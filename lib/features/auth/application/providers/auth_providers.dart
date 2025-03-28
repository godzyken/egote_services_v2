import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/entities_extension.dart';
import '../controller/controller_extensions.dart';

final signInWithGoogleProvider =
    StateNotifierProvider.autoDispose<SignInWithGoogleController, bool>((ref) {
  return SignInWithGoogleController(ref);
});

final loginControllerNotifierProvider =
    StateNotifierProvider.autoDispose<LoginControllerNotifier, SignInState>(
        (ref) => LoginControllerNotifier(),
        name: 'Sign In state notifier provider');

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
        (ref) => SignUpController(),
        name: 'Sign Up state notifier provider');
