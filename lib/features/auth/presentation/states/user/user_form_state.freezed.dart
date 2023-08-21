// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFormState _$UserFormStateFromJson(Map<String, dynamic> json) {
  return _UserFormState.fromJson(json);
}

/// @nodoc
mixin _$UserFormState {
  UserEntityModel get userEntityModel => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: 'UserName', includeToJson: false, includeFromJson: false)
  NameFormz? get nameFormz => throw _privateConstructorUsedError;
  @JsonKey(
      defaultValue: 'UserRole', includeToJson: false, includeFromJson: false)
  RoleFormz? get roleFormz => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFormStateCopyWith<UserFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFormStateCopyWith<$Res> {
  factory $UserFormStateCopyWith(
          UserFormState value, $Res Function(UserFormState) then) =
      _$UserFormStateCopyWithImpl<$Res, UserFormState>;
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
class _$UserFormStateCopyWithImpl<$Res, $Val extends UserFormState>
    implements $UserFormStateCopyWith<$Res> {
  _$UserFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntityModel = null,
    Object? nameFormz = freezed,
    Object? roleFormz = freezed,
  }) {
    return _then(_value.copyWith(
      userEntityModel: null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      nameFormz: freezed == nameFormz
          ? _value.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
      roleFormz: freezed == roleFormz
          ? _value.roleFormz
          : roleFormz // ignore: cast_nullable_to_non_nullable
              as RoleFormz?,
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
abstract class _$$_UserFormStateCopyWith<$Res>
    implements $UserFormStateCopyWith<$Res> {
  factory _$$_UserFormStateCopyWith(
          _$_UserFormState value, $Res Function(_$_UserFormState) then) =
      __$$_UserFormStateCopyWithImpl<$Res>;
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
class __$$_UserFormStateCopyWithImpl<$Res>
    extends _$UserFormStateCopyWithImpl<$Res, _$_UserFormState>
    implements _$$_UserFormStateCopyWith<$Res> {
  __$$_UserFormStateCopyWithImpl(
      _$_UserFormState _value, $Res Function(_$_UserFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntityModel = null,
    Object? nameFormz = freezed,
    Object? roleFormz = freezed,
  }) {
    return _then(_$_UserFormState(
      null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      nameFormz: freezed == nameFormz
          ? _value.nameFormz
          : nameFormz // ignore: cast_nullable_to_non_nullable
              as NameFormz?,
      roleFormz: freezed == roleFormz
          ? _value.roleFormz
          : roleFormz // ignore: cast_nullable_to_non_nullable
              as RoleFormz?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFormState implements _UserFormState {
  const _$_UserFormState(this.userEntityModel,
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

  factory _$_UserFormState.fromJson(Map<String, dynamic> json) =>
      _$$_UserFormStateFromJson(json);

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

  @override
  String toString() {
    return 'UserFormState(userEntityModel: $userEntityModel, nameFormz: $nameFormz, roleFormz: $roleFormz)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFormState &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.nameFormz, nameFormz) ||
                other.nameFormz == nameFormz) &&
            (identical(other.roleFormz, roleFormz) ||
                other.roleFormz == roleFormz));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userEntityModel, nameFormz, roleFormz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserFormStateCopyWith<_$_UserFormState> get copyWith =>
      __$$_UserFormStateCopyWithImpl<_$_UserFormState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFormStateToJson(
      this,
    );
  }
}

abstract class _UserFormState implements UserFormState {
  const factory _UserFormState(final UserEntityModel userEntityModel,
      {@JsonKey(
          defaultValue: 'UserName',
          includeToJson: false,
          includeFromJson: false)
      final NameFormz? nameFormz,
      @JsonKey(
          defaultValue: 'UserRole',
          includeToJson: false,
          includeFromJson: false)
      final RoleFormz? roleFormz}) = _$_UserFormState;

  factory _UserFormState.fromJson(Map<String, dynamic> json) =
      _$_UserFormState.fromJson;

  @override
  UserEntityModel get userEntityModel;
  @override
  @JsonKey(
      defaultValue: 'UserName', includeToJson: false, includeFromJson: false)
  NameFormz? get nameFormz;
  @override
  @JsonKey(
      defaultValue: 'UserRole', includeToJson: false, includeFromJson: false)
  RoleFormz? get roleFormz;
  @override
  @JsonKey(ignore: true)
  _$$_UserFormStateCopyWith<_$_UserFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
