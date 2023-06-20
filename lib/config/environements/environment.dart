import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment.freezed.dart';
part 'environment.g.dart';

@freezed
class Environment with _$Environment {
  /// Default constructor for the [Environment] model
  /// [supabaseUrl] is the url of the Supabase environment
  /// [supabaseAnonKey] is the anon_key for Supabase

  const factory Environment({
    required String supabaseUrl,
    required String supabaseAnonKey,
    String? supabaseAuthCallbackUrlHostname,
  }) = _Environment;

  ///
  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}
