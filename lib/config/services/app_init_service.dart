import 'dart:async';
import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers/sentry/riverpod_performance_monitor.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../environements/flavors.dart';
import '../providers/firebase/firebase_providers.dart';
import '../providers/sentry/sentry_provider.dart';
import '../providers/supabase/supabase_providers.dart';
import 'app_telemetry_service.dart';

part 'app_init_service.g.dart';

@riverpod
class AppInitService extends _$AppInitService {
  final List<String> _debugTrace = [];
  final Stopwatch _stopwatch = Stopwatch();
  final Map<String, Duration> _timings = {};

  @override
  Future<void> build() async {
    _stopwatch.start();

    return await _safeInit(() async {
      if (kDebugMode) developer.log('⏳ Init AppInitService...');

      await _initSentry();
      await _initFirebaseAndSupabase();
      await _initSupabaseAuth();
      _initMonitoringServices();

      _logPerformanceReport();
      if (kDebugMode) {
        developer.log('✅ AppInitService initialized successfully.');
      }
    });
  }

  Future<void> _initSentry() async {
    final sentry = ref.read(sentryServiceProvider);
    if (sentry.isEnabled) {
      await _safeInit(() => logSentryServices(sentry), label: 'Sentry');
    }
  }

  Future<void> _initFirebaseAndSupabase() async {
    final firebaseFuture = ref.watch(firebaseInitProvider.future);
    final supabaseFuture = ref.watch(supabaseInitProvider.future);

    final results = await Future.wait([
      _safeInit(() => firebaseFuture, label: 'Firebase'),
      _safeInit(() => supabaseFuture, label: 'Supabase'),
    ]);

    final firebase = results[0] as FirebaseApp;
    await _safeInit(() => logFirebaseServices(firebase, ref),
        label: 'Firebase');

    final supabase = results[1] as SupabaseClient;
    ref.read(supabaseClientNotifierProvider.notifier).setClient(supabase);
  }

  Future<void> _initSupabaseAuth() async {
    final supabase = ref.read(supabaseClientProvider);
    await ref.read(telemetryManagerProvider).trace('SupabaseAuthInit',
        () async {
      supabase.auth.startAutoRefresh();
    });
  }

  void _initMonitoringServices() {
    Future.microtask(() async {
      await ref.read(datadogServiceProvider).init();
      RiverpodPerformanceMonitor(ref.container);
    });
  }

  Future<T> _safeInit<T>(Future<T> Function() action,
      {String? label,
      int retries = 3,
      Duration delay = const Duration(seconds: 2)}) async {
    final String step = label ?? action.toString();
    final Stopwatch stepWatch = Stopwatch()..start();

    int attempt = 0;
    while (attempt < retries) {
      try {
        developer.log('⏳ Init [$step] (attempt ${attempt + 1})...');
        final result = await action();
        stepWatch.stop();

        developer.log(
            '✅ [$step] initialized in ${stepWatch.elapsedMilliseconds} ms');
        _debugTrace.add('$step (SUCCESS)');
        _timings[step] = stepWatch.elapsed;

        return result;
      } catch (e, st) {
        attempt++;

        if (attempt == retries) {
          stepWatch.stop();
          _timings[step] = stepWatch.elapsed;

          developer.log(
              '❌ [$step] init failedin ${stepWatch.elapsedMilliseconds} ms : $e',
              error: e,
              stackTrace: st);
          _debugTrace.add('$step (ERROR)');
          rethrow;
        } else {
          developer.log(
              '⚠️ [$step] failed (attempt $attempt), retrying in ${delay.inSeconds}s...');
          await Future.delayed(delay);
        }
      }
    }
    throw Exception('Max retries reached');
  }

  Future<void> logFirebaseServices(FirebaseApp app, Ref ref) async {
    final firestore = ref.read(firebaseFirestoreProvider(app));
    final auth = ref.read(firebaseAuthProvider(app));
    final db = ref.read(firebaseDatabaseProvider(app));
    final messaging = ref.read(firebaseMessagingProvider);

    developer.log('[Log] ✅ Firestore: ${firestore.app.name}');
    developer.log('[Log] ✅ Auth ready: ${auth.currentUser?.uid}');
    developer.log('[Log] ✅ Database URL: ${db.databaseURL}');
    messaging.getToken().then((token) {
      developer.log('[Log] ✅ Messaging token: $token');
    });

    db.setLoggingEnabled(true);
    await auth.setPersistence(Persistence.LOCAL);
    await messaging.setAutoInitEnabled(true);
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
      providesAppNotificationSettings: true,
      announcement: true,
      criticalAlert: true,
    );
  }

  Future<void> logSentryServices(SentryService s) async {
    await s.initBinding();
    await s.initialize();
    await s.configureFlutterErrorHandling();
    await s.configureSentry(ref.container);

    developer.log('[Log] ✅ Sentry binding prêt');
    developer.log('[Log] ✅ Sentry sentry prêt');
    developer.log('[Log] ✅ Sentry flutter prêt');
    developer.log('[Log] ✅ Sentry scope prêt');
  }

  void _logPerformanceReport() async {
    _stopwatch.stop();

    final telemetry = ref.read(telemetryManagerProvider);
    final packageInfo = await PackageInfo.fromPlatform();

    final Map<String, dynamic> performanceData = {
      'init_total_ms': _stopwatch.elapsedMilliseconds,
      'services': _timings.map((k, v) => MapEntry(k, '${v.inMilliseconds}ms')),
      'trace': _debugTrace,
      'flavor': F.appFlavor.name,
      'platform': defaultTargetPlatform.name,
      'package_info': {
        'name': packageInfo.appName,
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
        'buildSignature': packageInfo.buildSignature,
        'packageName': packageInfo.packageName,
      },
      'debug_mode': kDebugMode,
    };

    developer.log('\n📊 --- Rapport de performance de l\'init ---');
    performanceData['services'].forEach((k, v) {
      developer.log('⏳ $k : $v');
    });

    developer.log('🚀 Total : ${_stopwatch.elapsedMilliseconds} ms');

    telemetry.trackAll('app_init_performance', performanceData);
  }
}
