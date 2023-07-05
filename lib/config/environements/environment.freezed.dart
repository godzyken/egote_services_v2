// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return _Environment.fromJson(json);
}

/// @nodoc
mixin _$Environment {
  String get supabaseUrl => throw _privateConstructorUsedError;
  String get supabaseAnonKey => throw _privateConstructorUsedError;
  String? get supabaseAuthCallbackUrlHostname =>
      throw _privateConstructorUsedError;
  String get appId => throw _privateConstructorUsedError;
  String get authKey => throw _privateConstructorUsedError;
  String get authSecret => throw _privateConstructorUsedError;
  String get vapidKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnvironmentCopyWith<Environment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentCopyWith<$Res> {
  factory $EnvironmentCopyWith(
          Environment value, $Res Function(Environment) then) =
      _$EnvironmentCopyWithImpl<$Res, Environment>;
  @useResult
  $Res call(
      {String supabaseUrl,
      String supabaseAnonKey,
      String? supabaseAuthCallbackUrlHostname,
      String appId,
      String authKey,
      String authSecret,
      String vapidKey});
}

/// @nodoc
class _$EnvironmentCopyWithImpl<$Res, $Val extends Environment>
    implements $EnvironmentCopyWith<$Res> {
  _$EnvironmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supabaseUrl = null,
    Object? supabaseAnonKey = null,
    Object? supabaseAuthCallbackUrlHostname = freezed,
    Object? appId = null,
    Object? authKey = null,
    Object? authSecret = null,
    Object? vapidKey = null,
  }) {
    return _then(_value.copyWith(
      supabaseUrl: null == supabaseUrl
          ? _value.supabaseUrl
          : supabaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      supabaseAnonKey: null == supabaseAnonKey
          ? _value.supabaseAnonKey
          : supabaseAnonKey // ignore: cast_nullable_to_non_nullable
              as String,
      supabaseAuthCallbackUrlHostname: freezed ==
              supabaseAuthCallbackUrlHostname
          ? _value.supabaseAuthCallbackUrlHostname
          : supabaseAuthCallbackUrlHostname // ignore: cast_nullable_to_non_nullable
              as String?,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      authKey: null == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as String,
      authSecret: null == authSecret
          ? _value.authSecret
          : authSecret // ignore: cast_nullable_to_non_nullable
              as String,
      vapidKey: null == vapidKey
          ? _value.vapidKey
          : vapidKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnvironmentCopyWith<$Res>
    implements $EnvironmentCopyWith<$Res> {
  factory _$$_EnvironmentCopyWith(
          _$_Environment value, $Res Function(_$_Environment) then) =
      __$$_EnvironmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String supabaseUrl,
      String supabaseAnonKey,
      String? supabaseAuthCallbackUrlHostname,
      String appId,
      String authKey,
      String authSecret,
      String vapidKey});
}

/// @nodoc
class __$$_EnvironmentCopyWithImpl<$Res>
    extends _$EnvironmentCopyWithImpl<$Res, _$_Environment>
    implements _$$_EnvironmentCopyWith<$Res> {
  __$$_EnvironmentCopyWithImpl(
      _$_Environment _value, $Res Function(_$_Environment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supabaseUrl = null,
    Object? supabaseAnonKey = null,
    Object? supabaseAuthCallbackUrlHostname = freezed,
    Object? appId = null,
    Object? authKey = null,
    Object? authSecret = null,
    Object? vapidKey = null,
  }) {
    return _then(_$_Environment(
      supabaseUrl: null == supabaseUrl
          ? _value.supabaseUrl
          : supabaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      supabaseAnonKey: null == supabaseAnonKey
          ? _value.supabaseAnonKey
          : supabaseAnonKey // ignore: cast_nullable_to_non_nullable
              as String,
      supabaseAuthCallbackUrlHostname: freezed ==
              supabaseAuthCallbackUrlHostname
          ? _value.supabaseAuthCallbackUrlHostname
          : supabaseAuthCallbackUrlHostname // ignore: cast_nullable_to_non_nullable
              as String?,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
      authKey: null == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as String,
      authSecret: null == authSecret
          ? _value.authSecret
          : authSecret // ignore: cast_nullable_to_non_nullable
              as String,
      vapidKey: null == vapidKey
          ? _value.vapidKey
          : vapidKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Environment implements _Environment {
  const _$_Environment(
      {required this.supabaseUrl,
      required this.supabaseAnonKey,
      this.supabaseAuthCallbackUrlHostname,
      required this.appId,
      required this.authKey,
      required this.authSecret,
      required this.vapidKey});

  factory _$_Environment.fromJson(Map<String, dynamic> json) =>
      _$$_EnvironmentFromJson(json);

  @override
  final String supabaseUrl;
  @override
  final String supabaseAnonKey;
  @override
  final String? supabaseAuthCallbackUrlHostname;
  @override
  final String appId;
  @override
  final String authKey;
  @override
  final String authSecret;
  @override
  final String vapidKey;

  @override
  String toString() {
    return 'Environment(supabaseUrl: $supabaseUrl, supabaseAnonKey: $supabaseAnonKey, supabaseAuthCallbackUrlHostname: $supabaseAuthCallbackUrlHostname, appId: $appId, authKey: $authKey, authSecret: $authSecret, vapidKey: $vapidKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Environment &&
            (identical(other.supabaseUrl, supabaseUrl) ||
                other.supabaseUrl == supabaseUrl) &&
            (identical(other.supabaseAnonKey, supabaseAnonKey) ||
                other.supabaseAnonKey == supabaseAnonKey) &&
            (identical(other.supabaseAuthCallbackUrlHostname,
                    supabaseAuthCallbackUrlHostname) ||
                other.supabaseAuthCallbackUrlHostname ==
                    supabaseAuthCallbackUrlHostname) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.authKey, authKey) || other.authKey == authKey) &&
            (identical(other.authSecret, authSecret) ||
                other.authSecret == authSecret) &&
            (identical(other.vapidKey, vapidKey) ||
                other.vapidKey == vapidKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, supabaseUrl, supabaseAnonKey,
      supabaseAuthCallbackUrlHostname, appId, authKey, authSecret, vapidKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnvironmentCopyWith<_$_Environment> get copyWith =>
      __$$_EnvironmentCopyWithImpl<_$_Environment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnvironmentToJson(
      this,
    );
  }
}

abstract class _Environment implements Environment {
  const factory _Environment(
      {required final String supabaseUrl,
      required final String supabaseAnonKey,
      final String? supabaseAuthCallbackUrlHostname,
      required final String appId,
      required final String authKey,
      required final String authSecret,
      required final String vapidKey}) = _$_Environment;

  factory _Environment.fromJson(Map<String, dynamic> json) =
      _$_Environment.fromJson;

  @override
  String get supabaseUrl;
  @override
  String get supabaseAnonKey;
  @override
  String? get supabaseAuthCallbackUrlHostname;
  @override
  String get appId;
  @override
  String get authKey;
  @override
  String get authSecret;
  @override
  String get vapidKey;
  @override
  @JsonKey(ignore: true)
  _$$_EnvironmentCopyWith<_$_Environment> get copyWith =>
      throw _privateConstructorUsedError;
}
