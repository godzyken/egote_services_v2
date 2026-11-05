import 'package:egote_services_v2/features/auth/domain/entities/user_properties/email.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user_properties/password.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user_values/user_name.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailFormz Tests', () {
    test('valid email returns no validation error', () {
      const email = EmailFormz.dirty('test@example.com');
      expect(email.error, isNull);
      expect(email.isValid, isTrue);
    });

    test('empty email returns empty validation error', () {
      const email = EmailFormz.dirty('');
      expect(email.error, EmailValidationError.empty);
      expect(EmailFormz.showEmailErrorMessage(email.error), 'Empty email');
    });

    test('invalid email returns invalid validation error', () {
      const email = EmailFormz.dirty('invalid-email');
      expect(email.error, EmailValidationError.invalid);
      expect(EmailFormz.showEmailErrorMessage(email.error), 'Invalid email');
    });
  });

  group('PasswordFormz Tests', () {
    test('empty password returns empty error', () {
      const password = PasswordFormz.dirty('');
      expect(password.error, PasswordValidationError.empty);
      expect(
        PasswordFormz.showPasswordErrorMessage(password.error),
        'Empty password',
      );
    });

    test('short password returns short error', () {
      const password = PasswordFormz.dirty('Ab1!');
      expect(password.error, PasswordValidationError.short);
      expect(
        PasswordFormz.showPasswordErrorMessage(password.error),
        'Password too short',
      );
    });
  });

  group('UserName Value Object Tests', () {
    test('valid user name returns success', () {
      final userName = UserName('John Doe');
      expect(userName.value.isRight(), isTrue);
      expect(userName.value.getOrElse((l) => ''), 'John Doe');
    });

    test('too short user name returns failure', () {
      final userName = UserName('A');
      expect(userName.value.isLeft(), isTrue);
    });
  });
}
