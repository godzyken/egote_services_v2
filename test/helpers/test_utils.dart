import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Common test utilities for egote_services_v2
class TestHelpers {
  /// Setup test environment
  static void setupAll() {
    // Register fallback values
    registerFallbackValue({});
  }

  /// Common auth test data
  static const String testEmail = 'test@example.com';
  static const String testPassword = 'TestPassword123!';
  static const String testUserId = 'test_user_123';
  static const String testArtisanId = 'artisan_123';
}

class MockAsync<T> {
  T? value;
  Exception? error;
  bool isLoading = false;

  MockAsync({this.value, this.error, this.isLoading = false});
}
