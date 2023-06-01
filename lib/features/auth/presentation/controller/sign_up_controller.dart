import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/sign_up/sign_up_state.dart';
import '../../domain/entities/user_properties/properties_extensions.dart';
import '../../infrastructure/repositories/auth_repository.dart';

class SignUpController extends StateNotifier<SignUpState> {
  final AuthRepository _authRepository;

  SignUpController(this._authRepository) : super(const SignUpState());

  void onNameChange(String value) {
    final name = NameFormz.dirty(value);

    state = state.copyWith(nameFormz: name);
  }

  void onEmailChange(String v) {
    final email = EmailFormz.dirty(v);
    state = state.copyWith(emailFormz: email);
  }

  void onPasswordChange(String p) {
    final password = PasswordFormz.dirty(p);

    state = state.copyWith(passwordFormz: password);
  }

  void signUpWithEmailAndPassword() async {
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);
    try {
      await _authRepository.signUp(state.emailFormz!.value,
          state.nameFormz!.value, state.passwordFormz!.value);

      state = state.copyWith(status: FormzSubmissionStatus.success);
    } catch (e) {
      state = state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: e.toString());
    }
  }
}
