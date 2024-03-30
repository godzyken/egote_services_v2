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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEntityModel _$UserEntityModelFromJson(Map<String, dynamic> json) {
  return _UserEntityModel.fromJson(json);
}

/// @nodoc
mixin _$UserEntityModel {
  UserId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get emailConfirmedAt => throw _privateConstructorUsedError;
  DateTime get phoneConfirmedAt => throw _privateConstructorUsedError;
  DateTime get lastSignInAt => throw _privateConstructorUsedError;

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
  $Res call(
      {UserId id,
      String name,
      String role,
      bool isComplete,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime emailConfirmedAt,
      DateTime phoneConfirmedAt,
      DateTime lastSignInAt});

  $UserIdCopyWith<$Res> get id;
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
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? isComplete = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? emailConfirmedAt = null,
    Object? phoneConfirmedAt = null,
    Object? lastSignInAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emailConfirmedAt: null == emailConfirmedAt
          ? _value.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneConfirmedAt: null == phoneConfirmedAt
          ? _value.phoneConfirmedAt
          : phoneConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSignInAt: null == lastSignInAt
          ? _value.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEntityModelImplCopyWith<$Res>
    implements $UserEntityModelCopyWith<$Res> {
  factory _$$UserEntityModelImplCopyWith(_$UserEntityModelImpl value,
          $Res Function(_$UserEntityModelImpl) then) =
      __$$UserEntityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserId id,
      String name,
      String role,
      bool isComplete,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime emailConfirmedAt,
      DateTime phoneConfirmedAt,
      DateTime lastSignInAt});

  @override
  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$UserEntityModelImplCopyWithImpl<$Res>
    extends _$UserEntityModelCopyWithImpl<$Res, _$UserEntityModelImpl>
    implements _$$UserEntityModelImplCopyWith<$Res> {
  __$$UserEntityModelImplCopyWithImpl(
      _$UserEntityModelImpl _value, $Res Function(_$UserEntityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? isComplete = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? emailConfirmedAt = null,
    Object? phoneConfirmedAt = null,
    Object? lastSignInAt = null,
  }) {
    return _then(_$UserEntityModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emailConfirmedAt: null == emailConfirmedAt
          ? _value.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneConfirmedAt: null == phoneConfirmedAt
          ? _value.phoneConfirmedAt
          : phoneConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSignInAt: null == lastSignInAt
          ? _value.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$UserEntityModelImpl extends _UserEntityModel {
  const _$UserEntityModelImpl(
      {required this.id,
      required this.name,
      required this.role,
      required this.isComplete,
      required this.createdAt,
      required this.updatedAt,
      required this.emailConfirmedAt,
      required this.phoneConfirmedAt,
      required this.lastSignInAt})
      : super._();

  factory _$UserEntityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityModelImplFromJson(json);

  @override
  final UserId id;
  @override
  final String name;
  @override
  final String role;
  @override
  final bool isComplete;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime emailConfirmedAt;
  @override
  final DateTime phoneConfirmedAt;
  @override
  final DateTime lastSignInAt;

  @override
  String toString() {
    return 'UserEntityModel(id: $id, name: $name, role: $role, isComplete: $isComplete, createdAt: $createdAt, updatedAt: $updatedAt, emailConfirmedAt: $emailConfirmedAt, phoneConfirmedAt: $phoneConfirmedAt, lastSignInAt: $lastSignInAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.emailConfirmedAt, emailConfirmedAt) ||
                other.emailConfirmedAt == emailConfirmedAt) &&
            (identical(other.phoneConfirmedAt, phoneConfirmedAt) ||
                other.phoneConfirmedAt == phoneConfirmedAt) &&
            (identical(other.lastSignInAt, lastSignInAt) ||
                other.lastSignInAt == lastSignInAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, isComplete,
      createdAt, updatedAt, emailConfirmedAt, phoneConfirmedAt, lastSignInAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityModelImplCopyWith<_$UserEntityModelImpl> get copyWith =>
      __$$UserEntityModelImplCopyWithImpl<_$UserEntityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityModelImplToJson(
      this,
    );
  }
}

abstract class _UserEntityModel extends UserEntityModel {
  const factory _UserEntityModel(
      {required final UserId id,
      required final String name,
      required final String role,
      required final bool isComplete,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final DateTime emailConfirmedAt,
      required final DateTime phoneConfirmedAt,
      required final DateTime lastSignInAt}) = _$UserEntityModelImpl;
  const _UserEntityModel._() : super._();

  factory _UserEntityModel.fromJson(Map<String, dynamic> json) =
      _$UserEntityModelImpl.fromJson;

  @override
  UserId get id;
  @override
  String get name;
  @override
  String get role;
  @override
  bool get isComplete;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime get emailConfirmedAt;
  @override
  DateTime get phoneConfirmedAt;
  @override
  DateTime get lastSignInAt;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityModelImplCopyWith<_$UserEntityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Users {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserList userList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserList userList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserList userList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersData value) data,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersData value)? data,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersData value)? data,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res, Users>;
}

/// @nodoc
class _$UsersCopyWithImpl<$Res, $Val extends Users>
    implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UsersDataImplCopyWith<$Res> {
  factory _$$UsersDataImplCopyWith(
          _$UsersDataImpl value, $Res Function(_$UsersDataImpl) then) =
      __$$UsersDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserList userList});

  $UserListCopyWith<$Res> get userList;
}

