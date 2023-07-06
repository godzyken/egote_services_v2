// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() read,
    required TResult Function() delivered,
    required TResult Function() sent,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? read,
    TResult? Function()? delivered,
    TResult? Function()? sent,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? read,
    TResult Function()? delivered,
    TResult Function()? sent,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Read value) read,
    required TResult Function(Delivered value) delivered,
    required TResult Function(Sent value) sent,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Read value)? read,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(Sent value)? sent,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Read value)? read,
    TResult Function(Delivered value)? delivered,
    TResult Function(Sent value)? sent,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res, MessageState>;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReadCopyWith<$Res> {
  factory _$$ReadCopyWith(_$Read value, $Res Function(_$Read) then) =
      __$$ReadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$Read>
    implements _$$ReadCopyWith<$Res> {
  __$$ReadCopyWithImpl(_$Read _value, $Res Function(_$Read) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Read with DiagnosticableTreeMixin implements Read {
  const _$Read();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageState.read()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MessageState.read'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Read);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() read,
    required TResult Function() delivered,
    required TResult Function() sent,
    required TResult Function(Failure failure) error,
  }) {
    return read();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? read,
    TResult? Function()? delivered,
    TResult? Function()? sent,
    TResult? Function(Failure failure)? error,
  }) {
    return read?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? read,
    TResult Function()? delivered,
    TResult Function()? sent,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Read value) read,
    required TResult Function(Delivered value) delivered,
    required TResult Function(Sent value) sent,
    required TResult Function(Error value) error,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Read value)? read,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(Sent value)? sent,
    TResult? Function(Error value)? error,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Read value)? read,
    TResult Function(Delivered value)? delivered,
    TResult Function(Sent value)? sent,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class Read implements MessageState {
  const factory Read() = _$Read;
}

/// @nodoc
abstract class _$$DeliveredCopyWith<$Res> {
  factory _$$DeliveredCopyWith(
          _$Delivered value, $Res Function(_$Delivered) then) =
      __$$DeliveredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeliveredCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$Delivered>
    implements _$$DeliveredCopyWith<$Res> {
  __$$DeliveredCopyWithImpl(
      _$Delivered _value, $Res Function(_$Delivered) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Delivered with DiagnosticableTreeMixin implements Delivered {
  const _$Delivered();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageState.delivered()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MessageState.delivered'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Delivered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() read,
    required TResult Function() delivered,
    required TResult Function() sent,
    required TResult Function(Failure failure) error,
  }) {
    return delivered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? read,
    TResult? Function()? delivered,
    TResult? Function()? sent,
    TResult? Function(Failure failure)? error,
  }) {
    return delivered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? read,
    TResult Function()? delivered,
    TResult Function()? sent,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Read value) read,
    required TResult Function(Delivered value) delivered,
    required TResult Function(Sent value) sent,
    required TResult Function(Error value) error,
  }) {
    return delivered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Read value)? read,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(Sent value)? sent,
    TResult? Function(Error value)? error,
  }) {
    return delivered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Read value)? read,
    TResult Function(Delivered value)? delivered,
    TResult Function(Sent value)? sent,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (delivered != null) {
      return delivered(this);
    }
    return orElse();
  }
}

abstract class Delivered implements MessageState {
  const factory Delivered() = _$Delivered;
}

/// @nodoc
abstract class _$$SentCopyWith<$Res> {
  factory _$$SentCopyWith(_$Sent value, $Res Function(_$Sent) then) =
      __$$SentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SentCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$Sent>
    implements _$$SentCopyWith<$Res> {
  __$$SentCopyWithImpl(_$Sent _value, $Res Function(_$Sent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Sent with DiagnosticableTreeMixin implements Sent {
  const _$Sent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageState.sent()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MessageState.sent'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Sent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() read,
    required TResult Function() delivered,
    required TResult Function() sent,
    required TResult Function(Failure failure) error,
  }) {
    return sent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? read,
    TResult? Function()? delivered,
    TResult? Function()? sent,
    TResult? Function(Failure failure)? error,
  }) {
    return sent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? read,
    TResult Function()? delivered,
    TResult Function()? sent,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Read value) read,
    required TResult Function(Delivered value) delivered,
    required TResult Function(Sent value) sent,
    required TResult Function(Error value) error,
  }) {
    return sent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Read value)? read,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(Sent value)? sent,
    TResult? Function(Error value)? error,
  }) {
    return sent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Read value)? read,
    TResult Function(Delivered value)? delivered,
    TResult Function(Sent value)? sent,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class Sent implements MessageState {
  const factory Sent() = _$Sent;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$Error>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$Error(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$Error with DiagnosticableTreeMixin implements Error {
  const _$Error(this.failure);

  @override
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageState.error(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageState.error'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() read,
    required TResult Function() delivered,
    required TResult Function() sent,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? read,
    TResult? Function()? delivered,
    TResult? Function()? sent,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? read,
    TResult Function()? delivered,
    TResult Function()? sent,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Read value) read,
    required TResult Function(Delivered value) delivered,
    required TResult Function(Sent value) sent,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Read value)? read,
    TResult? Function(Delivered value)? delivered,
    TResult? Function(Sent value)? sent,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Read value)? read,
    TResult Function(Delivered value)? delivered,
    TResult Function(Sent value)? sent,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements MessageState {
  const factory Error(final Failure failure) = _$Error;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
