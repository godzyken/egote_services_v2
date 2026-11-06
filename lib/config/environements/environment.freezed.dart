// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Environment {

  String get supabaseUrl;

  String get supabaseAnonKey;

  String? get supabaseAuthCallbackUrlHostname;

  String get appId;

  String get authKey;

  String get authSecret;

  String get vapidKey;

  String get outpoint;

  String get clientToken;

  String get site;

  String get applicationId;

  List<String>? get firstPartyHost;

  /// Create a copy of Environment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnvironmentCopyWith<Environment> get copyWith =>
      _$EnvironmentCopyWithImpl<Environment>(this as Environment, _$identity);

  /// Serializes this Environment to a JSON map.
  Map<String, dynamic> toJson();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Environment &&
            (identical(other.supabaseUrl, supabaseUrl) ||
                other.supabaseUrl == supabaseUrl) &&
            (identical(other.supabaseAnonKey, supabaseAnonKey) ||
                other.supabaseAnonKey == supabaseAnonKey) && (identical(
            other.supabaseAuthCallbackUrlHostname,
            supabaseAuthCallbackUrlHostname) ||
            other.supabaseAuthCallbackUrlHostname ==
                supabaseAuthCallbackUrlHostname) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.authKey, authKey) || other.authKey == authKey) &&
            (identical(other.authSecret, authSecret) ||
                other.authSecret == authSecret) &&
            (identical(other.vapidKey, vapidKey) ||
                other.vapidKey == vapidKey) &&
            (identical(other.outpoint, outpoint) ||
                other.outpoint == outpoint) &&
            (identical(other.clientToken, clientToken) ||
                other.clientToken == clientToken) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            const DeepCollectionEquality().equals(
                other.firstPartyHost, firstPartyHost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          supabaseUrl,
          supabaseAnonKey,
          supabaseAuthCallbackUrlHostname,
          appId,
          authKey,
          authSecret,
          vapidKey,
          outpoint,
          clientToken,
          site,
          applicationId,
          const DeepCollectionEquality().hash(firstPartyHost));

  @override
  String toString() {
    return 'Environment(supabaseUrl: $supabaseUrl, supabaseAnonKey: $supabaseAnonKey, supabaseAuthCallbackUrlHostname: $supabaseAuthCallbackUrlHostname, appId: $appId, authKey: $authKey, authSecret: $authSecret, vapidKey: $vapidKey, outpoint: $outpoint, clientToken: $clientToken, site: $site, applicationId: $applicationId, firstPartyHost: $firstPartyHost)';
  }


}

/// @nodoc
abstract mixin class $EnvironmentCopyWith<$Res> {
  factory $EnvironmentCopyWith(Environment value,
      $Res Function(Environment) _then) = _$EnvironmentCopyWithImpl;

  @useResult
  $Res call({
    String supabaseUrl, String supabaseAnonKey, String? supabaseAuthCallbackUrlHostname, String appId, String authKey, String authSecret, String vapidKey, String outpoint, String clientToken, String site, String applicationId, List<
        String>? firstPartyHost
  });


}

/// @nodoc
class _$EnvironmentCopyWithImpl<$Res>
    implements $EnvironmentCopyWith<$Res> {
  _$EnvironmentCopyWithImpl(this._self, this._then);

  final Environment _self;
  final $Res Function(Environment) _then;

  /// Create a copy of Environment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? supabaseUrl = null, Object? supabaseAnonKey = null, Object? supabaseAuthCallbackUrlHostname = freezed, Object? appId = null, Object? authKey = null, Object? authSecret = null, Object? vapidKey = null, Object? outpoint = null, Object? clientToken = null, Object? site = null, Object? applicationId = null, Object? firstPartyHost = freezed,}) {
    return _then(_self.copyWith(
      supabaseUrl: null == supabaseUrl
          ? _self.supabaseUrl
          : supabaseUrl // ignore: cast_nullable_to_non_nullable
      as String,
      supabaseAnonKey: null == supabaseAnonKey
          ? _self.supabaseAnonKey
          : supabaseAnonKey // ignore: cast_nullable_to_non_nullable
      as String,
      supabaseAuthCallbackUrlHostname: freezed ==
          supabaseAuthCallbackUrlHostname
          ? _self.supabaseAuthCallbackUrlHostname
          : supabaseAuthCallbackUrlHostname // ignore: cast_nullable_to_non_nullable
      as String?,
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
      as String,
      authKey: null == authKey
          ? _self.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
      as String,
      authSecret: null == authSecret
          ? _self.authSecret
          : authSecret // ignore: cast_nullable_to_non_nullable
      as String,
      vapidKey: null == vapidKey
          ? _self.vapidKey
          : vapidKey // ignore: cast_nullable_to_non_nullable
      as String,
      outpoint: null == outpoint
          ? _self.outpoint
          : outpoint // ignore: cast_nullable_to_non_nullable
      as String,
      clientToken: null == clientToken
          ? _self.clientToken
          : clientToken // ignore: cast_nullable_to_non_nullable
      as String,
      site: null == site
          ? _self.site
          : site // ignore: cast_nullable_to_non_nullable
      as String,
      applicationId: null == applicationId
          ? _self.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
      as String,
      firstPartyHost: freezed == firstPartyHost
          ? _self.firstPartyHost
          : firstPartyHost // ignore: cast_nullable_to_non_nullable
      as List<String>?,
    ));
  }

}


