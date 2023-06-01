// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpState _$SignUpStateFromJson(Map<String, dynamic> json) {
  return _SignUpState.fromJson(json);
}

/// @nodoc
mixin _$SignUpState {
  @JsonKey(
      defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
  NameFormz? get nameFormz => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
  EmailFormz? get emailFormz => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: 'PasswordFormz',
      includeFromJson: false,
      includeToJson: false)
  PasswordFormz? get passwordFormz => throw _privateConstructorUsedError;
  FormzSubmissionStatus? get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
          NameFormz? nameFormz,
      @JsonKey(defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
          EmailFormz? emailFormz,
      @JsonKey(defaultValue: 'PasswordFormz', includeFromJson: false, includeToJson: false)
          PasswordFormz? passwordFormz,
      FormzSubmissionStatus? status,
      String? errorMessage});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameFormz = freezed,
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      nameFormz: freezed == nameFormz
          ? _value.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
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
abstract class _$$_SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
          NameFormz? nameFormz,
      @JsonKey(defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
          EmailFormz? emailFormz,
      @JsonKey(defaultValue: 'PasswordFormz', includeFromJson: false, includeToJson: false)
          PasswordFormz? passwordFormz,
      FormzSubmissionStatus? status,
      String? errorMessage});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpState>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameFormz = freezed,
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_SignUpState(
      nameFormz: freezed == nameFormz
          ? _value.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
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
class _$_SignUpState implements _SignUpState {
  const _$_SignUpState(
      {@JsonKey(defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
          this.nameFormz,
      @JsonKey(defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
          this.emailFormz,
      @JsonKey(defaultValue: 'PasswordFormz', includeFromJson: false, includeToJson: false)
          this.passwordFormz,
      this.status = FormzSubmissionStatus.initial,
      this.errorMessage});

  factory _$_SignUpState.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpStateFromJson(json);

  @override
  @JsonKey(
      defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
  final NameFormz? nameFormz;
  @override
  @JsonKey(
      defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
  final EmailFormz? emailFormz;
  @override
  @JsonKey(
      defaultValue: 'PasswordFormz',
      includeFromJson: false,
      includeToJson: false)
  final PasswordFormz? passwordFormz;
  @override
  @JsonKey()
  final FormzSubmissionStatus? status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SignUpState(nameFormz: $nameFormz, emailFormz: $emailFormz, passwordFormz: $passwordFormz, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            (identical(other.nameFormz, nameFormz) ||
                other.nameFormz == nameFormz) &&
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
  int get hashCode => Object.hash(
      runtimeType, nameFormz, emailFormz, passwordFormz, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpStateToJson(
      this,
    );
  }
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {@JsonKey(defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
          final NameFormz? nameFormz,
      @JsonKey(defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
          final EmailFormz? emailFormz,
      @JsonKey(defaultValue: 'PasswordFormz', includeFromJson: false, includeToJson: false)
          final PasswordFormz? passwordFormz,
      final FormzSubmissionStatus? status,
      final String? errorMessage}) = _$_SignUpState;

  factory _SignUpState.fromJson(Map<String, dynamic> json) =
      _$_SignUpState.fromJson;

  @override
  @JsonKey(
      defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
  NameFormz? get nameFormz;
  @override
  @JsonKey(
      defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
  EmailFormz? get emailFormz;
  @override
  @JsonKey(
      defaultValue: 'PasswordFormz',
      includeFromJson: false,
      includeToJson: false)
  PasswordFormz? get passwordFormz;
  @override
  FormzSubmissionStatus? get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
