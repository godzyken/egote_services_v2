import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as supabase;

import '../../environements/environment.dart';
import '../../environements/flavors.dart';

// <---------------- Supabase Instances Providers -------------------> //

final supabaseInitProvider = FutureProvider<supabase.Supabase>(
        (ref) async {
      final configFile = await rootBundle.loadString(F.envFileName);
      final env = Environment.fromJson(json.decode(configFile) as Map<String, dynamic>);

      final client = supabase.GoTrueClient(
        url: env.supabaseUrl,
        autoRefreshToken: true,
        headers: {
          "apiKey": env.supabaseAnonKey,
          "Authorization": "Bearer ${env.supabaseAnonKey}",
        },
      );

      return await supabase.Supabase.initialize(
        url: env.supabaseUrl,
        anonKey: env.supabaseAnonKey,
        authFlowType: supabase.AuthFlowType.pkce,
        debug: kDebugMode,
        authCallbackUrlHostname: env.supabaseAuthCallbackUrlHostname,
        headers: client.headers,
      );
    },
    name: 'Initialisation de supabase provider'
);

final supabaseProvider = Provider<supabase.Supabase>((ref) => supabase.Supabase.instance);

final supabaseClientProvider = Provider<supabase.SupabaseClient>(
        (ref) => ref.read(supabaseInitProvider).asData!.value.client,
    dependencies: [supabaseProvider, supabaseInitProvider],
    name: 'Supabase Client Provider');