/// Adds pattern-matching-related methods to [Environment].
extension EnvironmentPatterns on Environment {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  TResult Function( _Environment value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _Environment() when $default != null:
  return $default(_that);case _:
  return orElse();

  }
  }
  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Environment value) $default,){
  final _that = this;
  switch (_that) {
  case _Environment():
  return $default(_that);case _:
  throw StateError('Unexpected subclass');

  }
  }
  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Environment value)? $default,){
  final _that = this;
  switch (_that) {
  case _Environment() when $default != null:
  return $default(_that);case _:
  return null;

  }
  }
  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String supabaseUrl, String supabaseAnonKey, String? supabaseAuthCallbackUrlHostname, String appId, String authKey, String authSecret, String vapidKey, String outpoint, String clientToken, String site, String applicationId, List<String>? firstPartyHost)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _Environment() when $default != null:
  return $default(_that.supabaseUrl,_that.supabaseAnonKey,_that.supabaseAuthCallbackUrlHostname,_that.appId,_that.authKey,_that.authSecret,_that.vapidKey,_that.outpoint,_that.clientToken,_that.site,_that.applicationId,_that.firstPartyHost);case _:
  return orElse();

  }
  }
  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String supabaseUrl, String supabaseAnonKey, String? supabaseAuthCallbackUrlHostname, String appId, String authKey, String authSecret, String vapidKey, String outpoint, String clientToken, String site, String applicationId, List<String>? firstPartyHost) $default,) {final _that = this;
  switch (_that) {
  case _Environment():
  return $default(_that.supabaseUrl,_that.supabaseAnonKey,_that.supabaseAuthCallbackUrlHostname,_that.appId,_that.authKey,_that.authSecret,_that.vapidKey,_that.outpoint,_that.clientToken,_that.site,_that.applicationId,_that.firstPartyHost);case _:
  throw StateError('Unexpected subclass');

  }
  }
  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String supabaseUrl, String supabaseAnonKey, String? supabaseAuthCallbackUrlHostname, String appId, String authKey, String authSecret, String vapidKey, String outpoint, String clientToken, String site, String applicationId, List<String>? firstPartyHost)? $default,) {final _that = this;
  switch (_that) {
  case _Environment() when $default != null:
  return $default(_that.supabaseUrl,_that.supabaseAnonKey,_that.supabaseAuthCallbackUrlHostname,_that.appId,_that.authKey,_that.authSecret,_that.vapidKey,_that.outpoint,_that.clientToken,_that.site,_that.applicationId,_that.firstPartyHost);case _:
  return null;

  }
  }

}

/// @nodoc
@JsonSerializable()
class _Environment implements Environment {
  const _Environment(
      {required this.supabaseUrl, required this.supabaseAnonKey, this.supabaseAuthCallbackUrlHostname, required this.appId, required this.authKey, required this.authSecret, required this.vapidKey, required this.outpoint, required this.clientToken, required this.site, required this.applicationId, required final List<
          String>? firstPartyHost}) : _firstPartyHost = firstPartyHost;

  factory _Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  @override final String supabaseUrl;
  @override final String supabaseAnonKey;
  @override final String? supabaseAuthCallbackUrlHostname;
  @override final String appId;
  @override final String authKey;
  @override final String authSecret;
  @override final String vapidKey;
  @override final String outpoint;
  @override final String clientToken;
  @override final String site;
  @override final String applicationId;
  final List<String>? _firstPartyHost;

  @override List<String>? get firstPartyHost {
    final value = _firstPartyHost;
    if (value == null) return null;
    if (_firstPartyHost is EqualUnmodifiableListView) return _firstPartyHost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }


