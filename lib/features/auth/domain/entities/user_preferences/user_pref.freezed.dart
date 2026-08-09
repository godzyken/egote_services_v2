// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_pref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreferences {
  UserEntityModel get userEntityModel;
  ThemeMode get themeMode;
  String get about;
  bool get isDarkMode;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      _$UserPreferencesCopyWithImpl<UserPreferences>(
          this as UserPreferences, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserPreferences &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userEntityModel, themeMode, about, isDarkMode);

  @override
  String toString() {
    return 'UserPreferences(userEntityModel: $userEntityModel, themeMode: $themeMode, about: $about, isDarkMode: $isDarkMode)';
  }
}

/// @nodoc
abstract mixin class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) _then) =
      _$UserPreferencesCopyWithImpl;
  @useResult
  $Res call(
      {UserEntityModel userEntityModel,
      ThemeMode themeMode,
      String about,
      bool isDarkMode});

  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._self, this._then);

  final UserPreferences _self;
  final $Res Function(UserPreferences) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntityModel = null,
    Object? themeMode = null,
    Object? about = null,
    Object? isDarkMode = null,
  }) {
    return _then(_self.copyWith(
      userEntityModel: null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      about: null == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _self.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<$Res> get userEntityModel {
    return $UserEntityModelCopyWith<$Res>(_self.userEntityModel, (value) {
      return _then(_self.copyWith(userEntityModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserPreferences].
extension UserPreferencesPatterns on UserPreferences {
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
    TResult Function(_UserPreferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserPreferences() when $default != null:
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
    TResult Function(_UserPreferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPreferences():
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
    TResult? Function(_UserPreferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPreferences() when $default != null:
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
    TResult Function(UserEntityModel userEntityModel, ThemeMode themeMode,
            String about, bool isDarkMode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserPreferences() when $default != null:
        return $default(_that.userEntityModel, _that.themeMode, _that.about,
            _that.isDarkMode);
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
    TResult Function(UserEntityModel userEntityModel, ThemeMode themeMode,
            String about, bool isDarkMode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPreferences():
        return $default(_that.userEntityModel, _that.themeMode, _that.about,
            _that.isDarkMode);
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
    TResult? Function(UserEntityModel userEntityModel, ThemeMode themeMode,
            String about, bool isDarkMode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserPreferences() when $default != null:
        return $default(_that.userEntityModel, _that.themeMode, _that.about,
            _that.isDarkMode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserPreferences implements UserPreferences {
  const _UserPreferences(
      {required this.userEntityModel,
      required this.themeMode,
      required this.about,
      required this.isDarkMode});

  @override
  final UserEntityModel userEntityModel;
  @override
  final ThemeMode themeMode;
  @override
  final String about;
  @override
  final bool isDarkMode;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserPreferencesCopyWith<_UserPreferences> get copyWith =>
      __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserPreferences &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userEntityModel, themeMode, about, isDarkMode);

  @override
  String toString() {
    return 'UserPreferences(userEntityModel: $userEntityModel, themeMode: $themeMode, about: $about, isDarkMode: $isDarkMode)';
  }
}

/// @nodoc
abstract mixin class _$UserPreferencesCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(
          _UserPreferences value, $Res Function(_UserPreferences) _then) =
      __$UserPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserEntityModel userEntityModel,
      ThemeMode themeMode,
      String about,
      bool isDarkMode});

  @override
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(this._self, this._then);

  final _UserPreferences _self;
  final $Res Function(_UserPreferences) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userEntityModel = null,
    Object? themeMode = null,
    Object? about = null,
    Object? isDarkMode = null,
  }) {
    return _then(_UserPreferences(
      userEntityModel: null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      themeMode: null == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      about: null == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _self.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of UserPreferences
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
