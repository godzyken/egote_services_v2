// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)
        authenticated,
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(_$AuthStateTrue value) authenticated,
    required TResult Function(_$AuthStateFalse value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(_$AuthStateTrue value)? authenticated,
    TResult? Function(_$AuthStateFalse value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(_$AuthStateTrue value)? authenticated,
    TResult Function(_$AuthStateFalse value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_$AuthStateTrueCopyWith<$Res> {
  factory _$$_$AuthStateTrueCopyWith(
          _$_$AuthStateTrue value, $Res Function(_$_$AuthStateTrue) then) =
      __$$_$AuthStateTrueCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(
          defaultValue: 'AuthStatus',
          includeFromJson: true,
          includeToJson: true,
          unknownEnumValue: AuthStatus.unauthenticated)
      AuthStatus status,
      @JsonKey(
          defaultValue: 'UserEntity',
          includeToJson: true,
          includeFromJson: true)
      UserModel userEntity});

  $UserModelCopyWith<$Res> get userEntity;
}

/// @nodoc
class __$$_$AuthStateTrueCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_$AuthStateTrue>
    implements _$$_$AuthStateTrueCopyWith<$Res> {
  __$$_$AuthStateTrueCopyWithImpl(
      _$_$AuthStateTrue _value, $Res Function(_$_$AuthStateTrue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? userEntity = null,
  }) {
    return _then(_$_$AuthStateTrue(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      userEntity: null == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userEntity {
    return $UserModelCopyWith<$Res>(_value.userEntity, (value) {
      return _then(_value.copyWith(userEntity: value));
    });
  }
}

/// @nodoc

class _$_$AuthStateTrue implements _$AuthStateTrue {
  const _$_$AuthStateTrue(
      {@JsonKey(
          defaultValue: 'AuthStatus',
          includeFromJson: true,
          includeToJson: true,
          unknownEnumValue: AuthStatus.unauthenticated)
      required this.status,
      @JsonKey(
          defaultValue: 'UserEntity',
          includeToJson: true,
          includeFromJson: true)
      required this.userEntity});

  @override
  @JsonKey(
      defaultValue: 'AuthStatus',
      includeFromJson: true,
      includeToJson: true,
      unknownEnumValue: AuthStatus.unauthenticated)
  final AuthStatus status;
  @override
  @JsonKey(
      defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true)
  final UserModel userEntity;

  @override
  String toString() {
    return 'AuthState.authenticated(status: $status, userEntity: $userEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$AuthStateTrue &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, userEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_$AuthStateTrueCopyWith<_$_$AuthStateTrue> get copyWith =>
      __$$_$AuthStateTrueCopyWithImpl<_$_$AuthStateTrue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)
        authenticated,
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)
        unauthenticated,
  }) {
    return authenticated(status, userEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
  }) {
    return authenticated?.call(status, userEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(status, userEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(_$AuthStateTrue value) authenticated,
    required TResult Function(_$AuthStateFalse value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(_$AuthStateTrue value)? authenticated,
    TResult? Function(_$AuthStateFalse value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(_$AuthStateTrue value)? authenticated,
    TResult Function(_$AuthStateFalse value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _$AuthStateTrue implements AuthState {
  const factory _$AuthStateTrue(
      {@JsonKey(
          defaultValue: 'AuthStatus',
          includeFromJson: true,
          includeToJson: true,
          unknownEnumValue: AuthStatus.unauthenticated)
      required final AuthStatus status,
      @JsonKey(
          defaultValue: 'UserEntity',
          includeToJson: true,
          includeFromJson: true)
      required final UserModel userEntity}) = _$_$AuthStateTrue;

  @JsonKey(
      defaultValue: 'AuthStatus',
      includeFromJson: true,
      includeToJson: true,
      unknownEnumValue: AuthStatus.unauthenticated)
  AuthStatus get status;
  @JsonKey(
      defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true)
  UserModel get userEntity;
  @JsonKey(ignore: true)
  _$$_$AuthStateTrueCopyWith<_$_$AuthStateTrue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_$AuthStateFalseCopyWith<$Res> {
  factory _$$_$AuthStateFalseCopyWith(
          _$_$AuthStateFalse value, $Res Function(_$_$AuthStateFalse) then) =
      __$$_$AuthStateFalseCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(
          defaultValue: 'AuthStatus',
          includeFromJson: true,
          includeToJson: true)
      AuthStatus status});
}

/// @nodoc
class __$$_$AuthStateFalseCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_$AuthStateFalse>
    implements _$$_$AuthStateFalseCopyWith<$Res> {
  __$$_$AuthStateFalseCopyWithImpl(
      _$_$AuthStateFalse _value, $Res Function(_$_$AuthStateFalse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_$AuthStateFalse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$_$AuthStateFalse implements _$AuthStateFalse {
  const _$_$AuthStateFalse(
      {@JsonKey(
          defaultValue: 'AuthStatus',
          includeFromJson: true,
          includeToJson: true)
      required this.status});

  @override
  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true)
  final AuthStatus status;

  @override
  String toString() {
    return 'AuthState.unauthenticated(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$AuthStateFalse &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_$AuthStateFalseCopyWith<_$_$AuthStateFalse> get copyWith =>
      __$$_$AuthStateFalseCopyWithImpl<_$_$AuthStateFalse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)
        authenticated,
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)
        unauthenticated,
  }) {
    return unauthenticated(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
  }) {
    return unauthenticated?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(_$AuthStateTrue value) authenticated,
    required TResult Function(_$AuthStateFalse value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(_$AuthStateTrue value)? authenticated,
    TResult? Function(_$AuthStateFalse value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(_$AuthStateTrue value)? authenticated,
    TResult Function(_$AuthStateFalse value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _$AuthStateFalse implements AuthState {
  const factory _$AuthStateFalse(
      {@JsonKey(
          defaultValue: 'AuthStatus',
          includeFromJson: true,
          includeToJson: true)
      required final AuthStatus status}) = _$_$AuthStateFalse;

  @JsonKey(
      defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true)
  AuthStatus get status;
  @JsonKey(ignore: true)
  _$$_$AuthStateFalseCopyWith<_$_$AuthStateFalse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState();

  @override
  String toString() {
    return 'AuthState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)
        authenticated,
    required TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)
        unauthenticated,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult? Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true,
                unknownEnumValue: AuthStatus.unauthenticated)
            AuthStatus status,
            @JsonKey(
                defaultValue: 'UserEntity',
                includeToJson: true,
                includeFromJson: true)
            UserModel userEntity)?
        authenticated,
    TResult Function(
            @JsonKey(
                defaultValue: 'AuthStatus',
                includeFromJson: true,
                includeToJson: true)
            AuthStatus status)?
        unauthenticated,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthState value) $default, {
    required TResult Function(_$AuthStateTrue value) authenticated,
    required TResult Function(_$AuthStateFalse value) unauthenticated,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthState value)? $default, {
    TResult? Function(_$AuthStateTrue value)? authenticated,
    TResult? Function(_$AuthStateFalse value)? unauthenticated,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthState value)? $default, {
    TResult Function(_$AuthStateTrue value)? authenticated,
    TResult Function(_$AuthStateFalse value)? unauthenticated,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthState implements AuthState {
  const factory _AuthState() = _$_AuthState;
}
