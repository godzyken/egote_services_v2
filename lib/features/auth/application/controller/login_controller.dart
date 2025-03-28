import 'package:egote_services_v2/features/auth/domain/entities/sign_in/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/user_properties/properties_extensions.dart';

class LoginControllerNotifier extends StateNotifier<SignInState> {
  LoginControllerNotifier() : super(const SignInState());

  // Helper function to update state with the provided form values and status
  void _updateState({
    EmailFormz? emailFormz,
    PasswordFormz? passwordFormz,
    FormzSubmissionStatus? status,
  }) {
    state = state.copyWith(
      emailFormz: emailFormz ?? state.emailFormz,
      passwordFormz: passwordFormz ?? state.passwordFormz,
      status: status ?? state.status,
    );
  }

  // Validate and set the form submission status
  FormzSubmissionStatus validate({
    EmailFormz? emailFormz,
    PasswordFormz? passwordFormz,
  }) {
    if (emailFormz != null && !emailFormz.isValid) {
      return FormzSubmissionStatus.failure;
    }
    if (passwordFormz != null && !passwordFormz.isValid) {
      return FormzSubmissionStatus.failure;
    }

    return FormzSubmissionStatus.success;
  }

  void onEmailChange(String value) {
    final email = EmailFormz.dirty(value);
    final status = validate(emailFormz: email);

    _updateState(emailFormz: email, status: status);
  }

  void onPasswordChange(String value) {
    final password = PasswordFormz.dirty(value);
    final status = validate(passwordFormz: password);

    _updateState(passwordFormz: password, status: status);
  }
}
