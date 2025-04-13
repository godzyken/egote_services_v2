import 'dart:developer' as developer;

import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../../config/providers/watchdog/datadog_logger_helper.dart';

final userControllerProvider = Provider<UserController>((ref) {
  final logger = ref.read(datadogLoggerHelperProvider);
  final supabase = ref.watch(supabaseClientProvider);
  return UserController(logger: logger, supabase: supabase);
});

class UserController {
  final DatadogLoggerHelper logger;
  final SupabaseClient supabase;

  UserController({
    required this.logger,
    required this.supabase,
  });

  Future<UserEntityModel> loadUserProfile(String userId) async {
    logger.info('🔄 Start loading user profile...', extra: {'userId': userId});

    // trace + RUM resource pour Datadog, + span Sentry
    return await logger.trace('load-user-profile', () async {
      return await logger.trackApiCall('load-user-profile', () async {
        try {
          final res =
              await supabase.from('users').select().eq('id', userId).single();

          if (res.isEmpty) {
            throw Exception('No user found');
          }

          developer.log('👤 User loaded: ${res['name']}');
          logger.info('✅ User loaded', extra: {
            'userId': userId,
            'username': res['name'],
          });

          return UserEntityModel.fromMap(res);
        } on PostgrestException catch (e, stack) {
          logger.error(
              '🚨 Supabase error: ${e.message}',
              extra: {'userId': userId},
              e,
              stack);
          rethrow;
        }
      });
    });
  }
}