/// @nodoc
class __$$UsersDataImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersDataImpl>
    implements _$$UsersDataImplCopyWith<$Res> {
  __$$UsersDataImplCopyWithImpl(
      _$UsersDataImpl _value, $Res Function(_$UsersDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userList = null,
  }) {
    return _then(_$UsersDataImpl(
      null == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as UserList,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserListCopyWith<$Res> get userList {
    return $UserListCopyWith<$Res>(_value.userList, (value) {
      return _then(_value.copyWith(userList: value));
    });
  }
}

/// @nodoc

class _$UsersDataImpl implements UsersData {
  const _$UsersDataImpl(this.userList);

  @override
  final UserList userList;

  @override
  String toString() {
    return 'Users.data(userList: $userList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersDataImpl &&
            (identical(other.userList, userList) ||
                other.userList == userList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersDataImplCopyWith<_$UsersDataImpl> get copyWith =>
      __$$UsersDataImplCopyWithImpl<_$UsersDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserList userList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return data(userList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserList userList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return data?.call(userList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserList userList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(userList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersData value) data,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersData value)? data,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersData value)? data,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class UsersData implements Users {
  const factory UsersData(final UserList userList) = _$UsersDataImpl;

  UserList get userList;
  @JsonKey(ignore: true)
  _$$UsersDataImplCopyWith<_$UsersDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersLoadingImplCopyWith<$Res> {
  factory _$$UsersLoadingImplCopyWith(
          _$UsersLoadingImpl value, $Res Function(_$UsersLoadingImpl) then) =
      __$$UsersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsersLoadingImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersLoadingImpl>
    implements _$$UsersLoadingImplCopyWith<$Res> {
  __$$UsersLoadingImplCopyWithImpl(
      _$UsersLoadingImpl _value, $Res Function(_$UsersLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UsersLoadingImpl implements UsersLoading {
  const _$UsersLoadingImpl();

  @override
  String toString() {
    return 'Users.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserList userList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserList userList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserList userList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersData value) data,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersData value)? data,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersData value)? data,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UsersLoading implements Users {
  const factory UsersLoading() = _$UsersLoadingImpl;
}

/// @nodoc
abstract class _$$UsersErrorImplCopyWith<$Res> {
  factory _$$UsersErrorImplCopyWith(
          _$UsersErrorImpl value, $Res Function(_$UsersErrorImpl) then) =
      __$$UsersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$UsersErrorImplCopyWithImpl<$Res>
    extends _$UsersCopyWithImpl<$Res, _$UsersErrorImpl>
    implements _$$UsersErrorImplCopyWith<$Res> {
  __$$UsersErrorImplCopyWithImpl(
      _$UsersErrorImpl _value, $Res Function(_$UsersErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$UsersErrorImpl(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$UsersErrorImpl implements UsersError {
  const _$UsersErrorImpl(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'Users.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersErrorImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersErrorImplCopyWith<_$UsersErrorImpl> get copyWith =>
      __$$UsersErrorImplCopyWithImpl<_$UsersErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserList userList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserList userList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserList userList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UsersData value) data,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersData value)? data,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersData value)? data,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UsersError implements Users {
  const factory UsersError(final Object error, final StackTrace stackTrace) =
      _$UsersErrorImpl;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$UsersErrorImplCopyWith<_$UsersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'Complete':
      return _UserModelComplete.fromJson(json);
    case 'UnComplete':
      return _UserModelUnComplete.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserModel {
  UserId get id => throw _privateConstructorUsedError;
  UserEntityModel get userEntityModel => throw _privateConstructorUsedError;
  @UserConverter()
  AuthUser get authUser => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)
        unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserModelComplete value) complete,
    required TResult Function(_UserModelUnComplete value) unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserModelComplete value)? complete,
    TResult? Function(_UserModelUnComplete value)? unComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserModelComplete value)? complete,
    TResult Function(_UserModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {UserId id,
      UserEntityModel userEntityModel,
      @UserConverter() AuthUser authUser});

  $UserIdCopyWith<$Res> get id;
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userEntityModel = null,
    Object? authUser = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      userEntityModel: null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
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
abstract class _$$UserModelCompleteImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelCompleteImplCopyWith(_$UserModelCompleteImpl value,
          $Res Function(_$UserModelCompleteImpl) then) =
      __$$UserModelCompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserId id,
      UserEntityModel userEntityModel,
      @UserConverter() AuthUser authUser,
      CubeUser cubeUser});

  @override
  $UserIdCopyWith<$Res> get id;
  @override
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class __$$UserModelCompleteImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelCompleteImpl>
    implements _$$UserModelCompleteImplCopyWith<$Res> {
  __$$UserModelCompleteImplCopyWithImpl(_$UserModelCompleteImpl _value,
      $Res Function(_$UserModelCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userEntityModel = null,
    Object? authUser = null,
    Object? cubeUser = null,
  }) {
    return _then(_$UserModelCompleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      userEntityModel: null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
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
}

/// @nodoc
@JsonSerializable()
class _$UserModelCompleteImpl implements _UserModelComplete {
  const _$UserModelCompleteImpl(
      {required this.id,
      required this.userEntityModel,
      @UserConverter() required this.authUser,
      required this.cubeUser,
      final String? $type})
      : $type = $type ?? 'Complete';

  factory _$UserModelCompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelCompleteImplFromJson(json);

  @override
  final UserId id;
  @override
  final UserEntityModel userEntityModel;
  @override
  @UserConverter()
  final AuthUser authUser;
  @override
  final CubeUser cubeUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserModel.complete(id: $id, userEntityModel: $userEntityModel, authUser: $authUser, cubeUser: $cubeUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelCompleteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.cubeUser, cubeUser) ||
                other.cubeUser == cubeUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userEntityModel, authUser, cubeUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelCompleteImplCopyWith<_$UserModelCompleteImpl> get copyWith =>
      __$$UserModelCompleteImplCopyWithImpl<_$UserModelCompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)
        unComplete,
  }) {
    return complete(id, userEntityModel, authUser, cubeUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
  }) {
    return complete?.call(id, userEntityModel, authUser, cubeUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(id, userEntityModel, authUser, cubeUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserModelComplete value) complete,
    required TResult Function(_UserModelUnComplete value) unComplete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserModelComplete value)? complete,
    TResult? Function(_UserModelUnComplete value)? unComplete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserModelComplete value)? complete,
    TResult Function(_UserModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelCompleteImplToJson(
      this,
    );
  }
}

abstract class _UserModelComplete implements UserModel {
  const factory _UserModelComplete(
      {required final UserId id,
      required final UserEntityModel userEntityModel,
      @UserConverter() required final AuthUser authUser,
      required final CubeUser cubeUser}) = _$UserModelCompleteImpl;

  factory _UserModelComplete.fromJson(Map<String, dynamic> json) =
      _$UserModelCompleteImpl.fromJson;

  @override
  UserId get id;
  @override
  UserEntityModel get userEntityModel;
  @override
  @UserConverter()
  AuthUser get authUser;
  CubeUser get cubeUser;
  @override
  @JsonKey(ignore: true)
  _$$UserModelCompleteImplCopyWith<_$UserModelCompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserModelUnCompleteImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelUnCompleteImplCopyWith(_$UserModelUnCompleteImpl value,
          $Res Function(_$UserModelUnCompleteImpl) then) =
      __$$UserModelUnCompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserId id,
      UserEntityModel userEntityModel,
      @UserConverter() AuthUser authUser});

  @override
  $UserIdCopyWith<$Res> get id;
  @override
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class __$$UserModelUnCompleteImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelUnCompleteImpl>
    implements _$$UserModelUnCompleteImplCopyWith<$Res> {
  __$$UserModelUnCompleteImplCopyWithImpl(_$UserModelUnCompleteImpl _value,
      $Res Function(_$UserModelUnCompleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userEntityModel = null,
    Object? authUser = null,
  }) {
    return _then(_$UserModelUnCompleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      userEntityModel: null == userEntityModel
          ? _value.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      authUser: null == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelUnCompleteImpl implements _UserModelUnComplete {
  const _$UserModelUnCompleteImpl(
      {required this.id,
      required this.userEntityModel,
      @UserConverter() required this.authUser,
      final String? $type})
      : $type = $type ?? 'UnComplete';

  factory _$UserModelUnCompleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelUnCompleteImplFromJson(json);

  @override
  final UserId id;
  @override
  final UserEntityModel userEntityModel;
  @override
  @UserConverter()
  final AuthUser authUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserModel.unComplete(id: $id, userEntityModel: $userEntityModel, authUser: $authUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelUnCompleteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userEntityModel, authUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelUnCompleteImplCopyWith<_$UserModelUnCompleteImpl> get copyWith =>
      __$$UserModelUnCompleteImplCopyWithImpl<_$UserModelUnCompleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)
        complete,
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)
        unComplete,
  }) {
    return unComplete(id, userEntityModel, authUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
  }) {
    return unComplete?.call(id, userEntityModel, authUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser, CubeUser cubeUser)?
        complete,
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) {
    if (unComplete != null) {
      return unComplete(id, userEntityModel, authUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserModelComplete value) complete,
    required TResult Function(_UserModelUnComplete value) unComplete,
  }) {
    return unComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserModelComplete value)? complete,
    TResult? Function(_UserModelUnComplete value)? unComplete,
  }) {
    return unComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserModelComplete value)? complete,
    TResult Function(_UserModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) {
    if (unComplete != null) {
      return unComplete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelUnCompleteImplToJson(
      this,
    );
  }
}

abstract class _UserModelUnComplete implements UserModel {
  const factory _UserModelUnComplete(
          {required final UserId id,
          required final UserEntityModel userEntityModel,
          @UserConverter() required final AuthUser authUser}) =
      _$UserModelUnCompleteImpl;

  factory _UserModelUnComplete.fromJson(Map<String, dynamic> json) =
      _$UserModelUnCompleteImpl.fromJson;

  @override
  UserId get id;
  @override
  UserEntityModel get userEntityModel;
  @override
  @UserConverter()
  AuthUser get authUser;
  @override
  @JsonKey(ignore: true)
  _$$UserModelUnCompleteImplCopyWith<_$UserModelUnCompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
