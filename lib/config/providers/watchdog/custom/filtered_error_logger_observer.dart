import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart'; // optionnel si Sentry est activé

import 'custom_stack_filter.dart';

class FilteredErrorLoggerObserver extends ProviderObserver {
  final CustomRepetitiveStackFrameFilter _stackFilter =
      CustomRepetitiveStackFrameFilter();

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();

    if (previousValue == newValue) return;

    try {
      developer.log('🔁 [Provider Updated] $name');
      debugPrint('''
{
  "provider": "$name",
  "previousValue": "$previousValue",
  "newValue": "$newValue"
}''');
    } catch (error, stack) {
      final filteredStack = _stackFilter.filter(stack.toString());

      developer.log('❌ Error while logging update: $error');
      developer.log('🧹 Filtered stack:\n$filteredStack');

      if (kReleaseMode) {
        Sentry.captureException(error, stackTrace: stack, withScope: (scope) {
          scope.setTag('env', 'development');
          scope.extra;
          scope.user;
          scope.transaction;
          scope.level;
          scope.contexts;
          scope.breadcrumbs;
          scope.span;
          scope.clearBreadcrumbs();
          scope.removeContexts('id');
        });
      }
    }
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    debugPrint('🆕 [Provider Added] $name with value: $value');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final name = provider.name ?? provider.runtimeType.toString();
    debugPrint('♻️ [Provider Disposed] $name');
  }
}
