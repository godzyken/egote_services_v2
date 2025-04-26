import 'package:freezed_annotation/freezed_annotation.dart';

import 'flavors.dart';

part 'environment.freezed.dart';
part 'environment.g.dart';

@freezed
abstract class Environment with _$Environment {
  /// Default constructor for the [Environment] model
  /// [Flavors] is the current flavor of the application
  /// [supabaseUrl] is the url of the Supabase environment
  /// [supabaseAnonKey] is the anon_key for Supabase
  /// [supabaseAuthCallbackUrlHostname] is the supabase auth callback url
  /// [appId] is the application id for CubeSettings
  /// [authKey] is the authorization key for CubeSettings
  /// [authSecret] is the authorization secret for CubeSettings
  /// [outpoint] is the connectycube outpoint v2
  /// [clientToken] is the token for datadog initialisation
  /// [site] is the datadog site location
  /// [applicationId] is the id app for datadog
  /// [firstPartyHost] is the uri entre point to datadog analise
  /// [accessToken] is the accessToken to Supabase
  /// [cubeApiKey] is the apiKey to Connectycube
  /// [chatEndpoint] is the chat endpoint to Connectycube
  /// [materialBankApiKey] is the apiKey to Material Bank
  /// [materialBankBaseUrl] is the baseUrl to Material Bank

  const factory Environment({
    required Flavor appFlavor,
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
    required String accessToken,
    required String cubeApiKey,
    required String chatEndpoint,
    required String materialBankApiKey,
    required String materialBankBaseUrl,
  }) = _Environment;

  ///
  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}
