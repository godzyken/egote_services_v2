import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment.freezed.dart';
part 'environment.g.dart';

@freezed
class Environment with _$Environment {
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
}
