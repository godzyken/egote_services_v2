import 'package:egote_services_v2/config/environements/flavors.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/launcherconfig/environment_provider.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_provider.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/config/services/app_init_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mocks.dart';

void main() {
  const MethodChannel packageInfoChannel =
      MethodChannel('dev.fluttercommunity.plus/package_info');
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFirebaseApp mockFirebaseApp;
  late MockFirebaseAuth mockAuth;
  late MockFirebaseDatabase mockDb;
  late MockFirebaseMessaging mockMessaging;
  late MockFirebaseFirestore mockFirestore;
  late MockSupabase mockSupabase;
  late MockSupabaseClient mockSupabaseClient;
  late MockSentryService mockSentry;
  late ProviderContainer container;
  late MockEnvironment mockEnv;

  setUpAll(() {
    final binding = TestDefaultBinaryMessengerBinding.instance;

    binding.defaultBinaryMessenger.setMockMethodCallHandler(
      packageInfoChannel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'getAll') {
          return {
            'appName': 'Mock Egote Services App',
            'packageName': 'com.godzy.egote_services_v2',
            'version': '1.0.0',
            'buildNumber': '1',
            'buildSignature': 'mock-signature',
          };
        }
        return null;
      },
    );

    F.reset();
    F.appFlavor = Flavor.development;
  });

  setUp(() {
    mockFirebaseApp = MockFirebaseApp();
    mockAuth = MockFirebaseAuth();
    mockDb = MockFirebaseDatabase();
    mockMessaging = MockFirebaseMessaging();
    mockFirestore = MockFirebaseFirestore();
    mockSupabase = MockSupabase();
    mockSupabaseClient = MockSupabaseClient();
    mockSentry = MockSentryService();
    mockEnv = MockEnvironment();

    container = ProviderContainer();

    registerFallbackValue(ProviderContainer());
    registerFallbackValue(MockSentryService());
    registerFallbackValue(MockFirebaseApp());
    registerFallbackValue(MockFirebaseAuth());
    registerFallbackValue(MockFirebaseDatabase());
    registerFallbackValue(MockFirebaseMessaging());
    registerFallbackValue(MockFirebaseFirestore());
    registerFallbackValue(MockSupabase());
    registerFallbackValue(MockSupabaseClient());
    registerFallbackValue(MockEnvironment());

    // Fallbacks
    registerFallbackValue(Persistence.LOCAL);
    registerFallbackValue(mockSupabaseClient);
    registerFallbackValue(mockFirebaseApp);
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    container.dispose();
  });

  test('✅ AppInitService runs without crashing', () async {
    final container = ProviderContainer(
      overrides: [
        firebaseInitProviderProvider
            .overrideWith((ref) async => mockFirebaseApp),
        supabaseInitProvider.overrideWith((ref) async => mockSupabaseClient),
        firebaseAuthProvider.overrideWith((ref, _) => mockAuth),
        firebaseDatabaseProvider.overrideWith((ref, _) => mockDb),
        firebaseMessagingProvider.overrideWithValue(mockMessaging),
        firebaseFirestoreProvider.overrideWith((ref, _) => mockFirestore),
        sentryServiceProvider.overrideWithValue(mockSentry),
        environmentProvider.overrideWithValue(mockEnv),
      ],
    );

    when(() => mockSentry.isEnabled).thenReturn(true);
    when(() => mockSentry.initialize()).thenAnswer((_) async {});
    when(() => mockSentry.configureFlutterErrorHandling())
        .thenAnswer((_) async {});
    when(() => mockSentry.configureSentry(any())).thenAnswer((_) async {});
    when(() => mockSentry.trackEvent(any(), any())).thenAnswer((_) async {});

    when(() => mockFirebaseApp.name).thenReturn('mock-app');
    when(() => mockSupabase.client).thenReturn(mockSupabaseClient);
    when(() => mockAuth.setPersistence(any())).thenAnswer((_) async {});
    when(() => mockFirestore.app).thenReturn(mockFirebaseApp);
    when(() => mockDb.databaseURL).thenReturn('mock-url');

    when(() => mockMessaging.setAutoInitEnabled(true)).thenAnswer((_) async {});
    when(() => mockMessaging.getToken()).thenAnswer((_) async => 'fake-token');
    when(() => mockMessaging.requestPermission(
              alert: any(named: 'alert'),
              badge: any(named: 'badge'),
              sound: any(named: 'sound'),
              provisional: any(named: 'provisional'),
              providesAppNotificationSettings:
                  any(named: 'providesAppNotificationSettings'),
              announcement: any(named: 'announcement'),
              criticalAlert: any(named: 'criticalAlert'),
            ))
        .thenAnswer((_) async => NotificationSettings(
            alert: AppleNotificationSetting.enabled,
            announcement: AppleNotificationSetting.enabled,
            authorizationStatus: AuthorizationStatus.authorized,
            badge: AppleNotificationSetting.enabled,
            carPlay: AppleNotificationSetting.enabled,
            lockScreen: AppleNotificationSetting.enabled,
            notificationCenter: AppleNotificationSetting.enabled,
            showPreviews: AppleShowPreviewSetting.always,
            timeSensitive: AppleNotificationSetting.enabled,
            criticalAlert: AppleNotificationSetting.enabled,
            sound: AppleNotificationSetting.enabled,
            providesAppNotificationSettings: AppleNotificationSetting.enabled));

    await container.read(appInitServiceProvider.future);

    // Teste ici les effets secondaires attendus si nécessaire
    expect(container.read(appInitServiceProvider), const AsyncData<void>(null));
  });

  test('❌ AppInitService fails if Firebase Auth fails to initialize', () async {
    final container = ProviderContainer(
      overrides: [
        environmentProvider.overrideWithValue(mockEnv),
        firebaseInitProviderProvider
            .overrideWith((ref) async => mockFirebaseApp),
        firebaseAuthProvider.overrideWith((ref, _) =>
            throw FirebaseAuthException(
                message: 'Failed to initialize Firebase Auth', code: '')),
        // Other overrides here
        supabaseInitProvider.overrideWith((ref) async => mockSupabaseClient),
      ],
    );

    when(() => mockFirebaseApp.name).thenReturn('mock-app');

    final app = mockFirebaseApp;
    if (app == null) throw StateError('FirebaseApp is null');
    try {
      await container.read(appInitServiceProvider.future);
      fail('Expected an exception to be thrown');
    } catch (e) {
      expect(e, isA<FirebaseAuthException>());
    }
  });
}
