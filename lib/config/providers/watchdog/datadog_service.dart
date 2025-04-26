import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../environements/flavors.dart';
import '../../services/app_telemetry_service.dart';

class DatadogService extends AppTelemetryService with TelemetryMixin {
  static final DatadogService _instance = DatadogService._internal();
  factory DatadogService() => _instance;
  DatadogService._internal();

  late final DatadogSdk _datadog;
  bool _isInitialized = false;

  DatadogLogger? _logger;

  late final Ref _ref;

  void setRef(Ref ref) => _ref = ref;

  @override
  bool get isEnabled => switch (F.appFlavor) {
        Flavor.production => true,
        Flavor.development => true,
        Flavor.local => false,
      };

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
    logDebug('✅ Datadog initialized');
  }

  @override
  Future<void> trackEvent(String eventName,
      [Map<String, dynamic>? params]) async {
    if (!isEnabled || !_isInitialized) return;
    _datadog.rum?.addAction(RumActionType.custom, eventName);
    _logger?.info('[EVENT] $eventName', attributes: params ?? {});
  }

  @override
  Future<void> trackError(dynamic error, [StackTrace? stackTrace]) async {
    if (!isEnabled || !_isInitialized) return;
    _logger?.error(
      '[ERROR] ${error.toString()}',
      errorKind: error.runtimeType.toString(),
      errorStackTrace: stackTrace,
    );
    await Sentry.captureException(error, stackTrace: stackTrace);
  }

  @override
  Future<T> trace<T>(String name, Future<T> Function() task) async {
    if (!isEnabled || !_isInitialized) return await task();

    final span = Sentry.getSpan()?.startChild(name);
    final stopwatch = Stopwatch()..start();

    try {
      final result = await task();
      span?.finish(status: const SpanStatus.ok());
      await trackEvent(
          '$name:success', {'duration': stopwatch.elapsed.inMilliseconds});
      return result;
    } catch (e, s) {
      span?.throwable = e;
      span?.finish(status: const SpanStatus.internalError());
      await trackError(e, s);
      rethrow;
    }
  }

  Future<void> logErrorWithSentry(
    dynamic error, {
    StackTrace? stackTrace,
    String? contextMessage,
  }) async {
    if (!isEnabled || !_isInitialized) return;

    final message = contextMessage != null
        ? '[ERROR CONTEXT] $contextMessage\n$error'
        : '[ERROR] ${error.toString()}';

    _logger?.error(
      message,
      errorKind: error.runtimeType.toString(),
      errorStackTrace: stackTrace,
    );

    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  }

  void startView(String name) {
    if (!isEnabled || !_isInitialized) return;
    _datadog.rum?.startView(name);
  }

  void stopView(String name) {
    if (!isEnabled || !_isInitialized) return;

    _datadog.rum?.stopView(name);
  }

  void addUserAction(String actionName) {
    if (!isEnabled || !_isInitialized) return;

    _datadog.rum?.addAction(RumActionType.tap, actionName);
  }

  void setUserContext({
    required String id,
    String? name,
    String? email,
    Map<String, Object?>? extra,
  }) {
    if (!isEnabled || !_isInitialized) return;

    _datadog.setUserInfo(
      id: id,
      name: name,
      email: email,
      extraInfo: extra ?? {},
    );
  }

  Future<T> trackResource<T>({
    required String key,
    required String url,
    required Future<T> Function() action,
    RumHttpMethod? method = RumHttpMethod.get,
    RumResourceType type = RumResourceType.fetch,
  }) async {
    if (!isEnabled || !_isInitialized) return await action();

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
      trackError(e);
      rethrow;
    }
  }
}

final datadogServiceProvider = Provider<DatadogService>((ref) {
  final datadogService = DatadogService();
  datadogService.setRef(ref);
  return datadogService;
});