  /// Create a copy of Environment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnvironmentCopyWith<_Environment> get copyWith =>
      __$EnvironmentCopyWithImpl<_Environment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnvironmentToJson(this,);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Environment &&
            (identical(other.supabaseUrl, supabaseUrl) ||
                other.supabaseUrl == supabaseUrl) &&
            (identical(other.supabaseAnonKey, supabaseAnonKey) ||
                other.supabaseAnonKey == supabaseAnonKey) && (identical(
            other.supabaseAuthCallbackUrlHostname,
            supabaseAuthCallbackUrlHostname) ||
            other.supabaseAuthCallbackUrlHostname ==
                supabaseAuthCallbackUrlHostname) &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.authKey, authKey) || other.authKey == authKey) &&
            (identical(other.authSecret, authSecret) ||
                other.authSecret == authSecret) &&
            (identical(other.vapidKey, vapidKey) ||
                other.vapidKey == vapidKey) &&
            (identical(other.outpoint, outpoint) ||
                other.outpoint == outpoint) &&
            (identical(other.clientToken, clientToken) ||
                other.clientToken == clientToken) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.applicationId, applicationId) ||
                other.applicationId == applicationId) &&
            const DeepCollectionEquality().equals(
                other._firstPartyHost, _firstPartyHost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          supabaseUrl,
          supabaseAnonKey,
          supabaseAuthCallbackUrlHostname,
          appId,
          authKey,
          authSecret,
          vapidKey,
          outpoint,
          clientToken,
          site,
          applicationId,
          const DeepCollectionEquality().hash(_firstPartyHost));

  @override
  String toString() {
    return 'Environment(supabaseUrl: $supabaseUrl, supabaseAnonKey: $supabaseAnonKey, supabaseAuthCallbackUrlHostname: $supabaseAuthCallbackUrlHostname, appId: $appId, authKey: $authKey, authSecret: $authSecret, vapidKey: $vapidKey, outpoint: $outpoint, clientToken: $clientToken, site: $site, applicationId: $applicationId, firstPartyHost: $firstPartyHost)';
  }


}

/// @nodoc
abstract mixin class _$EnvironmentCopyWith<$Res>
    implements $EnvironmentCopyWith<$Res> {
  factory _$EnvironmentCopyWith(_Environment value,
      $Res Function(_Environment) _then) = __$EnvironmentCopyWithImpl;

  @override
  @useResult
  $Res call({
    String supabaseUrl, String supabaseAnonKey, String? supabaseAuthCallbackUrlHostname, String appId, String authKey, String authSecret, String vapidKey, String outpoint, String clientToken, String site, String applicationId, List<
        String>? firstPartyHost
  });


}

/// @nodoc
class __$EnvironmentCopyWithImpl<$Res>
    implements _$EnvironmentCopyWith<$Res> {
  __$EnvironmentCopyWithImpl(this._self, this._then);

  final _Environment _self;
  final $Res Function(_Environment) _then;

  /// Create a copy of Environment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? supabaseUrl = null, Object? supabaseAnonKey = null, Object? supabaseAuthCallbackUrlHostname = freezed, Object? appId = null, Object? authKey = null, Object? authSecret = null, Object? vapidKey = null, Object? outpoint = null, Object? clientToken = null, Object? site = null, Object? applicationId = null, Object? firstPartyHost = freezed,}) {
    return _then(_Environment(
      supabaseUrl: null == supabaseUrl
          ? _self.supabaseUrl
          : supabaseUrl // ignore: cast_nullable_to_non_nullable
      as String,
      supabaseAnonKey: null == supabaseAnonKey
          ? _self.supabaseAnonKey
          : supabaseAnonKey // ignore: cast_nullable_to_non_nullable
      as String,
      supabaseAuthCallbackUrlHostname: freezed ==
          supabaseAuthCallbackUrlHostname
          ? _self.supabaseAuthCallbackUrlHostname
          : supabaseAuthCallbackUrlHostname // ignore: cast_nullable_to_non_nullable
      as String?,
      appId: null == appId
          ? _self.appId
          : appId // ignore: cast_nullable_to_non_nullable
      as String,
      authKey: null == authKey
          ? _self.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
      as String,
      authSecret: null == authSecret
          ? _self.authSecret
          : authSecret // ignore: cast_nullable_to_non_nullable
      as String,
      vapidKey: null == vapidKey
          ? _self.vapidKey
          : vapidKey // ignore: cast_nullable_to_non_nullable
      as String,
      outpoint: null == outpoint
          ? _self.outpoint
          : outpoint // ignore: cast_nullable_to_non_nullable
      as String,
      clientToken: null == clientToken
          ? _self.clientToken
          : clientToken // ignore: cast_nullable_to_non_nullable
      as String,
      site: null == site
          ? _self.site
          : site // ignore: cast_nullable_to_non_nullable
      as String,
      applicationId: null == applicationId
          ? _self.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
      as String,
      firstPartyHost: freezed == firstPartyHost
          ? _self._firstPartyHost
          : firstPartyHost // ignore: cast_nullable_to_non_nullable
      as List<String>?,
    ));
  }


}

// dart format on
