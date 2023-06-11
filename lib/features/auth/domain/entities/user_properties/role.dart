import 'package:formz/formz.dart';

import 'name.dart';

class RoleFormz extends FormzInput<String, NameValidationError> {
  const RoleFormz.pure([super.value = '']) : super.pure();
  const RoleFormz.dirty([super.value = '']) : super.dirty();

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

  static String? showUserRoleErrorMessage(NameValidationError? error) {
    if (error == NameValidationError.empty) {
      return 'Empty Role name';
    } else if (error == NameValidationError.invalid) {
      return 'Too short Role name';
    } else {
      return null;
    }
  }
}