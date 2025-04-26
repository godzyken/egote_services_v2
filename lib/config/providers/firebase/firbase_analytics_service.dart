/*
import 'package:flutter/cupertino.dart';

import '../../services/app_telemetry_service.dart';

class FirebaseAnalyticsService extends AppTelemetryService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  bool get isEnabled => true;

  @override
  Future<void> trackEvent(String name, [Map<String, dynamic>? params]) {
    return _analytics.logEvent(name: name, parameters: params);
  }

  @override
  Future<void> trackError(dynamic error, [StackTrace? stackTrace]) async {
    // Optionnel : tu peux faire un log custom dans Firebase
    debugPrint('FirebaseAnalyticsService: Error tracked');
  }
}*/
