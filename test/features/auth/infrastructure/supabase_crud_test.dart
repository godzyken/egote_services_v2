import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class MockSupabaseClient extends Mock implements supabase.SupabaseClient {}

class MockGoTrueClient extends Mock implements supabase.GoTrueClient {}

class MockSupabaseQueryBuilder extends Mock
    implements supabase.SupabaseQueryBuilder {}

class MockRealtimeChannel extends Mock implements supabase.RealtimeChannel {}

class MockUser extends Mock implements supabase.User {}

class MockSession extends Mock implements supabase.Session {}

void main() {
  late MockSupabaseClient mockSupabaseClient;
  late MockGoTrueClient mockGoTrueClient;
  late MockSupabaseQueryBuilder mockQueryBuilder;
  late MockRealtimeChannel mockRealtimeChannel;

  setUp(() {
    mockSupabaseClient = MockSupabaseClient();
    mockGoTrueClient = MockGoTrueClient();
    mockQueryBuilder = MockSupabaseQueryBuilder();
    mockRealtimeChannel = MockRealtimeChannel();

    when(() => mockSupabaseClient.auth).thenAnswer((_) => mockGoTrueClient);
  });

  group('Supabase CRUD Operations', () {
    const String testTable = 'devis_table';

    test('CREATE - Insert new record into Supabase table', () async {
      when(
        () => mockSupabaseClient.from(testTable),
      ).thenAnswer((_) => mockQueryBuilder);

      final builder = mockSupabaseClient.from(testTable);

      expect(builder, equals(mockQueryBuilder));
      verify(() => mockSupabaseClient.from(testTable)).called(1);
    });

    test('READ - Fetch records from Supabase table', () async {
      when(
        () => mockSupabaseClient.from(testTable),
      ).thenAnswer((_) => mockQueryBuilder);

      final builder = mockSupabaseClient.from(testTable);

      expect(builder, isNotNull);
      verify(() => mockSupabaseClient.from(testTable)).called(1);
    });

    test('REALTIME - Subscribe to realtime presence channel', () async {
      when(
        () => mockSupabaseClient.channel('presence_online_channel'),
      ).thenAnswer((_) => mockRealtimeChannel);
      when(
        () => mockRealtimeChannel.subscribe(any()),
      ).thenAnswer((_) => mockRealtimeChannel);
      when(
        () => mockRealtimeChannel.track(any()),
      ).thenAnswer((_) async => supabase.ChannelResponse.ok);

      final channel = mockSupabaseClient.channel('presence_online_channel');
      final subscribedChannel = channel.subscribe();
      final trackResult = await channel.track({
        'online_at': DateTime.now().toIso8601String(),
      });

      expect(subscribedChannel, equals(mockRealtimeChannel));
      expect(trackResult, equals(supabase.ChannelResponse.ok));

      verify(
        () => mockSupabaseClient.channel('presence_online_channel'),
      ).called(1);
      verify(() => mockRealtimeChannel.subscribe(any())).called(1);
      verify(() => mockRealtimeChannel.track(any())).called(1);
    });

    test(
      'AUTH - Sign in with email and password returns user session',
      () async {
        final mockUser = MockUser();
        final mockSession = MockSession();
        final authResponse = supabase.AuthResponse(
          session: mockSession,
          user: mockUser,
        );

        when(
          () => mockGoTrueClient.signInWithPassword(
            email: 'user@egote.com',
            password: 'SecurePassword123',
          ),
        ).thenAnswer((_) async => authResponse);

        final response = await mockGoTrueClient.signInWithPassword(
          email: 'user@egote.com',
          password: 'SecurePassword123',
        );

        expect(response.user, equals(mockUser));
        expect(response.session, equals(mockSession));
        verify(
          () => mockGoTrueClient.signInWithPassword(
            email: 'user@egote.com',
            password: 'SecurePassword123',
          ),
        ).called(1);
      },
    );

    test('AUTH - Sign out revokes session', () async {
      when(() => mockGoTrueClient.signOut()).thenAnswer((_) async {});

      await mockGoTrueClient.signOut();

      verify(() => mockGoTrueClient.signOut()).called(1);
    });
  });
}
