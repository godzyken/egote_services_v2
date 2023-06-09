// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntityModel _$UserEntityModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _UserEntityModelInit.fromJson(json);
    case 'complete':
      return _UserEntityModelComplete.fromJson(json);
    case 'unComplete':
      return _UserEntityModelUnComplete.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserEntityModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserEntityModel {
  Object get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)
        $default, {
    required TResult Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)
        unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult? Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult Function(UserId id, String name, @UserConverter() AuthUser authUser,
            CubeUser cubeUser)?
        complete,
    TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value) $default, {
    required TResult Function(_UserEntityModelComplete value) complete,
    required TResult Function(_UserEntityModelUnComplete value) unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserEntityModelInit value)? $default, {
    TResult? Function(_UserEntityModelComplete value)? complete,
    TResult? Function(_UserEntityModelUnComplete value)? unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value)? $default, {
    TResult Function(_UserEntityModelComplete value)? complete,
    TResult Function(_UserEntityModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityModelCopyWith<UserEntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityModelCopyWith<$Res> {
  factory $UserEntityModelCopyWith(
          UserEntityModel value, $Res Function(UserEntityModel) then) =
      _$UserEntityModelCopyWithImpl<$Res, UserEntityModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UserEntityModelCopyWithImpl<$Res, $Val extends UserEntityModel>
    implements $UserEntityModelCopyWith<$Res> {
  _$UserEntityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserEntityModelInitCopyWith<$Res>
    implements $UserEntityModelCopyWith<$Res> {
  factory _$$_UserEntityModelInitCopyWith(_$_UserEntityModelInit value,
          $Res Function(_$_UserEntityModelInit) then) =
      __$$_UserEntityModelInitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserId id,
      String name,
      @JsonKey(includeIfNull: false) DateTime? createdAt,
      @JsonKey(includeIfNull: false) DateTime? updatedAt,
      @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
      @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
      @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
      String? role});

  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_UserEntityModelInitCopyWithImpl<$Res>
    extends _$UserEntityModelCopyWithImpl<$Res, _$_UserEntityModelInit>
    implements _$$_UserEntityModelInitCopyWith<$Res> {
  __$$_UserEntityModelInitCopyWithImpl(_$_UserEntityModelInit _value,
      $Res Function(_$_UserEntityModelInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? emailConfirmedAt = freezed,
    Object? phoneConfirmedAt = freezed,
    Object? lastSignInAt = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_UserEntityModelInit(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailConfirmedAt: freezed == emailConfirmedAt
          ? _value.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneConfirmedAt: freezed == phoneConfirmedAt
          ? _value.phoneConfirmedAt
          : phoneConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSignInAt: freezed == lastSignInAt
          ? _value.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_UserEntityModelInit implements _UserEntityModelInit {
  const _$_UserEntityModelInit(
      {required this.id,
      required this.name,
      @JsonKey(includeIfNull: false) this.createdAt,
      @JsonKey(includeIfNull: false) this.updatedAt,
      @JsonKey(includeIfNull: false) this.emailConfirmedAt,
      @JsonKey(includeIfNull: false) this.phoneConfirmedAt,
      @JsonKey(includeIfNull: false) this.lastSignInAt,
      this.role,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$_UserEntityModelInit.fromJson(Map<String, dynamic> json) =>
      _$$_UserEntityModelInitFromJson(json);

  @override
  final UserId id;
  @override
  final String name;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? updatedAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? emailConfirmedAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? phoneConfirmedAt;
  @override
  @JsonKey(includeIfNull: false)
  final DateTime? lastSignInAt;
  @override
  final String? role;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserEntityModel(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, emailConfirmedAt: $emailConfirmedAt, phoneConfirmedAt: $phoneConfirmedAt, lastSignInAt: $lastSignInAt, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntityModelInit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.emailConfirmedAt, emailConfirmedAt) ||
                other.emailConfirmedAt == emailConfirmedAt) &&
            (identical(other.phoneConfirmedAt, phoneConfirmedAt) ||
                other.phoneConfirmedAt == phoneConfirmedAt) &&
            (identical(other.lastSignInAt, lastSignInAt) ||
                other.lastSignInAt == lastSignInAt) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, updatedAt,
      emailConfirmedAt, phoneConfirmedAt, lastSignInAt, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserEntityModelInitCopyWith<_$_UserEntityModelInit> get copyWith =>
      __$$_UserEntityModelInitCopyWithImpl<_$_UserEntityModelInit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)
        $default, {
    required TResult Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)
        unComplete,
  }) {
    return $default(id, name, createdAt, updatedAt, emailConfirmedAt,
        phoneConfirmedAt, lastSignInAt, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult? Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
  }) {
    return $default?.call(id, name, createdAt, updatedAt, emailConfirmedAt,
        phoneConfirmedAt, lastSignInAt, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult Function(UserId id, String name, @UserConverter() AuthUser authUser,
            CubeUser cubeUser)?
        complete,
    TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, createdAt, updatedAt, emailConfirmedAt,
          phoneConfirmedAt, lastSignInAt, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value) $default, {
    required TResult Function(_UserEntityModelComplete value) complete,
    required TResult Function(_UserEntityModelUnComplete value) unComplete,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserEntityModelInit value)? $default, {
    TResult? Function(_UserEntityModelComplete value)? complete,
    TResult? Function(_UserEntityModelUnComplete value)? unComplete,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value)? $default, {
    TResult Function(_UserEntityModelComplete value)? complete,
    TResult Function(_UserEntityModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEntityModelInitToJson(
      this,
    );
  }
}

abstract class _UserEntityModelInit implements UserEntityModel {
  const factory _UserEntityModelInit(
      {required final UserId id,
      required final String name,
      @JsonKey(includeIfNull: false) final DateTime? createdAt,
      @JsonKey(includeIfNull: false) final DateTime? updatedAt,
      @JsonKey(includeIfNull: false) final DateTime? emailConfirmedAt,
      @JsonKey(includeIfNull: false) final DateTime? phoneConfirmedAt,
      @JsonKey(includeIfNull: false) final DateTime? lastSignInAt,
      final String? role}) = _$_UserEntityModelInit;

  factory _UserEntityModelInit.fromJson(Map<String, dynamic> json) =
      _$_UserEntityModelInit.fromJson;

  @override
  UserId get id;
  @override
  String get name;
  @JsonKey(includeIfNull: false)
  DateTime? get createdAt;
  @JsonKey(includeIfNull: false)
  DateTime? get updatedAt;
  @JsonKey(includeIfNull: false)
  DateTime? get emailConfirmedAt;
  @JsonKey(includeIfNull: false)
  DateTime? get phoneConfirmedAt;
  @JsonKey(includeIfNull: false)
  DateTime? get lastSignInAt;
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityModelInitCopyWith<_$_UserEntityModelInit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserEntityModelCompleteCopyWith<$Res>
    implements $UserEntityModelCopyWith<$Res> {
  factory _$$_UserEntityModelCompleteCopyWith(_$_UserEntityModelComplete value,
          $Res Function(_$_UserEntityModelComplete) then) =
      __$$_UserEntityModelCompleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserId id,
      String name,
      @UserConverter() AuthUser authUser,
      CubeUser cubeUser});

  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_UserEntityModelCompleteCopyWithImpl<$Res>
    extends _$UserEntityModelCopyWithImpl<$Res, _$_UserEntityModelComplete>
    implements _$$_UserEntityModelCompleteCopyWith<$Res> {
  __$$_UserEntityModelCompleteCopyWithImpl(_$_UserEntityModelComplete _value,
      $Res Function(_$_UserEntityModelComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? authUser = null,
    Object? cubeUser = null,
  }) {
    return _then(_$_UserEntityModelComplete(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      cubeUser: null == cubeUser
          ? _value.cubeUser
          : cubeUser // ignore: cast_nullable_to_non_nullable
              as CubeUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEntityModelComplete implements _UserEntityModelComplete {
  const _$_UserEntityModelComplete(
      {required this.id,
      required this.name,
      @UserConverter() required this.authUser,
      required this.cubeUser,
      final String? $type})
      : $type = $type ?? 'complete';

  factory _$_UserEntityModelComplete.fromJson(Map<String, dynamic> json) =>
      _$$_UserEntityModelCompleteFromJson(json);

  @override
  final UserId id;
  @override
  final String name;
  @override
  @UserConverter()
  final AuthUser authUser;
  @override
  final CubeUser cubeUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserEntityModel.complete(id: $id, name: $name, authUser: $authUser, cubeUser: $cubeUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntityModelComplete &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.cubeUser, cubeUser) ||
                other.cubeUser == cubeUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, authUser, cubeUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserEntityModelCompleteCopyWith<_$_UserEntityModelComplete>
      get copyWith =>
          __$$_UserEntityModelCompleteCopyWithImpl<_$_UserEntityModelComplete>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)
        $default, {
    required TResult Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)
        unComplete,
  }) {
    return complete(id, name, authUser, cubeUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult? Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
  }) {
    return complete?.call(id, name, authUser, cubeUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult Function(UserId id, String name, @UserConverter() AuthUser authUser,
            CubeUser cubeUser)?
        complete,
    TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(id, name, authUser, cubeUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value) $default, {
    required TResult Function(_UserEntityModelComplete value) complete,
    required TResult Function(_UserEntityModelUnComplete value) unComplete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserEntityModelInit value)? $default, {
    TResult? Function(_UserEntityModelComplete value)? complete,
    TResult? Function(_UserEntityModelUnComplete value)? unComplete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value)? $default, {
    TResult Function(_UserEntityModelComplete value)? complete,
    TResult Function(_UserEntityModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEntityModelCompleteToJson(
      this,
    );
  }
}

abstract class _UserEntityModelComplete implements UserEntityModel {
  const factory _UserEntityModelComplete(
      {required final UserId id,
      required final String name,
      @UserConverter() required final AuthUser authUser,
      required final CubeUser cubeUser}) = _$_UserEntityModelComplete;

  factory _UserEntityModelComplete.fromJson(Map<String, dynamic> json) =
      _$_UserEntityModelComplete.fromJson;

  @override
  UserId get id;
  @override
  String get name;
  @UserConverter()
  AuthUser get authUser;
  CubeUser get cubeUser;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityModelCompleteCopyWith<_$_UserEntityModelComplete>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UserEntityModelUnCompleteCopyWith<$Res>
    implements $UserEntityModelCopyWith<$Res> {
  factory _$$_UserEntityModelUnCompleteCopyWith(
          _$_UserEntityModelUnComplete value,
          $Res Function(_$_UserEntityModelUnComplete) then) =
      __$$_UserEntityModelUnCompleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, @UserConverter() AuthUser authUser});
}

/// @nodoc
class __$$_UserEntityModelUnCompleteCopyWithImpl<$Res>
    extends _$UserEntityModelCopyWithImpl<$Res, _$_UserEntityModelUnComplete>
    implements _$$_UserEntityModelUnCompleteCopyWith<$Res> {
  __$$_UserEntityModelUnCompleteCopyWithImpl(
      _$_UserEntityModelUnComplete _value,
      $Res Function(_$_UserEntityModelUnComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? authUser = null,
  }) {
    return _then(_$_UserEntityModelUnComplete(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEntityModelUnComplete implements _UserEntityModelUnComplete {
  const _$_UserEntityModelUnComplete(
      {required this.id,
      required this.name,
      @UserConverter() required this.authUser,
      final String? $type})
      : $type = $type ?? 'unComplete';

  factory _$_UserEntityModelUnComplete.fromJson(Map<String, dynamic> json) =>
      _$$_UserEntityModelUnCompleteFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @UserConverter()
  final AuthUser authUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserEntityModel.unComplete(id: $id, name: $name, authUser: $authUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserEntityModelUnComplete &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, authUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserEntityModelUnCompleteCopyWith<_$_UserEntityModelUnComplete>
      get copyWith => __$$_UserEntityModelUnCompleteCopyWithImpl<
          _$_UserEntityModelUnComplete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)
        $default, {
    required TResult Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)
        unComplete,
  }) {
    return unComplete(id, name, authUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult? Function(UserId id, String name,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
  }) {
    return unComplete?.call(id, name, authUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            UserId id,
            String name,
            @JsonKey(includeIfNull: false) DateTime? createdAt,
            @JsonKey(includeIfNull: false) DateTime? updatedAt,
            @JsonKey(includeIfNull: false) DateTime? emailConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? phoneConfirmedAt,
            @JsonKey(includeIfNull: false) DateTime? lastSignInAt,
            String? role)?
        $default, {
    TResult Function(UserId id, String name, @UserConverter() AuthUser authUser,
            CubeUser cubeUser)?
        complete,
    TResult Function(
            String id, String name, @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) {
    if (unComplete != null) {
      return unComplete(id, name, authUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value) $default, {
    required TResult Function(_UserEntityModelComplete value) complete,
    required TResult Function(_UserEntityModelUnComplete value) unComplete,
  }) {
    return unComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserEntityModelInit value)? $default, {
    TResult? Function(_UserEntityModelComplete value)? complete,
    TResult? Function(_UserEntityModelUnComplete value)? unComplete,
  }) {
    return unComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserEntityModelInit value)? $default, {
    TResult Function(_UserEntityModelComplete value)? complete,
    TResult Function(_UserEntityModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) {
    if (unComplete != null) {
      return unComplete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEntityModelUnCompleteToJson(
      this,
    );
  }
}

abstract class _UserEntityModelUnComplete implements UserEntityModel {
  const factory _UserEntityModelUnComplete(
          {required final String id,
          required final String name,
          @UserConverter() required final AuthUser authUser}) =
      _$_UserEntityModelUnComplete;

  factory _UserEntityModelUnComplete.fromJson(Map<String, dynamic> json) =
      _$_UserEntityModelUnComplete.fromJson;

  @override
  String get id;
  @override
  String get name;
  @UserConverter()
  AuthUser get authUser;
  @override
  @JsonKey(ignore: true)
  _$$_UserEntityModelUnCompleteCopyWith<_$_UserEntityModelUnComplete>
      get copyWith => throw _privateConstructorUsedError;
}
