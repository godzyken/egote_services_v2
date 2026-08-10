// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{TResult Function( _$AuthStateTrue value)?  authenticated,TResult Function( _$AuthStateFalse value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _$AuthStateTrue() when authenticated != null:
return authenticated(_that);case _$AuthStateFalse() when unauthenticated != null:
return unauthenticated(_that);case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,{required TResult Function( _$AuthStateTrue value)  authenticated,required TResult Function( _$AuthStateFalse value)  unauthenticated,}){
final _that = this;
switch (_that) {
case _$AuthStateTrue():
return authenticated(_that);case _$AuthStateFalse():
return unauthenticated(_that);case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,{TResult? Function( _$AuthStateTrue value)?  authenticated,TResult? Function( _$AuthStateFalse value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case _$AuthStateTrue() when authenticated != null:
return authenticated(_that);case _$AuthStateFalse() when unauthenticated != null:
return unauthenticated(_that);case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function()?  $default,{TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated)  AuthStatus status, @JsonKey(defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true)  UserModel userEntity)?  authenticated,TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true)  AuthStatus status)?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _$AuthStateTrue() when authenticated != null:
return authenticated(_that.status,_that.userEntity);case _$AuthStateFalse() when unauthenticated != null:
return unauthenticated(_that.status);case _AuthState() when $default != null:
return $default();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function()  $default,{required TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated)  AuthStatus status, @JsonKey(defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true)  UserModel userEntity)  authenticated,required TResult Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true)  AuthStatus status)  unauthenticated,}) {final _that = this;
switch (_that) {
case _$AuthStateTrue():
return authenticated(_that.status,_that.userEntity);case _$AuthStateFalse():
return unauthenticated(_that.status);case _AuthState():
return $default();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function()?  $default,{TResult? Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated)  AuthStatus status, @JsonKey(defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true)  UserModel userEntity)?  authenticated,TResult? Function(@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true)  AuthStatus status)?  unauthenticated,}) {final _that = this;
switch (_that) {
case _$AuthStateTrue() when authenticated != null:
return authenticated(_that.status,_that.userEntity);case _$AuthStateFalse() when unauthenticated != null:
return unauthenticated(_that.status);case _AuthState() when $default != null:
return $default();case _:
  return null;

}
}

}

/// @nodoc


class _$AuthStateTrue implements AuthState {
  const _$AuthStateTrue({@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated) required this.status, @JsonKey(defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true) required this.userEntity});
  

@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated) final  AuthStatus status;
@JsonKey(defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true) final  UserModel userEntity;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$AuthStateTrueCopyWith<_$AuthStateTrue> get copyWith => __$$AuthStateTrueCopyWithImpl<_$AuthStateTrue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AuthStateTrue&&(identical(other.status, status) || other.status == status)&&(identical(other.userEntity, userEntity) || other.userEntity == userEntity));
}


@override
int get hashCode => Object.hash(runtimeType,status,userEntity);

@override
String toString() {
  return 'AuthState.authenticated(status: $status, userEntity: $userEntity)';
}


}

/// @nodoc
abstract mixin class _$$AuthStateTrueCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateTrueCopyWith(_$AuthStateTrue value, $Res Function(_$AuthStateTrue) _then) = __$$AuthStateTrueCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated) AuthStatus status,@JsonKey(defaultValue: 'UserEntity', includeToJson: true, includeFromJson: true) UserModel userEntity
});


$UserModelCopyWith<$Res> get userEntity;

}
/// @nodoc
class __$$AuthStateTrueCopyWithImpl<$Res>
    implements _$$AuthStateTrueCopyWith<$Res> {
  __$$AuthStateTrueCopyWithImpl(this._self, this._then);

  final _$AuthStateTrue _self;
  final $Res Function(_$AuthStateTrue) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,Object? userEntity = null,}) {
  return _then(_$AuthStateTrue(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,userEntity: null == userEntity ? _self.userEntity : userEntity // ignore: cast_nullable_to_non_nullable
as UserModel,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get userEntity {
  
  return $UserModelCopyWith<$Res>(_self.userEntity, (value) {
    return _then(_self.copyWith(userEntity: value));
  });
}
}

/// @nodoc


class _$AuthStateFalse implements AuthState {
  const _$AuthStateFalse({@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true) required this.status});
  

@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true) final  AuthStatus status;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$$AuthStateFalseCopyWith<_$AuthStateFalse> get copyWith => __$$AuthStateFalseCopyWithImpl<_$AuthStateFalse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AuthStateFalse&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'AuthState.unauthenticated(status: $status)';
}


}

/// @nodoc
abstract mixin class _$$AuthStateFalseCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateFalseCopyWith(_$AuthStateFalse value, $Res Function(_$AuthStateFalse) _then) = __$$AuthStateFalseCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true) AuthStatus status
});




}
/// @nodoc
class __$$AuthStateFalseCopyWithImpl<$Res>
    implements _$$AuthStateFalseCopyWith<$Res> {
  __$$AuthStateFalseCopyWithImpl(this._self, this._then);

  final _$AuthStateFalse _self;
  final $Res Function(_$AuthStateFalse) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_$AuthStateFalse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,
  ));
}


}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}




// dart format on
