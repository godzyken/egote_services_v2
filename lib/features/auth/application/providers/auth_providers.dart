import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/entities_extension.dart';
import '../../domain/providers/auth_repository_provider.dart';
import '../controller/controller_extensions.dart';

final signInWithGoogleProvider =
    NotifierProvider.autoDispose<SignInWithGoogleController, bool>(
  () => SignInWithGoogleController(),
  dependencies: [authRepositoryProvider],
);

final loginControllerNotifierProvider = NotifierProvider.autoDispose<
    LoginControllerNotifier,
    SignInState>(
  () => LoginControllerNotifier(),
  dependencies: [authRepositoryProvider],
);

final signUpProvider = NotifierProvider.autoDispose<SignUpController, SignUpState>(
  () => SignUpController(),
  dependencies: [authRepositoryProvider],
);