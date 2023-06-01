import 'package:egote_services_v2/features/auth/domain/entities/sign_in/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../domain/entities/user_properties/properties_extensions.dart';
import '../../infrastructure/repositories/auth_repository.dart';

class LoginControllerNotifier extends StateNotifier<SignInState> {
  LoginControllerNotifier(this._authRepository) : super(const SignInState());

  final AuthRepository _authRepository;


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
  }

  void onEmailChange(String value) {
    final email = EmailFormz.dirty(value);

    state = state.copyWith(
      emailFormz: email,
      status: validate(emailFormz: email),
    );
  }

  void onPasswordChange(String value) {
    final password = PasswordFormz.dirty(value);

    state = state.copyWith(
      passwordFormz: password,
      status: validate(passwordFormz: password),
    );
  }

  Future<void> signInWithPassword() async {
    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    try {
      await _authRepository.signInWithPassword(
          state.emailFormz!.value, state.passwordFormz!.value);

      state = state.copyWith(status: FormzSubmissionStatus.success);
    } catch (e) {
      state = state.copyWith(
          status: FormzSubmissionStatus.failure, errorMessage: e.toString());
    }
  }
}