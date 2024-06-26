// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignInState _$SignInStateFromJson(Map<String, dynamic> json) {
  return _SignInState.fromJson(json);
}

/// @nodoc
mixin _$SignInState {
  @JsonKey(
      defaultValue: 'EmailFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  EmailFormz? get emailFormz => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: 'PasswordFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  PasswordFormz? get passwordFormz => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: FormzSubmissionStatus.initial,
      includeFromJson: false,
      includeToJson: false)
  FormzSubmissionStatus? get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call(
      {@JsonKey(
          defaultValue: 'EmailFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      EmailFormz? emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      PasswordFormz? passwordFormz,
      @JsonKey(
          defaultValue: FormzSubmissionStatus.initial,
          includeFromJson: false,
          includeToJson: false)
      FormzSubmissionStatus? status,
      String? errorMessage});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      emailFormz: freezed == emailFormz
          ? _value.emailFormz
          : emailFormz // ignore: cast_nullable_to_non_nullable
              as EmailFormz?,
      passwordFormz: freezed == passwordFormz
          ? _value.passwordFormz
          : passwordFormz // ignore: cast_nullable_to_non_nullable
              as PasswordFormz?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          defaultValue: 'EmailFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      EmailFormz? emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      PasswordFormz? passwordFormz,
      @JsonKey(
          defaultValue: FormzSubmissionStatus.initial,
          includeFromJson: false,
          includeToJson: false)
      FormzSubmissionStatus? status,
      String? errorMessage});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SignInStateImpl(
      emailFormz: freezed == emailFormz
          ? _value.emailFormz
          : emailFormz // ignore: cast_nullable_to_non_nullable
              as EmailFormz?,
      passwordFormz: freezed == passwordFormz
          ? _value.passwordFormz
          : passwordFormz // ignore: cast_nullable_to_non_nullable
              as PasswordFormz?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SignInStateImpl implements _SignInState {
  const _$SignInStateImpl(
      {@JsonKey(
          defaultValue: 'EmailFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      this.emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      this.passwordFormz,
      @JsonKey(
          defaultValue: FormzSubmissionStatus.initial,
          includeFromJson: false,
          includeToJson: false)
      this.status,
      this.errorMessage});

  factory _$SignInStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignInStateImplFromJson(json);

  @override
  @JsonKey(
      defaultValue: 'EmailFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  final EmailFormz? emailFormz;
  @override
  @JsonKey(
      defaultValue: 'PasswordFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  final PasswordFormz? passwordFormz;
  @override
  @JsonKey(
      defaultValue: FormzSubmissionStatus.initial,
      includeFromJson: false,
      includeToJson: false)
  final FormzSubmissionStatus? status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignInState(emailFormz: $emailFormz, passwordFormz: $passwordFormz, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.emailFormz, emailFormz) ||
                other.emailFormz == emailFormz) &&
            (identical(other.passwordFormz, passwordFormz) ||
                other.passwordFormz == passwordFormz) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, emailFormz, passwordFormz, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignInStateImplToJson(
      this,
    );
  }
}

abstract class _SignInState implements SignInState {
  const factory _SignInState(
      {@JsonKey(
          defaultValue: 'EmailFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      final EmailFormz? emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz.pure()',
          includeFromJson: false,
          includeToJson: false)
      final PasswordFormz? passwordFormz,
      @JsonKey(
          defaultValue: FormzSubmissionStatus.initial,
          includeFromJson: false,
          includeToJson: false)
      final FormzSubmissionStatus? status,
      final String? errorMessage}) = _$SignInStateImpl;

  factory _SignInState.fromJson(Map<String, dynamic> json) =
      _$SignInStateImpl.fromJson;

  @override
  @JsonKey(
      defaultValue: 'EmailFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  EmailFormz? get emailFormz;
  @override
  @JsonKey(
      defaultValue: 'PasswordFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  PasswordFormz? get passwordFormz;
  @override
  @JsonKey(
      defaultValue: FormzSubmissionStatus.initial,
      includeFromJson: false,
      includeToJson: false)
  FormzSubmissionStatus? get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
