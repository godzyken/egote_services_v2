import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class ISentryService {
  Future<void> initialize();
  Future<void> configureFlutterErrorHandling();
  Future<void> initBinding();

  void addBreadcrumb({
    required String message,
    String? category,
    Map<String, dynamic>? data,
    SentryLevel? level,
  });

  void addPartialStackFrameFilters();

  Future<void> trackComplexFlow();
  Future<void> testSendMessage();
  Future<void> testSendException();

  Future<void> traceTask({
    required String name,
    required Future<void> Function(ISentrySpan span) task,
    Map<String, dynamic>? samplingContext,
  });

  void setUserContext(String userId, String? email);
  Future<void> captureError(dynamic error, [StackTrace? stackTrace]);
  Future<void> wrapWithSentry(Future<void> Function() task);

  Future<void> configureSentry(ProviderContainer container);
}
