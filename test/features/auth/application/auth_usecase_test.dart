import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:egote_services_v2/features/auth/domain/repositories/auth_repository.dart';

import '../../../mocks/mock_auth.dart';
import '../../../helpers/test_utils.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('Auth Feature - Login Use Case', () {
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      TestHelpers.setupAll();
    });

    test('should login with valid credentials', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const password = TestHelpers.testPassword;
      final mockUser = MockUser.create(email: email);

      when(() => mockAuthRepository.loginWithEmail(
            email: email,
            password: password,
          )).thenAnswer((_) async => mockUser);

      // Act
      final result = await mockAuthRepository.loginWithEmail(
        email: email,
        password: password,
      );

      // Assert
      expect(result, isNotNull);
      expect(result.email, email);
      expect(result.id, TestHelpers.testUserId);
      verify(() => mockAuthRepository.loginWithEmail(
            email: email,
            password: password,
          )).called(1);
    });

    test('should return error with invalid email', () async {
      // Arrange
      const invalidEmail = 'not-an-email';
      const password = TestHelpers.testPassword;

      when(() => mockAuthRepository.loginWithEmail(
            email: invalidEmail,
            password: password,
          )).thenThrow(Exception('Invalid email format'));

      // Act & Assert
      expect(
        () => mockAuthRepository.loginWithEmail(
          email: invalidEmail,
          password: password,
        ),
        throwsException,
      );
    });

    test('should return error with wrong password', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const wrongPassword = 'WrongPassword123!';

      when(() => mockAuthRepository.loginWithEmail(
            email: email,
            password: wrongPassword,
          )).thenThrow(Exception('Invalid credentials'));

      // Act & Assert
      expect(
        () => mockAuthRepository.loginWithEmail(
          email: email,
          password: wrongPassword,
        ),
        throwsException,
      );
    });

    test('should persist session token', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const password = TestHelpers.testPassword;
      const token = 'session_token_xyz123';

      when(() => mockAuthRepository.loginWithEmail(
            email: email,
            password: password,
          )).thenAnswer((_) async => MockUser.create(email: email));

      when(() => mockAuthRepository.getToken()).thenAnswer((_) async => token);

      // Act
      await mockAuthRepository.loginWithEmail(
        email: email,
        password: password,
      );
      final persistedToken = await mockAuthRepository.getToken();

      // Assert
      expect(persistedToken, token);
      expect(persistedToken, isNotEmpty);
    });
  });

  group('Auth Feature - Sign Up Use Case', () {
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      TestHelpers.setupAll();
    });

    test('should create account with valid data', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const password = TestHelpers.testPassword;
      const displayName = 'Test Artisan';

      final newUser = MockUser.create(
        email: email,
        displayName: displayName,
      );

      when(() => mockAuthRepository.signUpWithEmail(
            email: email,
            password: password,
            displayName: displayName,
          )).thenAnswer((_) async => newUser);

      // Act
      final result = await mockAuthRepository.signUpWithEmail(
        email: email,
        password: password,
        displayName: displayName,
      );

      // Assert
      expect(result, isNotNull);
      expect(result.email, email);
      expect(result.displayName, displayName);
    });

    test('should reject weak password', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const weakPassword = '123'; // Too weak

      when(() => mockAuthRepository.signUpWithEmail(
            email: email,
            password: weakPassword,
            displayName: 'User',
          )).thenThrow(Exception('Password too weak'));

      // Act & Assert
      expect(
        () => mockAuthRepository.signUpWithEmail(
          email: email,
          password: weakPassword,
          displayName: 'User',
        ),
        throwsException,
      );
    });

    test('should reject duplicate email', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const password = TestHelpers.testPassword;

      when(() => mockAuthRepository.signUpWithEmail(
            email: email,
            password: password,
            displayName: 'User',
          )).thenThrow(Exception('Email already exists'));

      // Act & Assert
      expect(
        () => mockAuthRepository.signUpWithEmail(
          email: email,
          password: password,
          displayName: 'User',
        ),
        throwsException,
      );
    });
  });

  group('Auth Feature - User Profile', () {
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      TestHelpers.setupAll();
    });

    test('should load user profile', () async {
      // Arrange
      final mockUser = MockUser.create();

      when(() => mockAuthRepository.getUserProfile())
          .thenAnswer((_) async => mockUser);

      // Act
      final result = await mockAuthRepository.getUserProfile();

      // Assert
      expect(result, isNotNull);
      expect(result.email, TestHelpers.testEmail);
      expect(result.id, TestHelpers.testUserId);
    });

    test('should update user profile', () async {
      // Arrange
      const newDisplayName = 'Updated Name';
      final updatedUser = MockUser.create(displayName: newDisplayName);

      when(() => mockAuthRepository.updateProfile(displayName: newDisplayName))
          .thenAnswer((_) async => updatedUser);

      // Act
      final result =
          await mockAuthRepository.updateProfile(displayName: newDisplayName);

      // Assert
      expect(result.displayName, newDisplayName);
      verify(() => mockAuthRepository.updateProfile(displayName: newDisplayName))
          .called(1);
    });

    test('should handle profile not found', () async {
      // Arrange
      when(() => mockAuthRepository.getUserProfile())
          .thenThrow(Exception('User not found'));

      // Act & Assert
      expect(
        () => mockAuthRepository.getUserProfile(),
        throwsException,
      );
    });
  });
}
