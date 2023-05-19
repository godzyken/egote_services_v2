import 'package:egote_services_v2/config/environements/safe_convert.dart';

class Environment {
  Environment(
      {required this.supabaseUrl,
      required this.supabaseAnonKey,
      String? supabaseAuthCallbackUrlHostname});

  final String supabaseUrl;
  final String supabaseAnonKey;
  String? supabaseAuthCallbackUrlHostname;

  factory Environment.fromJson(Map<String, dynamic> json) => Environment(
      supabaseUrl: asT<String>(json, 'url'),
      supabaseAnonKey: asT<String>(json, 'anon_key'),
      supabaseAuthCallbackUrlHostname: asT<String>(json, 'hostname'));
}
