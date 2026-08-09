// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInState {
  @JsonKey(
      defaultValue: 'EmailFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  EmailFormz? get emailFormz;
  @JsonKey(
      defaultValue: 'PasswordFormz.pure()',
      includeFromJson: false,
      includeToJson: false)
  PasswordFormz? get passwordFormz;
  @JsonKey(
      defaultValue: FormzSubmissionStatus.initial,
      includeFromJson: false,
      includeToJson: false)
  FormzSubmissionStatus? get status;
  String? get errorMessage;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInStateCopyWith<SignInState> get copyWith =>
      _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);

  /// Serializes this SignInState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInState &&
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
  int get hashCode =>
      Object.hash(runtimeType, emailFormz, passwordFormz, status, errorMessage);

  @override
  String toString() {
    return 'SignInState(emailFormz: $emailFormz, passwordFormz: $passwordFormz, status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) _then) =
      _$SignInStateCopyWithImpl;
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
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
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

/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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
    TResult Function(_SignInState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
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
    TResult Function(_SignInState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState():
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
    TResult? Function(_SignInState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
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
            String? errorMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
        return $default(_that.emailFormz, _that.passwordFormz, _that.status,
            _that.errorMessage);
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
            String? errorMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState():
        return $default(_that.emailFormz, _that.passwordFormz, _that.status,
            _that.errorMessage);
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
            String? errorMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
        return $default(_that.emailFormz, _that.passwordFormz, _that.status,
            _that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SignInState implements SignInState {
  const _SignInState(
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
  factory _SignInState.fromJson(Map<String, dynamic> json) =>
      _$SignInStateFromJson(json);

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

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInStateCopyWith<_SignInState> get copyWith =>
      __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignInStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInState &&
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
  int get hashCode =>
      Object.hash(runtimeType, emailFormz, passwordFormz, status, errorMessage);

  @override
  String toString() {
    return 'SignInState(emailFormz: $emailFormz, passwordFormz: $passwordFormz, status: $status, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$SignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(
          _SignInState value, $Res Function(_SignInState) _then) =
      __$SignInStateCopyWithImpl;
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
class __$SignInStateCopyWithImpl<$Res> implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(this._self, this._then);

  final _SignInState _self;
  final $Res Function(_SignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? emailFormz = freezed,
    Object? passwordFormz = freezed,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_SignInState(
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
