// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthStates {
  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
  AuthStatus? get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)
        authenticated,
    required TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)?
        authenticated,
    TResult? Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)?
        authenticated,
    TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStatesAuthenticated value) authenticated,
    required TResult Function(_AuthStatesUnauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStatesAuthenticated value)? authenticated,
    TResult? Function(_AuthStatesUnauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStatesAuthenticated value)? authenticated,
    TResult Function(_AuthStatesUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStatesCopyWith<AuthStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatesCopyWith<$Res> {
  factory $AuthStatesCopyWith(
          AuthStates value, $Res Function(AuthStates) then) =
      _$AuthStatesCopyWithImpl<$Res, AuthStates>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          AuthStatus? status});
}

/// @nodoc
class _$AuthStatesCopyWithImpl<$Res, $Val extends AuthStates>
    implements $AuthStatesCopyWith<$Res> {
  _$AuthStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStatesAuthenticatedCopyWith<$Res>
    implements $AuthStatesCopyWith<$Res> {
  factory _$$_AuthStatesAuthenticatedCopyWith(_$_AuthStatesAuthenticated value,
          $Res Function(_$_AuthStatesAuthenticated) then) =
      __$$_AuthStatesAuthenticatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          AuthStatus? status,
      @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
          AuthUser? user});
}

/// @nodoc
class __$$_AuthStatesAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStatesCopyWithImpl<$Res, _$_AuthStatesAuthenticated>
    implements _$$_AuthStatesAuthenticatedCopyWith<$Res> {
  __$$_AuthStatesAuthenticatedCopyWithImpl(_$_AuthStatesAuthenticated _value,
      $Res Function(_$_AuthStatesAuthenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_AuthStatesAuthenticated(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthUser?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_AuthStatesAuthenticated implements _AuthStatesAuthenticated {
  const _$_AuthStatesAuthenticated(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          this.status,
      @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
          this.user});

  @override
  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
  final AuthStatus? status;
  @override
  @JsonKey(
      defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
  final AuthUser? user;

  @override
  String toString() {
    return 'AuthStates.authenticated(status: $status, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStatesAuthenticated &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStatesAuthenticatedCopyWith<_$_AuthStatesAuthenticated>
      get copyWith =>
          __$$_AuthStatesAuthenticatedCopyWithImpl<_$_AuthStatesAuthenticated>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)
        authenticated,
    required TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status) unauthenticated,
  }) {
    return authenticated(status, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)?
        authenticated,
    TResult? Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status)? unauthenticated,
  }) {
    return authenticated?.call(status, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)?
        authenticated,
    TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(status, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStatesAuthenticated value) authenticated,
    required TResult Function(_AuthStatesUnauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStatesAuthenticated value)? authenticated,
    TResult? Function(_AuthStatesUnauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStatesAuthenticated value)? authenticated,
    TResult Function(_AuthStatesUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthStatesAuthenticated implements AuthStates {
  const factory _AuthStatesAuthenticated(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          final AuthStatus? status,
      @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
          final AuthUser? user}) = _$_AuthStatesAuthenticated;

  @override
  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
  AuthStatus? get status;
  @JsonKey(
      defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
  AuthUser? get user;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStatesAuthenticatedCopyWith<_$_AuthStatesAuthenticated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStatesUnauthenticatedCopyWith<$Res>
    implements $AuthStatesCopyWith<$Res> {
  factory _$$_AuthStatesUnauthenticatedCopyWith(
          _$_AuthStatesUnauthenticated value,
          $Res Function(_$_AuthStatesUnauthenticated) then) =
      __$$_AuthStatesUnauthenticatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          AuthStatus? status});
}

/// @nodoc
class __$$_AuthStatesUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStatesCopyWithImpl<$Res, _$_AuthStatesUnauthenticated>
    implements _$$_AuthStatesUnauthenticatedCopyWith<$Res> {
  __$$_AuthStatesUnauthenticatedCopyWithImpl(
      _$_AuthStatesUnauthenticated _value,
      $Res Function(_$_AuthStatesUnauthenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_AuthStatesUnauthenticated(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_AuthStatesUnauthenticated implements _AuthStatesUnauthenticated {
  const _$_AuthStatesUnauthenticated(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          this.status});

  @override
  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
  final AuthStatus? status;

  @override
  String toString() {
    return 'AuthStates.unauthenticated(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStatesUnauthenticated &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStatesUnauthenticatedCopyWith<_$_AuthStatesUnauthenticated>
      get copyWith => __$$_AuthStatesUnauthenticatedCopyWithImpl<
          _$_AuthStatesUnauthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)
        authenticated,
    required TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status) unauthenticated,
  }) {
    return unauthenticated(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)?
        authenticated,
    TResult? Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status)? unauthenticated,
  }) {
    return unauthenticated?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
                AuthStatus? status,
            @JsonKey(defaultValue: 'AuthUser', includeToJson: false, includeFromJson: false)
                AuthUser? user)?
        authenticated,
    TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false) AuthStatus? status)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStatesAuthenticated value) authenticated,
    required TResult Function(_AuthStatesUnauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStatesAuthenticated value)? authenticated,
    TResult? Function(_AuthStatesUnauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStatesAuthenticated value)? authenticated,
    TResult Function(_AuthStatesUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthStatesUnauthenticated implements AuthStates {
  const factory _AuthStatesUnauthenticated(
      {@JsonKey(defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
          final AuthStatus? status}) = _$_AuthStatesUnauthenticated;

  @override
  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: false, includeToJson: false)
  AuthStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStatesUnauthenticatedCopyWith<_$_AuthStatesUnauthenticated>
      get copyWith => throw _privateConstructorUsedError;
}
