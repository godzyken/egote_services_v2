// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpState {
  @JsonKey(
      defaultValue: 'NameFormz', includeToJson: false, includeFromJson: false)
  NameFormz? get nameFormz;
  @JsonKey(
      defaultValue: 'EmailFormz', includeFromJson: false, includeToJson: false)
  EmailFormz? get emailFormz;
  @JsonKey(
      defaultValue: 'PasswordFormz',
      includeFromJson: false,
      includeToJson: false)
  PasswordFormz? get passwordFormz;
  FormzSubmissionStatus? get status;
  String? get errorMessage;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);

  /// Serializes this SignUpState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpState &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, nameFormz, emailFormz, passwordFormz, status, errorMessage);

  @override
  String toString() {
    return 'SignUpState(nameFormz: $nameFormz, emailFormz: $emailFormz, passwordFormz: $passwordFormz, status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) _then) =
      _$SignUpStateCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(
          defaultValue: 'NameFormz',
          includeToJson: false,
          includeFromJson: false)
      NameFormz? nameFormz,
      @JsonKey(
          defaultValue: 'EmailFormz',
          includeFromJson: false,
          includeToJson: false)
      EmailFormz? emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz',
          includeFromJson: false,
          includeToJson: false)
      PasswordFormz? passwordFormz,
      FormzSubmissionStatus? status,
      String? errorMessage});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameFormz = freezed,
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      nameFormz: freezed == nameFormz
          ? _self.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
      emailFormz: freezed == emailFormz
          ? _self.emailFormz
          : emailFormz // ignore: cast_nullable_to_non_nullable
              as EmailFormz?,
      passwordFormz: freezed == passwordFormz
          ? _self.passwordFormz
          : passwordFormz // ignore: cast_nullable_to_non_nullable
              as PasswordFormz?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SignUpState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignUpState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SignUpState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpState():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SignUpState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(
                defaultValue: 'NameFormz',
                includeToJson: false,
                includeFromJson: false)
            NameFormz? nameFormz,
            @JsonKey(
                defaultValue: 'EmailFormz',
                includeFromJson: false,
                includeToJson: false)
            EmailFormz? emailFormz,
            @JsonKey(
                defaultValue: 'PasswordFormz',
                includeFromJson: false,
                includeToJson: false)
            PasswordFormz? passwordFormz,
            FormzSubmissionStatus? status,
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignUpState() when $default != null:
        return $default(_that.nameFormz, _that.emailFormz, _that.passwordFormz,
            _that.status, _that.errorMessage);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(
                defaultValue: 'NameFormz',
                includeToJson: false,
                includeFromJson: false)
            NameFormz? nameFormz,
            @JsonKey(
                defaultValue: 'EmailFormz',
                includeFromJson: false,
                includeToJson: false)
            EmailFormz? emailFormz,
            @JsonKey(
                defaultValue: 'PasswordFormz',
                includeFromJson: false,
                includeToJson: false)
            PasswordFormz? passwordFormz,
            FormzSubmissionStatus? status,
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpState():
        return $default(_that.nameFormz, _that.emailFormz, _that.passwordFormz,
            _that.status, _that.errorMessage);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(
                defaultValue: 'NameFormz',
                includeToJson: false,
                includeFromJson: false)
            NameFormz? nameFormz,
            @JsonKey(
                defaultValue: 'EmailFormz',
                includeFromJson: false,
                includeToJson: false)
            EmailFormz? emailFormz,
            @JsonKey(
                defaultValue: 'PasswordFormz',
                includeFromJson: false,
                includeToJson: false)
            PasswordFormz? passwordFormz,
            FormzSubmissionStatus? status,
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpState() when $default != null:
        return $default(_that.nameFormz, _that.emailFormz, _that.passwordFormz,
            _that.status, _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SignUpState implements SignUpState {
  const _SignUpState(
      {@JsonKey(
          defaultValue: 'NameFormz',
          includeToJson: false,
          includeFromJson: false)
      this.nameFormz,
      @JsonKey(
          defaultValue: 'EmailFormz',
          includeFromJson: false,
          includeToJson: false)
      this.emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz',
          includeFromJson: false,
          includeToJson: false)
      this.passwordFormz,
      this.status = FormzSubmissionStatus.initial,
      this.errorMessage});
  factory _SignUpState.fromJson(Map<String, dynamic> json) =>
      _$SignUpStateFromJson(json);

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

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignUpStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpState &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, nameFormz, emailFormz, passwordFormz, status, errorMessage);

  @override
  String toString() {
    return 'SignUpState(nameFormz: $nameFormz, emailFormz: $emailFormz, passwordFormz: $passwordFormz, status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) _then) =
      __$SignUpStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          defaultValue: 'NameFormz',
          includeToJson: false,
          includeFromJson: false)
      NameFormz? nameFormz,
      @JsonKey(
          defaultValue: 'EmailFormz',
          includeFromJson: false,
          includeToJson: false)
      EmailFormz? emailFormz,
      @JsonKey(
          defaultValue: 'PasswordFormz',
          includeFromJson: false,
          includeToJson: false)
      PasswordFormz? passwordFormz,
      FormzSubmissionStatus? status,
      String? errorMessage});
}

/// @nodoc
class __$SignUpStateCopyWithImpl<$Res> implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nameFormz = freezed,
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_SignUpState(
      nameFormz: freezed == nameFormz
          ? _self.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
      emailFormz: freezed == emailFormz
          ? _self.emailFormz
          : emailFormz // ignore: cast_nullable_to_non_nullable
              as EmailFormz?,
      passwordFormz: freezed == passwordFormz
          ? _self.passwordFormz
          : passwordFormz // ignore: cast_nullable_to_non_nullable
              as PasswordFormz?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
