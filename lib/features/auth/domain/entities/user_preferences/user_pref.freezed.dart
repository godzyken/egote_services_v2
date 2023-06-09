// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_pref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  UserEntityModel get userEntityModel => throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  bool get isDarkMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {UserEntityModel userEntityModel,
      ThemeMode themeMode,
      String about,
      bool isDarkMode});

  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntityModel = null,
    Object? themeMode = null,
    Object? about = null,
    Object? isDarkMode = null,
  }) {
    return _then(_value.copyWith(
      userEntityModel: null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<$Res> get userEntityModel {
    return $UserEntityModelCopyWith<$Res>(_value.userEntityModel, (value) {
      return _then(_value.copyWith(userEntityModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserPreferencesCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$_UserPreferencesCopyWith(
          _$_UserPreferences value, $Res Function(_$_UserPreferences) then) =
      __$$_UserPreferencesCopyWithImpl<$Res>;
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
class __$$_UserPreferencesCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$_UserPreferences>
    implements _$$_UserPreferencesCopyWith<$Res> {
  __$$_UserPreferencesCopyWithImpl(
      _$_UserPreferences _value, $Res Function(_$_UserPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntityModel = null,
    Object? themeMode = null,
    Object? about = null,
    Object? isDarkMode = null,
  }) {
    return _then(_$_UserPreferences(
      userEntityModel: null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      isDarkMode: null == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPreferences
    with DiagnosticableTreeMixin
    implements _UserPreferences {
  const _$_UserPreferences(
      {required this.userEntityModel,
      required this.themeMode,
      required this.about,
      required this.isDarkMode});

  factory _$_UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$$_UserPreferencesFromJson(json);

  @override
  final UserEntityModel userEntityModel;
  @override
  final ThemeMode themeMode;
  @override
  final String about;
  @override
  final bool isDarkMode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserPreferences(userEntityModel: $userEntityModel, themeMode: $themeMode, about: $about, isDarkMode: $isDarkMode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserPreferences'))
      ..add(DiagnosticsProperty('userEntityModel', userEntityModel))
      ..add(DiagnosticsProperty('themeMode', themeMode))
      ..add(DiagnosticsProperty('about', about))
      ..add(DiagnosticsProperty('isDarkMode', isDarkMode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPreferences &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userEntityModel, themeMode, about, isDarkMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPreferencesCopyWith<_$_UserPreferences> get copyWith =>
      __$$_UserPreferencesCopyWithImpl<_$_UserPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPreferencesToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {required final UserEntityModel userEntityModel,
      required final ThemeMode themeMode,
      required final String about,
      required final bool isDarkMode}) = _$_UserPreferences;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$_UserPreferences.fromJson;

  @override
  UserEntityModel get userEntityModel;
  @override
  ThemeMode get themeMode;
  @override
  String get about;
  @override
  bool get isDarkMode;
  @override
  @JsonKey(ignore: true)
  _$$_UserPreferencesCopyWith<_$_UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
