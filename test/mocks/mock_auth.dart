import 'package:mocktail/mocktail.dart';

/// Mock AuthService for testing
class MockAuthService extends Mock {
  Future<void> login(String email, String password) async {
    return Future.value();
  }

  Future<void> logout() async {
    return Future.value();
  }

  Future<String?> getToken() async {
    return 'mock_token_123';
  }

  Stream<String?> get authStateChanges => Stream.empty();
}

/// Mock User model for testing
class MockUser {
  final String id;
  final String email;
  final String displayName;

  MockUser({
    this.id = 'test_user_123',
    this.email = 'test@example.com',
    this.displayName = 'Test User',
  });

  factory MockUser.create({
    String? id,
    String? email,
    String? displayName,
  }) {
    return MockUser(
      id: id ?? 'test_user_123',
      email: email ?? 'test@example.com',
      displayName: displayName ?? 'Test User',
    );
  }
}
