import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';

class MockGoTrueClient extends Mock implements supabase.GoTrueClient {}
class MockSupabaseClient extends Mock implements supabase.SupabaseClient {}
class MockAuthTokenLocalDataSource extends Mock implements AuthTokenLocalDataSource {}
class MockAuthResponse extends Mock implements supabase.AuthResponse {}
class MockUser extends Mock implements supabase.User {}
class MockSession extends Mock implements supabase.Session {}

void main() {
  late AuthRepository repository;
  late MockGoTrueClient mockGoTrueClient;
  late MockSupabaseClient mockSupabaseClient;
  late MockAuthTokenLocalDataSource mockLocalDataSource;

  setUp(() {
    mockGoTrueClient = MockGoTrueClient();
    mockSupabaseClient = MockSupabaseClient();
    mockLocalDataSource = MockAuthTokenLocalDataSource();
    
    repository = AuthRepository(
      mockLocalDataSource,
      mockGoTrueClient,
      mockSupabaseClient,
      supabase.GenerateLinkType.signup,
    );
  });

  group('AuthRepository', () {
    const email = 'test@example.com';
    const password = 'password123';

    test('signInWithPassword success', () async {
      final mockResponse = MockAuthResponse();
      final mockUser = MockUser();
      final mockSession = MockSession();

      when(() => mockUser.toJson()).thenReturn({'id': '123'});
      when(() => mockSession.accessToken).thenReturn('token');
      when(() => mockSession.providerRefreshToken).thenReturn('refresh');
      when(() => mockResponse.user).thenReturn(mockUser);
      when(() => mockResponse.session).thenReturn(mockSession);

      when(() => mockGoTrueClient.signInWithPassword(
        email: email,
        password: password,
      )).thenAnswer((_) async => mockResponse);
      
      when(() => mockLocalDataSource.store(any())).thenAnswer((_) async => true);

      final result = await repository.signInWithPassword(email, password);

      expect(result.isRight(), true);
      verify(() => mockLocalDataSource.store(any())).called(1);
    });

    test('signInWithPassword failure (no user)', () async {
      final mockResponse = MockAuthResponse();
      when(() => mockResponse.user).thenReturn(null);
      when(() => mockResponse.session).thenReturn(null);

      when(() => mockGoTrueClient.signInWithPassword(
        email: email,
        password: password,
      )).thenAnswer((_) async => mockResponse);
      
      when(() => mockLocalDataSource.remove()).thenAnswer((_) async => true);

      final result = await repository.signInWithPassword(email, password);

      expect(result.isLeft(), true);
    });

    test('signOut success', () async {
      when(() => mockLocalDataSource.remove()).thenAnswer((_) async => true);
      when(() => mockGoTrueClient.signOut()).thenAnswer((_) async => {});

      final result = await repository.signOut();

      expect(result.isRight(), true);
      verify(() => mockLocalDataSource.remove()).called(1);
      verify(() => mockGoTrueClient.signOut()).called(1);
    });
  });
}
