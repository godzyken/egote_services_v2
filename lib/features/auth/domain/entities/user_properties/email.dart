import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  invalid;

  String getMessage() {
    switch (this) {
      case empty:
        return 'Email can\'t be empty';
      case invalid:
        return 'Invalid email';
    }
  }
}

const String _kEmailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure([super.value = '']) : super.pure();

  const EmailFormz._() : super.dirty('');

  const EmailFormz.dirty([super.value = '']) : super.dirty();

  static final _regex = RegExp(_kEmailPattern);

  @override
  EmailValidationError? validator(String value) {
    if (_regex.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return EmailValidationError.empty;
    } else {
      return EmailValidationError.invalid;
    }
  }

  static String? showEmailErrorMessage(EmailValidationError? error) {
    if (error == EmailValidationError.empty) {
      return 'Empty email';
    } else if (error == EmailValidationError.invalid) {
      return 'Invalid email';
    } else {
      return null;
    }
  }
}
