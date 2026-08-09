// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFormState {
  UserEntityModel get userEntityModel;
  @JsonKey(
      defaultValue: 'UserName', includeToJson: false, includeFromJson: false)
  NameFormz? get nameFormz;
  @JsonKey(
      defaultValue: 'UserRole', includeToJson: false, includeFromJson: false)
  RoleFormz? get roleFormz;

  /// Create a copy of UserFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserFormStateCopyWith<UserFormState> get copyWith =>
      _$UserFormStateCopyWithImpl<UserFormState>(
          this as UserFormState, _$identity);

  /// Serializes this UserFormState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserFormState &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.nameFormz, nameFormz) ||
                other.nameFormz == nameFormz) &&
            (identical(other.roleFormz, roleFormz) ||
                other.roleFormz == roleFormz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userEntityModel, nameFormz, roleFormz);

  @override
  String toString() {
    return 'UserFormState(userEntityModel: $userEntityModel, nameFormz: $nameFormz, roleFormz: $roleFormz)';
  }
}

/// @nodoc
abstract mixin class $UserFormStateCopyWith<$Res> {
  factory $UserFormStateCopyWith(
          UserFormState value, $Res Function(UserFormState) _then) =
      _$UserFormStateCopyWithImpl;
  @useResult
  $Res call(
      {UserEntityModel userEntityModel,
      @JsonKey(
          defaultValue: 'UserName',
          includeToJson: false,
          includeFromJson: false)
      NameFormz? nameFormz,
      @JsonKey(
          defaultValue: 'UserRole',
          includeToJson: false,
          includeFromJson: false)
      RoleFormz? roleFormz});

  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class _$UserFormStateCopyWithImpl<$Res>
    implements $UserFormStateCopyWith<$Res> {
  _$UserFormStateCopyWithImpl(this._self, this._then);

  final UserFormState _self;
  final $Res Function(UserFormState) _then;

  /// Create a copy of UserFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntityModel = null,
    Object? nameFormz = freezed,
    Object? roleFormz = freezed,
  }) {
    return _then(_self.copyWith(
      userEntityModel: null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      nameFormz: freezed == nameFormz
          ? _self.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
      roleFormz: freezed == roleFormz
          ? _self.roleFormz
          : roleFormz // ignore: cast_nullable_to_non_nullable
              as RoleFormz?,
    ));
  }

  /// Create a copy of UserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<$Res> get userEntityModel {
    return $UserEntityModelCopyWith<$Res>(_self.userEntityModel, (value) {
      return _then(_self.copyWith(userEntityModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserFormState].
extension UserFormStatePatterns on UserFormState {
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
    TResult Function(_UserFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserFormState() when $default != null:
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
    TResult Function(_UserFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFormState():
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
    TResult? Function(_UserFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFormState() when $default != null:
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
            UserEntityModel userEntityModel,
            @JsonKey(
                defaultValue: 'UserName',
                includeToJson: false,
                includeFromJson: false)
            NameFormz? nameFormz,
            @JsonKey(
                defaultValue: 'UserRole',
                includeToJson: false,
                includeFromJson: false)
            RoleFormz? roleFormz)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserFormState() when $default != null:
        return $default(
            _that.userEntityModel, _that.nameFormz, _that.roleFormz);
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
            UserEntityModel userEntityModel,
            @JsonKey(
                defaultValue: 'UserName',
                includeToJson: false,
                includeFromJson: false)
            NameFormz? nameFormz,
            @JsonKey(
                defaultValue: 'UserRole',
                includeToJson: false,
                includeFromJson: false)
            RoleFormz? roleFormz)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFormState():
        return $default(
            _that.userEntityModel, _that.nameFormz, _that.roleFormz);
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
            UserEntityModel userEntityModel,
            @JsonKey(
                defaultValue: 'UserName',
                includeToJson: false,
                includeFromJson: false)
            NameFormz? nameFormz,
            @JsonKey(
                defaultValue: 'UserRole',
                includeToJson: false,
                includeFromJson: false)
            RoleFormz? roleFormz)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserFormState() when $default != null:
        return $default(
            _that.userEntityModel, _that.nameFormz, _that.roleFormz);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserFormState implements UserFormState {
  const _UserFormState(this.userEntityModel,
      {@JsonKey(
          defaultValue: 'UserName',
          includeToJson: false,
          includeFromJson: false)
      this.nameFormz,
      @JsonKey(
          defaultValue: 'UserRole',
          includeToJson: false,
          includeFromJson: false)
      this.roleFormz});
  factory _UserFormState.fromJson(Map<String, dynamic> json) =>
      _$UserFormStateFromJson(json);

  @override
  final UserEntityModel userEntityModel;
  @override
  @JsonKey(
      defaultValue: 'UserName', includeToJson: false, includeFromJson: false)
  final NameFormz? nameFormz;
  @override
  @JsonKey(
      defaultValue: 'UserRole', includeToJson: false, includeFromJson: false)
  final RoleFormz? roleFormz;

  /// Create a copy of UserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserFormStateCopyWith<_UserFormState> get copyWith =>
      __$UserFormStateCopyWithImpl<_UserFormState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserFormStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserFormState &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.nameFormz, nameFormz) ||
                other.nameFormz == nameFormz) &&
            (identical(other.roleFormz, roleFormz) ||
                other.roleFormz == roleFormz));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userEntityModel, nameFormz, roleFormz);

  @override
  String toString() {
    return 'UserFormState(userEntityModel: $userEntityModel, nameFormz: $nameFormz, roleFormz: $roleFormz)';
  }
}

/// @nodoc
abstract mixin class _$UserFormStateCopyWith<$Res>
    implements $UserFormStateCopyWith<$Res> {
  factory _$UserFormStateCopyWith(
          _UserFormState value, $Res Function(_UserFormState) _then) =
      __$UserFormStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserEntityModel userEntityModel,
      @JsonKey(
          defaultValue: 'UserName',
          includeToJson: false,
          includeFromJson: false)
      NameFormz? nameFormz,
      @JsonKey(
          defaultValue: 'UserRole',
          includeToJson: false,
          includeFromJson: false)
      RoleFormz? roleFormz});

  @override
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class __$UserFormStateCopyWithImpl<$Res>
    implements _$UserFormStateCopyWith<$Res> {
  __$UserFormStateCopyWithImpl(this._self, this._then);

  final _UserFormState _self;
  final $Res Function(_UserFormState) _then;

  /// Create a copy of UserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userEntityModel = null,
    Object? nameFormz = freezed,
    Object? roleFormz = freezed,
  }) {
    return _then(_UserFormState(
      null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      nameFormz: freezed == nameFormz
          ? _self.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
      roleFormz: freezed == roleFormz
          ? _self.roleFormz
          : roleFormz // ignore: cast_nullable_to_non_nullable
              as RoleFormz?,
    ));
  }

  /// Create a copy of UserFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<$Res> get userEntityModel {
    return $UserEntityModelCopyWith<$Res>(_self.userEntityModel, (value) {
      return _then(_self.copyWith(userEntityModel: value));
    });
  }
}

// dart format on
