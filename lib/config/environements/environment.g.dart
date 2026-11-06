// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Environment _$EnvironmentFromJson(Map<String, dynamic> json) => _Environment(
  supabaseUrl: json['supabase_url'] as String,
  supabaseAnonKey: json['supabase_anon_key'] as String,
  supabaseAuthCallbackUrlHostname:
      json['supabase_auth_callback_url_hostname'] as String?,
  appId: json['app_id'] as String,
  authKey: json['auth_key'] as String,
  authSecret: json['auth_secret'] as String,
  vapidKey: json['vapid_key'] as String,
  outpoint: json['outpoint'] as String,
  clientToken: json['client_token'] as String,
  site: json['site'] as String,
  applicationId: json['application_id'] as String,
  firstPartyHost: (json['first_party_host'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$EnvironmentToJson(_Environment instance) =>
    <String, dynamic>{
      'supabase_url': instance.supabaseUrl,
      'supabase_anon_key': instance.supabaseAnonKey,
      'supabase_auth_callback_url_hostname':
          instance.supabaseAuthCallbackUrlHostname,
      'app_id': instance.appId,
      'auth_key': instance.authKey,
      'auth_secret': instance.authSecret,
      'vapid_key': instance.vapidKey,
      'outpoint': instance.outpoint,
      'client_token': instance.clientToken,
      'site': instance.site,
      'application_id': instance.applicationId,
      'first_party_host': instance.firstPartyHost,
    };
