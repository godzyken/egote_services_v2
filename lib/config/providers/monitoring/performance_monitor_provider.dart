import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import '../sentry/riverpod_performance_monitor.dart';

final performanceMonitorProvider = Provider<RiverpodPerformanceMonitor>((ref) {
  final container = ref.read(containerProvider);
  final monitor = RiverpodPerformanceMonitor(container);

  // On observe tous les FutureProvider pour capturer leur exécution
  ref.listen<AsyncValue<dynamic>>(firebaseInitProvider, (previous, next) {
    if (next is AsyncLoading) {
      monitor.startProviderTimer(firebaseAuthProvider);
    } else if (next is AsyncData) {
      monitor.stopProviderTimer(supabaseInitProvider, next.value);
    } else if (next is AsyncError) {
      monitor.stopProviderTimer(sharedPreferencesProvider, next.error);
    }
  });

  return monitor;
});
