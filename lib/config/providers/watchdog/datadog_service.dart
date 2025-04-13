import 'dart:developer' as developer;

import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DatadogService {
  static final DatadogService _instance = DatadogService._internal();
  factory DatadogService() => _instance;
  DatadogService._internal();

  late final DatadogSdk _datadog;
  bool _isInitialized = false;

  DatadogLogger? _logger;

  late final Ref _ref;

  void setRef(Ref ref) => _ref = ref;

  Future<void> init() async {
    if (_isInitialized) return;

    final configAsync = _ref.read(datadogConfigProvider);
    if (configAsync is! AsyncData<DatadogConfiguration>) {
      await _ref.read(datadogConfigProvider.future); // 🧠 attend la future
    }

    final config = _ref.read(datadogConfigProvider).value;
    if (config == null) return;

    await DatadogSdk.runApp(
      DatadogConfiguration(
        clientToken: config.clientToken,
        env: config.env,
        site: config.site,
      ),
      TrackingConsent.granted,
      () {},
    );

    _datadog = DatadogSdk.instance;

    _logger = _datadog.logs?.createLogger(DatadogLoggerConfiguration(
      name: 'egote_logger',
      remoteLogThreshold: LogLevel.warning,
    ));

    // Ajout d'attributs RUM
    _datadog.rum?.addAttribute('env', config.env);
    _logger?.addTag('env', config.env);

    _isInitialized = true;
    developer.log('✅ Datadog initialized');
  }

  void logInfo(String message, {Map<String, Object?>? attributes}) async {
    if (!_isInitialized) return;
    _logger?.info(message, attributes: attributes!);
  }

  void logError(String message, Object? error, StackTrace? stackTrace,
      {Map<String, Object?>? attributes}) {
    if (!_isInitialized) return;
    _logger?.error(message,
        errorKind: error.runtimeType.toString(),
        errorMessage: error.toString(),
        errorStackTrace: stackTrace,
        attributes: attributes!);
  }

  void logErrorWithSentry(
      String message, Object? error, StackTrace? stackTrace) {
    logError(message, error, stackTrace);
    Sentry.captureException(error, stackTrace: stackTrace);
  }

  void startView(String name) {
    _datadog.rum?.startView(name);
  }

  void stopView(String name) {
    _datadog.rum?.stopView(name);
  }

  void addUserAction(String actionName) {
    _datadog.rum?.addAction(RumActionType.tap, actionName);
  }

  void setUser({
    required String id,
    String? name,
    String? email,
    Map<String, Object?>? extra,
  }) {
    _datadog.setUserInfo(
      id: id,
      name: name,
      email: email,
      extraInfo: extra!,
    );
  }

  Future<T> trackResource<T>({
    required String key,
    required String url,
    required Future<T> Function() action,
    RumHttpMethod? method = RumHttpMethod.get,
    RumResourceType type = RumResourceType.fetch,
  }) async {
    if (!_isInitialized) {
      throw Exception('Datadog track resource not initialized');
    }

    _datadog.rum?.startResource(key, method!, url);

    try {
      final result = await action();
      _datadog.rum?.stopResource(key, 200, type);
      return result;
    } catch (e) {
      _datadog.rum?.stopResourceWithErrorInfo(
        key,
        e.toString(),
        e.runtimeType.toString(),
      );
      rethrow;
    }
  }

  Future<T> traceWithSentry<T>(
      String name, Future<T> Function() callback) async {
    if (!_isInitialized) {
      throw Exception('trace with sentry not initialized');
    }

    // await Future.delayed(const Duration(seconds: 1)); final span = _datadog.traces?.startSpan(name);

    final span = Sentry.getSpan()?.startChild(name);

    try {
      final result = await callback();
      span?.finish(status: const SpanStatus.ok());
      return result;
    } catch (e) {
      span?.throwable = e;
      span?.finish(status: const SpanStatus.internalError());
      rethrow;
    } finally {
      span?.finish();
    }
  }

  Future<void> trackSupabaseCall(
      String methodName, Future<void> Function() task) async {
    _datadog.rum?.startResource(methodName, RumHttpMethod.get,
        'https://supabase.com', {'attributes': RumResourceType.native});

    try {
      await task();
      _datadog.rum?.stopResource(methodName, 200, RumResourceType.native);
    } catch (e, s) {
      _datadog.rum?.stopResourceWithErrorInfo(
          methodName, e.runtimeType.toString(), s.toString());
      logErrorWithSentry('Error in trackSupabaseCall', e, s);
      rethrow;
    }
  }
}

final datadogServiceProvider = Provider<DatadogService>((ref) {
  final datadogService = DatadogService();
  datadogService.setRef(ref);
  return datadogService;
});
