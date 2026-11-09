import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'flavors.dart';

part 'environment.freezed.dart';
part 'environment.g.dart';

@freezed
abstract class Environment with _$Environment {
  /// Default constructor for the [Environment] model
  /// [supabaseUrl] is the url of the Supabase environment
  /// [supabaseAnonKey] is the anon_key for Supabase
  /// [appId] is the application id for CubeSettings
  /// [authKey] is the authorization key for CubeSettings
  /// [authSecret] is the authorization secret for CubeSettings
  /// [outpoint] is the connectycube outpoint v2
  /// [clientToken] is the token for datadog initialisation
  /// [site] is the datadog site location
  /// [applicationId] is the id app for datadog
  /// [firstPartyHost] is the uri entre point to datadog analise

  const factory Environment({
    required String supabaseUrl,
    required String supabaseAnonKey,
    String? supabaseAuthCallbackUrlHostname,
    required String appId,
    required String authKey,
    required String authSecret,
    required String vapidKey,
    required String outpoint,
    required String clientToken,
    required String site,
    required String applicationId,
    required List<String>? firstPartyHost,
  }) = _Environment;

  ///
  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  static Future<Environment> load() async {
    try {
      final configFile = await rootBundle.loadString(
        F.envFileName,
        cache: false,
      );
      if (configFile.trim().startsWith('<!DOCTYPE') ||
          configFile.trim().startsWith('<html')) {
        debugPrint(
          '⚠️ [Env] Asset loader returned HTML (SPA routing fallback) for ${F.envFileName}. Using default dev environment.',
        );
        return _defaultDevelopmentEnvironment();
      }
      final decoded = json.decode(configFile);
      if (decoded is Map) {
        return Environment.fromJson(Map<String, dynamic>.from(decoded));
      }
    } catch (e) {
      debugPrint(
        '⚠️ [Env] Error loading ${F.envFileName}: $e. Using default dev environment.',
      );
    }
    return _defaultDevelopmentEnvironment();
  }

  static Environment _defaultDevelopmentEnvironment() {
    return const Environment(
      supabaseUrl: 'https://development.supabase.co',
      supabaseAnonKey: 'dev-anon-key-placeholder',
      appId: 'dev-app-id',
      authKey: 'dev-auth-key',
      authSecret: 'dev-auth-secret',
      vapidKey: 'dev-vapid-key',
      outpoint: 'dev-outpoint',
      clientToken: 'pub_dev_token_placeholder',
      site: 'eu1',
      applicationId: '99911285-5746-429f-8168-b7b05c9db5fb',
      firstPartyHost: ['development.supabase.co'],
    );
  }
}
