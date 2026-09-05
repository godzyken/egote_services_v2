// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EmptyFailure value)?  empty,TResult Function( _UnprocessableEntityFailure value)?  unprocessableEntity,TResult Function( _UnauthorizedFailure value)?  unauthorized,TResult Function( _BadRequestFailure value)?  badRequest,TResult Function( _NotFoundFailure value)?  notFound,TResult Function( _ServerErrorFailure value)?  serverError,TResult Function( _NetworkErrorFailure value)?  networkError,TResult Function( _CacheErrorFailure value)?  cacheError,TResult Function( _TooManyRequestsFailure value)?  tooManyRequests,TResult Function( _PermissionDeniedFailure value)?  permissionDenied,TResult Function( _InvalidCredentialsFailure value)?  invalidCredentials,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmptyFailure() when empty != null:
return empty(_that);case _UnprocessableEntityFailure() when unprocessableEntity != null:
return unprocessableEntity(_that);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case _BadRequestFailure() when badRequest != null:
return badRequest(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _ServerErrorFailure() when serverError != null:
return serverError(_that);case _NetworkErrorFailure() when networkError != null:
return networkError(_that);case _CacheErrorFailure() when cacheError != null:
return cacheError(_that);case _TooManyRequestsFailure() when tooManyRequests != null:
return tooManyRequests(_that);case _PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case _InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EmptyFailure value)  empty,required TResult Function( _UnprocessableEntityFailure value)  unprocessableEntity,required TResult Function( _UnauthorizedFailure value)  unauthorized,required TResult Function( _BadRequestFailure value)  badRequest,required TResult Function( _NotFoundFailure value)  notFound,required TResult Function( _ServerErrorFailure value)  serverError,required TResult Function( _NetworkErrorFailure value)  networkError,required TResult Function( _CacheErrorFailure value)  cacheError,required TResult Function( _TooManyRequestsFailure value)  tooManyRequests,required TResult Function( _PermissionDeniedFailure value)  permissionDenied,required TResult Function( _InvalidCredentialsFailure value)  invalidCredentials,}){
final _that = this;
switch (_that) {
case _EmptyFailure():
return empty(_that);case _UnprocessableEntityFailure():
return unprocessableEntity(_that);case _UnauthorizedFailure():
return unauthorized(_that);case _BadRequestFailure():
return badRequest(_that);case _NotFoundFailure():
return notFound(_that);case _ServerErrorFailure():
return serverError(_that);case _NetworkErrorFailure():
return networkError(_that);case _CacheErrorFailure():
return cacheError(_that);case _TooManyRequestsFailure():
return tooManyRequests(_that);case _PermissionDeniedFailure():
return permissionDenied(_that);case _InvalidCredentialsFailure():
return invalidCredentials(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EmptyFailure value)?  empty,TResult? Function( _UnprocessableEntityFailure value)?  unprocessableEntity,TResult? Function( _UnauthorizedFailure value)?  unauthorized,TResult? Function( _BadRequestFailure value)?  badRequest,TResult? Function( _NotFoundFailure value)?  notFound,TResult? Function( _ServerErrorFailure value)?  serverError,TResult? Function( _NetworkErrorFailure value)?  networkError,TResult? Function( _CacheErrorFailure value)?  cacheError,TResult? Function( _TooManyRequestsFailure value)?  tooManyRequests,TResult? Function( _PermissionDeniedFailure value)?  permissionDenied,TResult? Function( _InvalidCredentialsFailure value)?  invalidCredentials,}){
final _that = this;
switch (_that) {
case _EmptyFailure() when empty != null:
return empty(_that);case _UnprocessableEntityFailure() when unprocessableEntity != null:
return unprocessableEntity(_that);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case _BadRequestFailure() when badRequest != null:
return badRequest(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _ServerErrorFailure() when serverError != null:
return serverError(_that);case _NetworkErrorFailure() when networkError != null:
return networkError(_that);case _CacheErrorFailure() when cacheError != null:
return cacheError(_that);case _TooManyRequestsFailure() when tooManyRequests != null:
return tooManyRequests(_that);case _PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case _InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( String message)?  unprocessableEntity,TResult Function()?  unauthorized,TResult Function()?  badRequest,TResult Function()?  notFound,TResult Function()?  serverError,TResult Function()?  networkError,TResult Function()?  cacheError,TResult Function()?  tooManyRequests,TResult Function()?  permissionDenied,TResult Function()?  invalidCredentials,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmptyFailure() when empty != null:
return empty();case _UnprocessableEntityFailure() when unprocessableEntity != null:
return unprocessableEntity(_that.message);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized();case _BadRequestFailure() when badRequest != null:
return badRequest();case _NotFoundFailure() when notFound != null:
return notFound();case _ServerErrorFailure() when serverError != null:
return serverError();case _NetworkErrorFailure() when networkError != null:
return networkError();case _CacheErrorFailure() when cacheError != null:
return cacheError();case _TooManyRequestsFailure() when tooManyRequests != null:
return tooManyRequests();case _PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied();case _InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( String message)  unprocessableEntity,required TResult Function()  unauthorized,required TResult Function()  badRequest,required TResult Function()  notFound,required TResult Function()  serverError,required TResult Function()  networkError,required TResult Function()  cacheError,required TResult Function()  tooManyRequests,required TResult Function()  permissionDenied,required TResult Function()  invalidCredentials,}) {final _that = this;
switch (_that) {
case _EmptyFailure():
return empty();case _UnprocessableEntityFailure():
return unprocessableEntity(_that.message);case _UnauthorizedFailure():
return unauthorized();case _BadRequestFailure():
return badRequest();case _NotFoundFailure():
return notFound();case _ServerErrorFailure():
return serverError();case _NetworkErrorFailure():
return networkError();case _CacheErrorFailure():
return cacheError();case _TooManyRequestsFailure():
return tooManyRequests();case _PermissionDeniedFailure():
return permissionDenied();case _InvalidCredentialsFailure():
return invalidCredentials();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( String message)?  unprocessableEntity,TResult? Function()?  unauthorized,TResult? Function()?  badRequest,TResult? Function()?  notFound,TResult? Function()?  serverError,TResult? Function()?  networkError,TResult? Function()?  cacheError,TResult? Function()?  tooManyRequests,TResult? Function()?  permissionDenied,TResult? Function()?  invalidCredentials,}) {final _that = this;
switch (_that) {
case _EmptyFailure() when empty != null:
return empty();case _UnprocessableEntityFailure() when unprocessableEntity != null:
return unprocessableEntity(_that.message);case _UnauthorizedFailure() when unauthorized != null:
return unauthorized();case _BadRequestFailure() when badRequest != null:
return badRequest();case _NotFoundFailure() when notFound != null:
return notFound();case _ServerErrorFailure() when serverError != null:
return serverError();case _NetworkErrorFailure() when networkError != null:
return networkError();case _CacheErrorFailure() when cacheError != null:
return cacheError();case _TooManyRequestsFailure() when tooManyRequests != null:
return tooManyRequests();case _PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied();case _InvalidCredentialsFailure() when invalidCredentials != null:
return invalidCredentials();case _:
  return null;

}
}

}

