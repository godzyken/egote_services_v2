import 'dart:async';
import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers/sentry/riverpod_performance_monitor.dart';
import 'package:egote_services_v2/config/providers/sentry/sentry_service.dart';
import 'package:egote_services_v2/config/providers/watchdog/datadog_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
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
  final Stopwatch _stopwatch = Stopwatch();
  final List<String> _debugTrace = [];
  final Map<String, Duration> _timings = {};

  @override
  Future<void> build() async {
    _stopwatch.start();
    return await _safeInit(() async {
      if (kDebugMode) _log('⏳ Starting AppInitService...');

      await _initSentry();
      await _initFirebaseAndSupabase();
      await _initSupabaseAuth();
      await _initMonitoring();

      await _logPerformance();
      if (kDebugMode) _log('✅ AppInitService initialized successfully.');
    });
  }

  Future<void> _initSentry() async {
    final sentry = ref.read(sentryServiceProvider);
    if (sentry.isEnabled) {
      await _safeInit(() => _configureSentry(sentry), label: 'Sentry');
    }
  }

  Future<void> _configureSentry(SentryService s) async {
    await s.initialize();
    await s.configureFlutterErrorHandling();
    await s.configureSentry(ref.container);
    _log('[Log] ✅ Sentry initialized from configureSentry');
  }

  Future<void> _initFirebaseAndSupabase() async {
    _log('⏳ Awaiting firebaseInitProvider...');
    final firebaseFuture = await ref.watch(firebaseInitProviderProvider.future);
    _log('✅ Got firebase instance: ${firebaseFuture.name}');

    final supabaseFuture = await ref.watch(supabaseInitProvider.future);

    final results = await Future.wait([
      _safeInit(() async {
        _log('⏳ Initializing Firebase...');
        return firebaseFuture;
      }, label: 'Firebase'),
      _safeInit(() async {
        _log('⏳ Initializing Supabase...');
        return supabaseFuture;
      }, label: 'Supabase'),
    ]);

    final firebase = results[0];
    if (firebase is! FirebaseApp) {
      throw Exception('Firebase initialization failed, Got: $firebase');
    }

    final supabase = results[1];
    if (supabase is! SupabaseClient) {
      throw Exception('Supabase initialization failed, Got: $supabase');
    }

    await _safeInit(() => _configureFirebase(firebase),
        label: 'Firebase Services');
    ref.read(supabaseClientNotifierProvider.notifier).setClient(supabase);
  }

  Future<void> _configureFirebase(FirebaseApp app) async {
    final firestore = ref.read(firebaseFirestoreProvider(app));
    final auth = ref.read(firebaseAuthProvider(app));
    final db = ref.read(firebaseDatabaseProvider(app));
    final messaging = ref.read(firebaseMessagingProvider);

    _log('[Log] ✅ Firestore: ${firestore.app.name}');
    _log('[Log] ✅ Auth: ${auth.currentUser?.uid}');
    _log('[Log] ✅ DB URL: ${db.databaseURL}');

    await auth.setPersistence(Persistence.LOCAL);
    db.setLoggingEnabled(true);
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

    final token = await messaging.getToken();
    _log('[Log] ✅ Messaging token: $token');
  }

  Future<void> _initSupabaseAuth() async {
    final supabase = ref.read(supabaseClientProvider);
    await ref.read(telemetryManagerProvider).trace('SupabaseAuthInit',
        () async {
      supabase.auth.startAutoRefresh();
    });
  }

  Future<void> _initMonitoring() async {
    Future.microtask(() async {
      await ref.read(datadogServiceProvider).init();
      RiverpodPerformanceMonitor(ref.container);
    });
  }

  Future<void> _logPerformance() async {
    _stopwatch.stop();
    final telemetry = ref.read(telemetryManagerProvider);
    final packageInfo = await PackageInfo.fromPlatform();

    final Map<String, dynamic> data = {
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

    _log('\n📊 --- App Init Performance ---');
    data['services'].forEach((k, v) => _log('⏳ $k : $v'));
    _log('🚀 Total : ${_stopwatch.elapsedMilliseconds} ms');

    telemetry.trackAll('app_init_performance', data);
  }

  Future<T> _safeInit<T>(
    Future<T> Function() action, {
    String? label,
    int retries = 3,
    Duration delay = const Duration(seconds: 2),
  }) async {
    final String step = label ?? action.toString();
    final Stopwatch stepWatch = Stopwatch()..start();
    int attempt = 0;

    while (attempt < retries) {
      try {
        _log('⏳ Init [$step] (attempt ${attempt + 1})...');
        final result = await action();
        stepWatch.stop();

        _log('✅ [$step] done in ${stepWatch.elapsedMilliseconds} ms');
        _timings[step] = stepWatch.elapsed;
        _debugTrace.add('$step (SUCCESS)');
        return result;
      } catch (e, st) {
        attempt++;
        if (attempt == retries) {
          stepWatch.stop();
          _log('❌ [$step] failed in ${stepWatch.elapsedMilliseconds} ms : $e',
              error: e, stackTrace: st);
          _timings[step] = stepWatch.elapsed;
          _debugTrace.add('$step (ERROR)');
          rethrow;
        } else {
          _log(
              '⚠️ [$step] failed (attempt $attempt), retrying in ${delay.inSeconds}s...');
          await Future.delayed(delay);
        }
      }
    }
    throw Exception('Max retries reached for $step');
  }

  void _log(String msg, {Object? error, StackTrace? stackTrace}) {
    developer.log(msg, error: error, stackTrace: stackTrace);
  }
}
