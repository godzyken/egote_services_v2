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
  /// [outPoint] is the connectycube outpoint v2

  const factory Environment({
    required String supabaseUrl,
    required String supabaseAnonKey,
    String? supabaseAuthCallbackUrlHostname,
    required String appId,
    required String authKey,
    required String authSecret,
    required String vapidKey,
    required String outPoint,
  }) = _Environment;

  ///
  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}
