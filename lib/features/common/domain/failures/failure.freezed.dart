// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) unprocessableEntity,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? unprocessableEntity,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? unprocessableEntity,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_UnprocessableEntityFailure value)
        unprocessableEntity,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyFailureImplCopyWith<$Res> {
  factory _$$EmptyFailureImplCopyWith(
          _$EmptyFailureImpl value, $Res Function(_$EmptyFailureImpl) then) =
      __$$EmptyFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$EmptyFailureImpl>
    implements _$$EmptyFailureImplCopyWith<$Res> {
  __$$EmptyFailureImplCopyWithImpl(
      _$EmptyFailureImpl _value, $Res Function(_$EmptyFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyFailureImpl extends _EmptyFailure {
  _$EmptyFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) unprocessableEntity,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? unprocessableEntity,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? unprocessableEntity,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_UnprocessableEntityFailure value)
        unprocessableEntity,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptyFailure extends Failure {
  factory _EmptyFailure() = _$EmptyFailureImpl;
  _EmptyFailure._() : super._();
}

/// @nodoc
abstract class _$$UnprocessableEntityFailureImplCopyWith<$Res> {
  factory _$$UnprocessableEntityFailureImplCopyWith(
          _$UnprocessableEntityFailureImpl value,
          $Res Function(_$UnprocessableEntityFailureImpl) then) =
      __$$UnprocessableEntityFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnprocessableEntityFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnprocessableEntityFailureImpl>
    implements _$$UnprocessableEntityFailureImplCopyWith<$Res> {
  __$$UnprocessableEntityFailureImplCopyWithImpl(
      _$UnprocessableEntityFailureImpl _value,
      $Res Function(_$UnprocessableEntityFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnprocessableEntityFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnprocessableEntityFailureImpl extends _UnprocessableEntityFailure {
  _$UnprocessableEntityFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unprocessableEntity(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnprocessableEntityFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnprocessableEntityFailureImplCopyWith<_$UnprocessableEntityFailureImpl>
      get copyWith => __$$UnprocessableEntityFailureImplCopyWithImpl<
          _$UnprocessableEntityFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) unprocessableEntity,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return unprocessableEntity(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? unprocessableEntity,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return unprocessableEntity?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? unprocessableEntity,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (unprocessableEntity != null) {
      return unprocessableEntity(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_UnprocessableEntityFailure value)
        unprocessableEntity,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return unprocessableEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return unprocessableEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (unprocessableEntity != null) {
      return unprocessableEntity(this);
    }
    return orElse();
  }
}

abstract class _UnprocessableEntityFailure extends Failure {
  factory _UnprocessableEntityFailure({required final String message}) =
      _$UnprocessableEntityFailureImpl;
  _UnprocessableEntityFailure._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$UnprocessableEntityFailureImplCopyWith<_$UnprocessableEntityFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedFailureImplCopyWith<$Res> {
  factory _$$UnauthorizedFailureImplCopyWith(_$UnauthorizedFailureImpl value,
          $Res Function(_$UnauthorizedFailureImpl) then) =
      __$$UnauthorizedFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedFailureImpl>
    implements _$$UnauthorizedFailureImplCopyWith<$Res> {
  __$$UnauthorizedFailureImplCopyWithImpl(_$UnauthorizedFailureImpl _value,
      $Res Function(_$UnauthorizedFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedFailureImpl extends _UnauthorizedFailure {
  _$UnauthorizedFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) unprocessableEntity,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? unprocessableEntity,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? unprocessableEntity,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_UnprocessableEntityFailure value)
        unprocessableEntity,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _UnauthorizedFailure extends Failure {
  factory _UnauthorizedFailure() = _$UnauthorizedFailureImpl;
  _UnauthorizedFailure._() : super._();
}

/// @nodoc
abstract class _$$BadRequestFailureImplCopyWith<$Res> {
  factory _$$BadRequestFailureImplCopyWith(_$BadRequestFailureImpl value,
          $Res Function(_$BadRequestFailureImpl) then) =
      __$$BadRequestFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadRequestFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadRequestFailureImpl>
    implements _$$BadRequestFailureImplCopyWith<$Res> {
  __$$BadRequestFailureImplCopyWithImpl(_$BadRequestFailureImpl _value,
      $Res Function(_$BadRequestFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BadRequestFailureImpl extends _BadRequestFailure {
  _$BadRequestFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.badRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BadRequestFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) unprocessableEntity,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return badRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? unprocessableEntity,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return badRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? unprocessableEntity,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_UnprocessableEntityFailure value)
        unprocessableEntity,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_UnprocessableEntityFailure value)? unprocessableEntity,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequestFailure extends Failure {
  factory _BadRequestFailure() = _$BadRequestFailureImpl;
  _BadRequestFailure._() : super._();
}
