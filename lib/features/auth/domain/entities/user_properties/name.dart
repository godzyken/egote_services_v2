import 'package:formz/formz.dart';

enum NameValidationError {
  empty,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return 'User name can\'t be empty';
      case invalid:
        return 'Too short name';
    }
  }
}

class NameFormz extends FormzInput<String, NameValidationError> {
  const NameFormz.pure() : super.pure('');
  const NameFormz.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) {
      return NameValidationError.empty;
    } else if (value.length < 3) {
      return NameValidationError.invalid;
    } else {
      return null;
    }
  }

  static String? showNameErrorMessage(NameValidationError? error) {
    if (error == NameValidationError.empty) {
      return 'Empty name';
    } else if (error == NameValidationError.invalid) {
      return 'Too short name';
    } else {
      return null;
    }
  }
}
