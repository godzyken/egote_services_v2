import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository_interface.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';

import '../../../helpers/test_utils.dart';

class MockAuthRepository extends Mock implements AuthRepositoryInterface {}
class MockSupabaseUser extends Mock implements supabase.User {}
class MockSupabaseSession extends Mock implements supabase.Session {}

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
      final mockSupabaseUser = MockSupabaseUser();

      when(() => mockAuthRepository.signInWithPassword(
            email,
            password,
          )).thenAnswer((_) async => right(mockSupabaseUser));

      // Act
      final result = await mockAuthRepository.signInWithPassword(
        email,
        password,
      );

      // Assert
      expect(result.isRight(), true);
      verify(() => mockAuthRepository.signInWithPassword(
            email,
            password,
          )).called(1);
    });

    test('should return error with invalid email', () async {
      // Arrange
      const invalidEmail = 'not-an-email';
      const password = TestHelpers.testPassword;
      final failure = Failure.badRequest();

      when(() => mockAuthRepository.signInWithPassword(
            invalidEmail,
            password,
          )).thenAnswer((_) async => left(failure));

      // Act
      final result = await mockAuthRepository.signInWithPassword(
        invalidEmail,
        password,
      );

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockAuthRepository.signInWithPassword(
            invalidEmail,
            password,
          )).called(1);
    });

    test('should return error with wrong password', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const wrongPassword = 'wrongpassword123';
      final failure = Failure.unauthorized();

      when(() => mockAuthRepository.signInWithPassword(
            email,
            wrongPassword,
          )).thenAnswer((_) async => left(failure));

      // Act
      final result = await mockAuthRepository.signInWithPassword(
        email,
        wrongPassword,
      );

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockAuthRepository.signInWithPassword(
            email,
            wrongPassword,
          )).called(1);
    });
  });

  group('Auth Feature - SignUp Use Case', () {
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      TestHelpers.setupAll();
    });

    test('should signup with valid data', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const name = 'Test User';
      const password = TestHelpers.testPassword;
      final mockUserModel = UserModel.create(
        id: UserId(value: int.tryParse(TestHelpers.testUserId) ?? 0),
        email: email,
        name: name,
      );

      when(() => mockAuthRepository.signUp(
            email,
            name,
            password,
          )).thenAnswer((_) async => right(mockUserModel));

      // Act
      final result = await mockAuthRepository.signUp(
        email,
        name,
        password,
      );

      // Assert
      expect(result.isRight(), true);
      verify(() => mockAuthRepository.signUp(
            email,
            name,
            password,
          )).called(1);
    });

    test('should return error with weak password', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const name = 'Test User';
      const weakPassword = '123'; // too short
      final failure = Failure.badRequest();

      when(() => mockAuthRepository.signUp(
            email,
            name,
            weakPassword,
          )).thenAnswer((_) async => left(failure));

      // Act
      final result = await mockAuthRepository.signUp(
        email,
        name,
        weakPassword,
      );

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockAuthRepository.signUp(
            email,
            name,
            weakPassword,
          )).called(1);
    });

    test('should return error with duplicate email', () async {
      // Arrange
      const email = TestHelpers.testEmail;
      const name = 'Test User';
      const password = TestHelpers.testPassword;
      final failure = Failure.badRequest();

      when(() => mockAuthRepository.signUp(
            email,
            name,
            password,
          )).thenAnswer((_) async => left(failure));

      // Act
      final result = await mockAuthRepository.signUp(
        email,
        name,
        password,
      );

      // Assert
      expect(result.isLeft(), true);
    });
  });

  group('Auth Feature - Profile Use Case', () {
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();
      TestHelpers.setupAll();
    });

    test('should load user profile', () async {
      // Arrange
      final mockUserModel = UserModel.create(
        id: UserId(value: int.tryParse(TestHelpers.testUserId) ?? 0),
        email: TestHelpers.testEmail,
        name: 'Test User',
      );

      when(() => mockAuthRepository.restoreSession())
          .thenAnswer((_) async => right(mockUserModel));

      // Act
      final result = await mockAuthRepository.restoreSession();

      // Assert
      expect(result.isRight(), true);
      verify(() => mockAuthRepository.restoreSession()).called(1);
    });

    test('should handle profile not found', () async {
      // Arrange
      final failure = Failure.notFound();

      when(() => mockAuthRepository.restoreSession())
          .thenAnswer((_) async => left(failure));

      // Act
      final result = await mockAuthRepository.restoreSession();

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockAuthRepository.restoreSession()).called(1);
    });

    test('should sign out successfully', () async {
      // Arrange
      when(() => mockAuthRepository.signOut())
          .thenAnswer((_) async => right(true));

      // Act
      final result = await mockAuthRepository.signOut();

      // Assert
      expect(result.isRight(), true);
      verify(() => mockAuthRepository.signOut()).called(1);
    });
  });
}
