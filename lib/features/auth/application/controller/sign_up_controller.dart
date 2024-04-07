import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/sign_up/sign_up_state.dart';
import '../../domain/entities/user_properties/properties_extensions.dart';

class SignUpController extends StateNotifier<SignUpState> {

  SignUpController() : super(const SignUpState());

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

}
