import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'datadog_service.dart';

class DatadogLoggerHelper {
  final DatadogService _datadog;

  DatadogLoggerHelper(this._datadog);

  void info(String message, {Map<String, Object?>? extra}) {
    _datadog.logInfo(message, attributes: extra);
  }

  void error(String message, Object error, StackTrace stack,
      {Map<String, Object?>? extra}) {
    _datadog.logError(message, error, stack,
        attributes: {...?extra, 'level': 'error'});
  }

  void warn(String message, {Map<String, Object?>? attributes}) {
    _datadog.logInfo('[WARN] $message', attributes: {
      ...?attributes,
      'level': 'warning',
    });
  }

  void errorWithSentry(String message, Object error, StackTrace stack,
      {Map<String, Object?>? attributes}) {
    _datadog.logErrorWithSentry(message, error, stack);
  }

  void userAction(String name, {Map<String, Object?>? attributes}) {
    _datadog.addUserAction(name);
  }

  Future<T> trackApiCall<T>(String name, Future<T> Function() task,
      {String url = 'https://api.egote.com'}) async {
    return await _datadog.trackResource<T>(
      key: name,
      url: url,
      action: task,
      method: RumHttpMethod.get,
      type: RumResourceType.native,
    );
  }

  Future<T> trace<T>(String name, Future<T> Function() task) async {
    return await _datadog.traceWithSentry<T>(name, task);
  }

  Future<void> resource({
    required String key,
    required String url,
    required Future<void> Function() task,
    RumHttpMethod method = RumHttpMethod.get,
    RumResourceType type = RumResourceType.native,
  }) async {
    await _datadog.trackResource(
        key: key, url: url, method: method, type: type, action: task);
  }
}

final datadogLoggerHelperProvider = Provider<DatadogLoggerHelper>((ref) {
  final datadogService = ref.watch(datadogServiceProvider);
  return DatadogLoggerHelper(datadogService);
});
