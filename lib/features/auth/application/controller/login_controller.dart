import 'package:egote_services_v2/features/auth/domain/entities/sign_in/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/user_properties/properties_extensions.dart';

class LoginControllerNotifier extends StateNotifier<SignInState> {
  LoginControllerNotifier() : super(const SignInState());

  FormzSubmissionStatus? validate(
      {EmailFormz? emailFormz, PasswordFormz? passwordFormz}) {
    for (var f in FormzSubmissionStatus.values) {
      switch (f) {
        case FormzSubmissionStatus.initial:
          state = state.copyWith(
              emailFormz: emailFormz, passwordFormz: passwordFormz, status: f);
          return FormzSubmissionStatus.initial;
        case FormzSubmissionStatus.inProgress:
          state = state.copyWith(
              emailFormz: emailFormz, passwordFormz: passwordFormz, status: f);
          return FormzSubmissionStatus.inProgress;
        case FormzSubmissionStatus.success:
          state = state.copyWith(
              emailFormz: emailFormz, passwordFormz: passwordFormz, status: f);
          return FormzSubmissionStatus.success;
        case FormzSubmissionStatus.failure:
          state = state.copyWith(
              emailFormz: emailFormz, passwordFormz: passwordFormz, status: f);
          return FormzSubmissionStatus.failure;
        case FormzSubmissionStatus.canceled:
          state = state.copyWith(
              emailFormz: emailFormz, passwordFormz: passwordFormz, status: f);
          return FormzSubmissionStatus.canceled;
      }
    }
    return null;
  }

  void onEmailChange(String value) {
    final email = EmailFormz.dirty(value);

    state = state.copyWith(
      emailFormz: email,
      status: validate(emailFormz: state.emailFormz),
    );
  }

  void onPasswordChange(String value) {
    final password = PasswordFormz.dirty(value);

    state = state.copyWith(
      passwordFormz: password,
      status: validate(passwordFormz: state.passwordFormz),
    );
  }

}