/// @nodoc


class _EmptyFailure extends Failure {
  const _EmptyFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmptyFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.empty()';
}


}




/// @nodoc


class _UnprocessableEntityFailure extends Failure {
  const _UnprocessableEntityFailure({required this.message}): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnprocessableEntityFailureCopyWith<_UnprocessableEntityFailure> get copyWith => __$UnprocessableEntityFailureCopyWithImpl<_UnprocessableEntityFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnprocessableEntityFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unprocessableEntity(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnprocessableEntityFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnprocessableEntityFailureCopyWith(_UnprocessableEntityFailure value, $Res Function(_UnprocessableEntityFailure) _then) = __$UnprocessableEntityFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnprocessableEntityFailureCopyWithImpl<$Res>
    implements _$UnprocessableEntityFailureCopyWith<$Res> {
  __$UnprocessableEntityFailureCopyWithImpl(this._self, this._then);

  final _UnprocessableEntityFailure _self;
  final $Res Function(_UnprocessableEntityFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_UnprocessableEntityFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnauthorizedFailure extends Failure {
  const _UnauthorizedFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnauthorizedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unauthorized()';
}


}




/// @nodoc


class _BadRequestFailure extends Failure {
  const _BadRequestFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadRequestFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.badRequest()';
}


}




/// @nodoc


class _NotFoundFailure extends Failure {
  const _NotFoundFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFoundFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.notFound()';
}


}




/// @nodoc


class _ServerErrorFailure extends Failure {
  const _ServerErrorFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerErrorFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serverError()';
}


}




/// @nodoc


class _NetworkErrorFailure extends Failure {
  const _NetworkErrorFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkErrorFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.networkError()';
}


}




/// @nodoc


class _CacheErrorFailure extends Failure {
  const _CacheErrorFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CacheErrorFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cacheError()';
}


}




/// @nodoc


class _TooManyRequestsFailure extends Failure {
  const _TooManyRequestsFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TooManyRequestsFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.tooManyRequests()';
}


}




/// @nodoc


class _PermissionDeniedFailure extends Failure {
  const _PermissionDeniedFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionDeniedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.permissionDenied()';
}


}




/// @nodoc


class _InvalidCredentialsFailure extends Failure {
  const _InvalidCredentialsFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvalidCredentialsFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.invalidCredentials()';
}


}




// dart format on
