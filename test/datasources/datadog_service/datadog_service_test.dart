import 'package:egote_services_v2/config/providers/sentry/sentry_provider.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_service.dart';
import 'package:egote_services_v2/config/services/app_telemetry_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSentryService extends Mock implements SentryService {}

class MockDatadogService extends Mock implements DatadogService {}

void main() {
  late ProviderContainer container;
  late MockSentryService mockSentry;
  late MockDatadogService mockDatadog;

  setUp(() {
    mockSentry = MockSentryService();
    mockDatadog = MockDatadogService();

    container = ProviderContainer(
      overrides: [
        sentryServiceProvider.overrideWithValue(mockSentry),
        datadogServiceProvider.overrideWithValue(mockDatadog),
      ],
    );
  });

  test('trackAll should call both Sentry and Datadog when enabled', () async {
    when(() => mockSentry.isEnabled).thenReturn(true);
    when(() => mockDatadog.isEnabled).thenReturn(true);
    when(() => mockSentry.trackEvent(any(), any())).thenAnswer((_) async {});
    when(() => mockDatadog.trackEvent(any(), any())).thenAnswer((_) async {});

    final telemetry = container.read(telemetryManagerProvider);
    telemetry.trackAll('test_event', {'foo': 'bar'});

    verify(() => mockSentry.trackEvent('test_event', {'foo': 'bar'})).called(1);
    verify(() => mockDatadog.trackEvent('test_event', {'foo': 'bar'}))
        .called(1);
  });

  test('trackAll should not call services when disabled', () async {
    when(() => mockSentry.isEnabled).thenReturn(false);
    when(() => mockDatadog.isEnabled).thenReturn(false);

    final telemetry = container.read(telemetryManagerProvider);
    telemetry.trackAll('test_event');

    verifyNever(() => mockSentry.trackEvent(any(), any()));
    verifyNever(() => mockDatadog.trackEvent(any(), any()));
  });
}
