import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  invalid,
  short,
  ;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Password can\'t be empty';
      case short:
        return 'Password is too short';
      case invalid:
        return 'Must contain at least 1 characters and 1 symbol';
    }
  }
}

const String _kPasswordPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$€¤£%^&*-]).{8,}$';

class PasswordFormz extends FormzInput<String, PasswordValidationError> {
  const PasswordFormz.pure([super.value = '']) : super.pure();
  const PasswordFormz.dirty([super.value = '']) : super.dirty();

  static final _regex = RegExp(_kPasswordPattern);

  @override
  PasswordValidationError? validator(String value) {
    if (_regex.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 8) {
      return PasswordValidationError.short;
    } else if (value.contains(' ')) {
      return PasswordValidationError.invalid;
    }
    return null;
  }

  static String? showPasswordErrorMessage(PasswordValidationError? error) {
    if (error == PasswordValidationError.empty) {
      return 'Empty password';
    } else if (error == PasswordValidationError.invalid) {
      return 'Invalid password';
    } else if (error == PasswordValidationError.short) {
      return 'Password too short';
    } else {
      return null;
    }
  }
}
