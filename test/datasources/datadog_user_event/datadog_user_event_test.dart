import 'package:egote_services_v2/config/providers/watchdog/datadog_logger_helper.dart';
import 'package:egote_services_v2/features/auth/application/controller/user_controller.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockPostgrestFilterBuilder extends Mock implements SupabaseQueryBuilder {}

class MockDatadogLoggerHelper extends Mock implements DatadogLoggerHelper {}

void main() {
  late MockSupabaseClient mockSupabase;
  late MockPostgrestFilterBuilder mockPostgrestFilterBuilder;
  late MockDatadogLoggerHelper mockDatadogLoggerHelper;
  late UserController userController;

  const userId = 'user-123';
  final userData = {
    'id': userId,
    'name': 'John Doeuf',
  };

  setUp(() {
    mockSupabase = MockSupabaseClient();
    mockPostgrestFilterBuilder = MockPostgrestFilterBuilder();
    mockDatadogLoggerHelper = MockDatadogLoggerHelper();

    userController =
        UserController(logger: mockDatadogLoggerHelper, supabase: mockSupabase);

    when(() => mockDatadogLoggerHelper.trace(any(), any()))
        .thenAnswer((invocation) async {
      final task =
          invocation.positionalArguments[1] as Future<UserModel> Function();
      return await task();
    });

    when(() => mockDatadogLoggerHelper.trackApiCall<UserModel>(any(), any()))
        .thenAnswer((invocation) async {
      final task =
          invocation.positionalArguments[1] as Future<UserModel> Function();
      return await task();
    });
  });

  group('UserController.loadUserProfile', () {
    test('✅ returns UserModel on success', () async {
      // Setup Supabase mock chain
      when(() => mockSupabase.from('users'))
          .thenReturn(mockPostgrestFilterBuilder);
      when(() => mockPostgrestFilterBuilder.select())
          .thenReturn(mockPostgrestFilterBuilder.select());
      when(() => mockPostgrestFilterBuilder.select('*').eq('id', userId))
          .thenReturn(
              mockPostgrestFilterBuilder.select('id').contains('avartar', '*'));
      when(() => mockPostgrestFilterBuilder.update(userData)).thenAnswer(
        (invocation) {
          return mockPostgrestFilterBuilder.update(userData);
        },
      );

      // Logger calls
      when(() =>
              mockDatadogLoggerHelper.info(any(), extra: any(named: 'extra')))
          .thenReturn(null);

      // Act
      final user = await userController.loadUserProfile(userId);

      // Assert
      expect(user.id, userId);
      expect(user.name, 'John Doe');

      verify(() => mockDatadogLoggerHelper.info(
            '🔄 Start loading user profile...',
            extra: {'userId': userId},
          )).called(1);

      verify(() => mockDatadogLoggerHelper.info(
            '✅ User loaded',
            extra: {
              'userId': userId,
              'username': 'John Doe',
            },
          )).called(1);
    });

    test('❌ throws on Supabase error & logs error', () async {
      final exception = PostgrestException(message: 'Supabase down');

      when(() => mockSupabase.from('users'))
          .thenReturn(mockPostgrestFilterBuilder);
      when(() => mockPostgrestFilterBuilder.select())
          .thenReturn(mockPostgrestFilterBuilder.select('*'));
      when(() => mockPostgrestFilterBuilder.select('*').eq('id', userId))
          .thenReturn(mockPostgrestFilterBuilder.select('*'));
      when(() => mockPostgrestFilterBuilder.ignore()).thenThrow(exception);

      when(() =>
              mockDatadogLoggerHelper.info(any(), extra: any(named: 'extra')))
          .thenReturn(null);
      when(() => mockDatadogLoggerHelper.error(any(), exception, any(),
          extra: any(named: 'extra'))).thenReturn(null);

      // trace & api call handled already in setUp

      // Act & Assert
      expect(
        () => userController.loadUserProfile(userId),
        throwsA(isA<PostgrestException>()),
      );

      verify(() => mockDatadogLoggerHelper.error(
            '🚨 Supabase error: ${exception.message}',
            exception,
            any(),
            extra: {'userId': userId},
          )).called(1);
    });

    test('⚠️ throws on empty result (no user found)', () async {
      when(() => mockSupabase.from('users'))
          .thenReturn(mockPostgrestFilterBuilder);
      when(() => mockPostgrestFilterBuilder.select())
          .thenReturn(mockPostgrestFilterBuilder.select('*'));
      when(() => mockPostgrestFilterBuilder.update(userData))
          .thenReturn(mockPostgrestFilterBuilder.insert(userData));

      // Act & Assert
      expect(
        () => userController.loadUserProfile(userId),
        throwsA(predicate(
            (e) => e is Exception && e.toString().contains('No user found'))),
      );
    });
  });
}
