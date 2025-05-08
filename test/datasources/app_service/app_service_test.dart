import 'package:egote_services_v2/config/environements/flavors.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_provider.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/services/app_init_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProviderContainer container;
  late MockSentryService mockSentry;
  late MockFirebaseApp mockFirebaseApp;
  late MockSupabase mockSupabase;
  late MockGoTrueClient mockGoTrueClient;
  late MockSupabaseInitResult mockSupabaseInitResult;
  late MockRef mockRef;

  setUpAll(() async {
    F.appFlavor = Flavor.development;
    mockFirebaseApp = MockFirebaseApp();
    when(() => mockFirebaseApp.name).thenReturn('mock_firebase_app');
    //Firebase?.apps = [mockFirebaseApp];
  });

  setUp(() {
    mockSentry = MockSentryService();

    mockSupabaseInitResult = MockSupabaseInitResult();
    mockGoTrueClient = MockGoTrueClient();
    mockSupabase = MockSupabase();
    mockRef = MockRef();

    container = ProviderContainer(overrides: [
      sentryServiceProvider.overrideWithValue(mockSentry),
      firebaseInitProviderProvider.overrideWith((ref) async => mockFirebaseApp),
      supabaseInitProvider
          .overrideWith((ref) async => mockSupabaseInitResult.client),
    ]);

    // Mocking Sentry and Firebase behaviors
    when(() => Firebase.initializeApp()).thenAnswer(
      (_) async => mockFirebaseApp,
    );

    when(() => mockSentry.isEnabled).thenReturn(true);
    when(() => mockFirebaseApp.name).thenReturn('mock_firebase_app');

    registerFallbackValue(MockRef()); // Register the fallback value if needed
    registerFallbackValue(MockGoTrueClient());
    registerFallbackValue(MockSupabase());
    registerFallbackValue(MockSupabaseClient());
    registerFallbackValue(MockSentryService());
  });

  tearDown(() {
    container.dispose();
  });

  test('AppInitService initializes successfully', () async {
    // Mock behavior for Sentry initialization
    when(() => mockSentry.initialize()).thenAnswer((_) async {});
    when(() => mockSentry.configureFlutterErrorHandling())
        .thenAnswer((_) async {});
    when(() => mockSentry.configureSentry(any())).thenAnswer((_) async {});

    // Get the service and run the build method
    final service = container.read(appInitServiceProvider.notifier);

    await service.build();

    // Verify that Sentry initialization methods are called
    verify(() => Firebase.initializeApp()).called(1);

    verify(() => mockSentry.initialize()).called(1);
    verify(() => mockSentry.configureSentry(any())).called(1);

    expect(Firebase.apps.isNotEmpty, true);
  });

  test('AppInitService throws when Firebase init fails', () async {
    final errorContainer = ProviderContainer(overrides: [
      sentryServiceProvider.overrideWithValue(mockSentry),
      firebaseInitProviderProvider.overrideWith((ref) async =>
          throw Exception("Firebase error")), // Simulating Firebase error
      supabaseInitProvider
          .overrideWith((ref) async => mockSupabaseInitResult.client),
    ]);

    final service = errorContainer.read(appInitServiceProvider.notifier);

    when(() => mockSentry.initialize()).thenAnswer((_) async {});
    when(() => mockSentry.configureFlutterErrorHandling())
        .thenAnswer((_) async {});
    when(() => mockSupabaseInitResult.initSupabase())
        .thenAnswer((_) async => mockSupabase);

    // Assert that the build method throws an exception
    expect(() async => await service.build(), throwsException);

    // Verify that Firebase-related methods are called, even if Firebase initialization fails
    verify(() => mockSupabaseInitResult.initSupabase()).called(1);

    // Verify that Sentry methods are still called even in case of failure
    verify(() => mockSentry.initialize()).called(1);
    verify(() => mockSentry.configureFlutterErrorHandling()).called(1);
  });
}
