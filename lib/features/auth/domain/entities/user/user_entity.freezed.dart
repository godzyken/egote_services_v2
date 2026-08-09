// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEntityModel {
  UserId get id;
  String get name;
  String get role;
  bool get isComplete;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get emailConfirmedAt;
  DateTime? get phoneConfirmedAt;
  DateTime? get lastSignInAt;

  /// Create a copy of UserEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<UserEntityModel> get copyWith =>
      _$UserEntityModelCopyWithImpl<UserEntityModel>(
          this as UserEntityModel, _$identity);

  /// Serializes this UserEntityModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserEntityModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, isComplete,
      createdAt, updatedAt, emailConfirmedAt, phoneConfirmedAt, lastSignInAt);

  @override
  String toString() {
    return 'UserEntityModel(id: $id, name: $name, role: $role, isComplete: $isComplete, createdAt: $createdAt, updatedAt: $updatedAt, emailConfirmedAt: $emailConfirmedAt, phoneConfirmedAt: $phoneConfirmedAt, lastSignInAt: $lastSignInAt)';
  }
}

/// @nodoc
abstract mixin class $UserEntityModelCopyWith<$Res> {
  factory $UserEntityModelCopyWith(
          UserEntityModel value, $Res Function(UserEntityModel) _then) =
      _$UserEntityModelCopyWithImpl;
  @useResult
  $Res call(
      {UserId id,
      String name,
      String role,
      bool isComplete,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? emailConfirmedAt,
      DateTime? phoneConfirmedAt,
      DateTime? lastSignInAt});

  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class _$UserEntityModelCopyWithImpl<$Res>
    implements $UserEntityModelCopyWith<$Res> {
  _$UserEntityModelCopyWithImpl(this._self, this._then);

  final UserEntityModel _self;
  final $Res Function(UserEntityModel) _then;

  /// Create a copy of UserEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? isComplete = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? emailConfirmedAt = freezed,
    Object? phoneConfirmedAt = freezed,
    Object? lastSignInAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _self.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emailConfirmedAt: freezed == emailConfirmedAt
          ? _self.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneConfirmedAt: freezed == phoneConfirmedAt
          ? _self.phoneConfirmedAt
          : phoneConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSignInAt: freezed == lastSignInAt
          ? _self.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UserEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserEntityModel].
extension UserEntityModelPatterns on UserEntityModel {
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
    TResult Function(_UserEntityModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserEntityModel() when $default != null:
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
    TResult Function(_UserEntityModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserEntityModel():
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
    TResult? Function(_UserEntityModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserEntityModel() when $default != null:
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
            UserId id,
            String name,
            String role,
            bool isComplete,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? emailConfirmedAt,
            DateTime? phoneConfirmedAt,
            DateTime? lastSignInAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserEntityModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.role,
            _that.isComplete,
            _that.createdAt,
            _that.updatedAt,
            _that.emailConfirmedAt,
            _that.phoneConfirmedAt,
            _that.lastSignInAt);
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
            UserId id,
            String name,
            String role,
            bool isComplete,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? emailConfirmedAt,
            DateTime? phoneConfirmedAt,
            DateTime? lastSignInAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserEntityModel():
        return $default(
            _that.id,
            _that.name,
            _that.role,
            _that.isComplete,
            _that.createdAt,
            _that.updatedAt,
            _that.emailConfirmedAt,
            _that.phoneConfirmedAt,
            _that.lastSignInAt);
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
            UserId id,
            String name,
            String role,
            bool isComplete,
            DateTime createdAt,
            DateTime updatedAt,
            DateTime? emailConfirmedAt,
            DateTime? phoneConfirmedAt,
            DateTime? lastSignInAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserEntityModel() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.role,
            _that.isComplete,
            _that.createdAt,
            _that.updatedAt,
            _that.emailConfirmedAt,
            _that.phoneConfirmedAt,
            _that.lastSignInAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _UserEntityModel extends UserEntityModel {
  const _UserEntityModel(
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
  factory _UserEntityModel.fromJson(Map<String, dynamic> json) =>
      _$UserEntityModelFromJson(json);

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
  final DateTime? emailConfirmedAt;
  @override
  final DateTime? phoneConfirmedAt;
  @override
  final DateTime? lastSignInAt;

  /// Create a copy of UserEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserEntityModelCopyWith<_UserEntityModel> get copyWith =>
      __$UserEntityModelCopyWithImpl<_UserEntityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserEntityModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserEntityModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, isComplete,
      createdAt, updatedAt, emailConfirmedAt, phoneConfirmedAt, lastSignInAt);

  @override
  String toString() {
    return 'UserEntityModel(id: $id, name: $name, role: $role, isComplete: $isComplete, createdAt: $createdAt, updatedAt: $updatedAt, emailConfirmedAt: $emailConfirmedAt, phoneConfirmedAt: $phoneConfirmedAt, lastSignInAt: $lastSignInAt)';
  }
}

/// @nodoc
abstract mixin class _$UserEntityModelCopyWith<$Res>
    implements $UserEntityModelCopyWith<$Res> {
  factory _$UserEntityModelCopyWith(
          _UserEntityModel value, $Res Function(_UserEntityModel) _then) =
      __$UserEntityModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserId id,
      String name,
      String role,
      bool isComplete,
      DateTime createdAt,
      DateTime updatedAt,
      DateTime? emailConfirmedAt,
      DateTime? phoneConfirmedAt,
      DateTime? lastSignInAt});

  @override
  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class __$UserEntityModelCopyWithImpl<$Res>
    implements _$UserEntityModelCopyWith<$Res> {
  __$UserEntityModelCopyWithImpl(this._self, this._then);

  final _UserEntityModel _self;
  final $Res Function(_UserEntityModel) _then;

  /// Create a copy of UserEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? isComplete = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? emailConfirmedAt = freezed,
    Object? phoneConfirmedAt = freezed,
    Object? lastSignInAt = freezed,
  }) {
    return _then(_UserEntityModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isComplete: null == isComplete
          ? _self.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emailConfirmedAt: freezed == emailConfirmedAt
          ? _self.emailConfirmedAt
          : emailConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneConfirmedAt: freezed == phoneConfirmedAt
          ? _self.phoneConfirmedAt
          : phoneConfirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSignInAt: freezed == lastSignInAt
          ? _self.lastSignInAt
          : lastSignInAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of UserEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
mixin _$Users {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Users);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Users()';
  }
}

/// @nodoc
class $UsersCopyWith<$Res> {
  $UsersCopyWith(Users _, $Res Function(Users) __);
}

/// Adds pattern-matching-related methods to [Users].
extension UsersPatterns on Users {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UsersData value)? data,
    TResult Function(UsersLoading value)? loading,
    TResult Function(UsersError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UsersData() when data != null:
        return data(_that);
      case UsersLoading() when loading != null:
        return loading(_that);
      case UsersError() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(UsersData value) data,
    required TResult Function(UsersLoading value) loading,
    required TResult Function(UsersError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case UsersData():
        return data(_that);
      case UsersLoading():
        return loading(_that);
      case UsersError():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UsersData value)? data,
    TResult? Function(UsersLoading value)? loading,
    TResult? Function(UsersError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case UsersData() when data != null:
        return data(_that);
      case UsersLoading() when loading != null:
        return loading(_that);
      case UsersError() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserList userList)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UsersData() when data != null:
        return data(_that.userList);
      case UsersLoading() when loading != null:
        return loading();
      case UsersError() when error != null:
        return error(_that.error, _that.stackTrace);
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
  TResult when<TResult extends Object?>({
    required TResult Function(UserList userList) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    final _that = this;
    switch (_that) {
      case UsersData():
        return data(_that.userList);
      case UsersLoading():
        return loading();
      case UsersError():
        return error(_that.error, _that.stackTrace);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserList userList)? data,
    TResult? Function()? loading,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    final _that = this;
    switch (_that) {
      case UsersData() when data != null:
        return data(_that.userList);
      case UsersLoading() when loading != null:
        return loading();
      case UsersError() when error != null:
        return error(_that.error, _that.stackTrace);
      case _:
        return null;
    }
  }
}

/// @nodoc

class UsersData implements Users {
  const UsersData(this.userList);

  final UserList userList;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersDataCopyWith<UsersData> get copyWith =>
      _$UsersDataCopyWithImpl<UsersData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersData &&
            (identical(other.userList, userList) ||
                other.userList == userList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userList);

  @override
  String toString() {
    return 'Users.data(userList: $userList)';
  }
}

/// @nodoc
abstract mixin class $UsersDataCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory $UsersDataCopyWith(UsersData value, $Res Function(UsersData) _then) =
      _$UsersDataCopyWithImpl;
  @useResult
  $Res call({UserList userList});

  $UserListCopyWith<$Res> get userList;
}

/// @nodoc
class _$UsersDataCopyWithImpl<$Res> implements $UsersDataCopyWith<$Res> {
  _$UsersDataCopyWithImpl(this._self, this._then);

  final UsersData _self;
  final $Res Function(UsersData) _then;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userList = null,
  }) {
    return _then(UsersData(
      null == userList
          ? _self.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as UserList,
    ));
  }

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserListCopyWith<$Res> get userList {
    return $UserListCopyWith<$Res>(_self.userList, (value) {
      return _then(_self.copyWith(userList: value));
    });
  }
}

/// @nodoc

class UsersLoading implements Users {
  const UsersLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UsersLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Users.loading()';
  }
}

/// @nodoc

class UsersError implements Users {
  const UsersError(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsersErrorCopyWith<UsersError> get copyWith =>
      _$UsersErrorCopyWithImpl<UsersError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsersError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @override
  String toString() {
    return 'Users.error(error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $UsersErrorCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory $UsersErrorCopyWith(
          UsersError value, $Res Function(UsersError) _then) =
      _$UsersErrorCopyWithImpl;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$UsersErrorCopyWithImpl<$Res> implements $UsersErrorCopyWith<$Res> {
  _$UsersErrorCopyWithImpl(this._self, this._then);

  final UsersError _self;
  final $Res Function(UsersError) _then;

  /// Create a copy of Users
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(UsersError(
      null == error ? _self.error : error,
      null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'complete':
      return _UserModelComplete.fromJson(json);
    case 'unComplete':
      return _UserModelUnComplete.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UserModel {
  UserId get id;
  UserEntityModel get userEntityModel;
  @UserConverter()
  AuthUser get authUser;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userEntityModel, authUser);

  @override
  String toString() {
    return 'UserModel(id: $id, userEntityModel: $userEntityModel, authUser: $authUser)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {UserId id,
      UserEntityModel userEntityModel,
      @UserConverter() AuthUser authUser});

  $UserIdCopyWith<$Res> get id;
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userEntityModel = null,
    Object? authUser = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      userEntityModel: null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      authUser: null == authUser
          ? _self.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<$Res> get userEntityModel {
    return $UserEntityModelCopyWith<$Res>(_self.userEntityModel, (value) {
      return _then(_self.copyWith(userEntityModel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserModelComplete value)? complete,
    TResult Function(_UserModelUnComplete value)? unComplete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModelComplete() when complete != null:
        return complete(_that);
      case _UserModelUnComplete() when unComplete != null:
        return unComplete(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_UserModelComplete value) complete,
    required TResult Function(_UserModelUnComplete value) unComplete,
  }) {
    final _that = this;
    switch (_that) {
      case _UserModelComplete():
        return complete(_that);
      case _UserModelUnComplete():
        return unComplete(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserModelComplete value)? complete,
    TResult? Function(_UserModelUnComplete value)? unComplete,
  }) {
    final _that = this;
    switch (_that) {
      case _UserModelComplete() when complete != null:
        return complete(_that);
      case _UserModelUnComplete() when unComplete != null:
        return unComplete(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            UserId id,
            UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser,
            @JsonKey(includeFromJson: false, includeToJson: false)
            CubeUser? cubeUser)?
        complete,
    TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModelComplete() when complete != null:
        return complete(
            _that.id, _that.userEntityModel, _that.authUser, _that.cubeUser);
      case _UserModelUnComplete() when unComplete != null:
        return unComplete(_that.id, _that.userEntityModel, _that.authUser);
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            UserId id,
            UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser,
            @JsonKey(includeFromJson: false, includeToJson: false)
            CubeUser? cubeUser)
        complete,
    required TResult Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)
        unComplete,
  }) {
    final _that = this;
    switch (_that) {
      case _UserModelComplete():
        return complete(
            _that.id, _that.userEntityModel, _that.authUser, _that.cubeUser);
      case _UserModelUnComplete():
        return unComplete(_that.id, _that.userEntityModel, _that.authUser);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            UserId id,
            UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser,
            @JsonKey(includeFromJson: false, includeToJson: false)
            CubeUser? cubeUser)?
        complete,
    TResult? Function(UserId id, UserEntityModel userEntityModel,
            @UserConverter() AuthUser authUser)?
        unComplete,
  }) {
    final _that = this;
    switch (_that) {
      case _UserModelComplete() when complete != null:
        return complete(
            _that.id, _that.userEntityModel, _that.authUser, _that.cubeUser);
      case _UserModelUnComplete() when unComplete != null:
        return unComplete(_that.id, _that.userEntityModel, _that.authUser);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModelComplete implements UserModel {
  const _UserModelComplete(
      {required this.id,
      required this.userEntityModel,
      @UserConverter() required this.authUser,
      @JsonKey(includeFromJson: false, includeToJson: false) this.cubeUser,
      final String? $type})
      : $type = $type ?? 'complete';
  factory _UserModelComplete.fromJson(Map<String, dynamic> json) =>
      _$UserModelCompleteFromJson(json);

  @override
  final UserId id;
  @override
  final UserEntityModel userEntityModel;
  @override
  @UserConverter()
  final AuthUser authUser;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final CubeUser? cubeUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCompleteCopyWith<_UserModelComplete> get copyWith =>
      __$UserModelCompleteCopyWithImpl<_UserModelComplete>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelCompleteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModelComplete &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.cubeUser, cubeUser) ||
                other.cubeUser == cubeUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userEntityModel, authUser, cubeUser);

  @override
  String toString() {
    return 'UserModel.complete(id: $id, userEntityModel: $userEntityModel, authUser: $authUser, cubeUser: $cubeUser)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCompleteCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCompleteCopyWith(
          _UserModelComplete value, $Res Function(_UserModelComplete) _then) =
      __$UserModelCompleteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserId id,
      UserEntityModel userEntityModel,
      @UserConverter() AuthUser authUser,
      @JsonKey(includeFromJson: false, includeToJson: false)
      CubeUser? cubeUser});

  @override
  $UserIdCopyWith<$Res> get id;
  @override
  $UserEntityModelCopyWith<$Res> get userEntityModel;
}

/// @nodoc
class __$UserModelCompleteCopyWithImpl<$Res>
    implements _$UserModelCompleteCopyWith<$Res> {
  __$UserModelCompleteCopyWithImpl(this._self, this._then);

  final _UserModelComplete _self;
  final $Res Function(_UserModelComplete) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userEntityModel = null,
    Object? authUser = null,
    Object? cubeUser = freezed,
  }) {
    return _then(_UserModelComplete(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      userEntityModel: null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      authUser: null == authUser
          ? _self.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
      cubeUser: freezed == cubeUser
          ? _self.cubeUser
          : cubeUser // ignore: cast_nullable_to_non_nullable
              as CubeUser?,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityModelCopyWith<$Res> get userEntityModel {
    return $UserEntityModelCopyWith<$Res>(_self.userEntityModel, (value) {
      return _then(_self.copyWith(userEntityModel: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserModelUnComplete implements UserModel {
  const _UserModelUnComplete(
      {required this.id,
      required this.userEntityModel,
      @UserConverter() required this.authUser,
      final String? $type})
      : $type = $type ?? 'unComplete';
  factory _UserModelUnComplete.fromJson(Map<String, dynamic> json) =>
      _$UserModelUnCompleteFromJson(json);

  @override
  final UserId id;
  @override
  final UserEntityModel userEntityModel;
  @override
  @UserConverter()
  final AuthUser authUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelUnCompleteCopyWith<_UserModelUnComplete> get copyWith =>
      __$UserModelUnCompleteCopyWithImpl<_UserModelUnComplete>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelUnCompleteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModelUnComplete &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userEntityModel, userEntityModel) ||
                other.userEntityModel == userEntityModel) &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userEntityModel, authUser);

  @override
  String toString() {
    return 'UserModel.unComplete(id: $id, userEntityModel: $userEntityModel, authUser: $authUser)';
  }
}

/// @nodoc
abstract mixin class _$UserModelUnCompleteCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelUnCompleteCopyWith(_UserModelUnComplete value,
          $Res Function(_UserModelUnComplete) _then) =
      __$UserModelUnCompleteCopyWithImpl;
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
class __$UserModelUnCompleteCopyWithImpl<$Res>
    implements _$UserModelUnCompleteCopyWith<$Res> {
  __$UserModelUnCompleteCopyWithImpl(this._self, this._then);

  final _UserModelUnComplete _self;
  final $Res Function(_UserModelUnComplete) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userEntityModel = null,
    Object? authUser = null,
  }) {
    return _then(_UserModelUnComplete(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      userEntityModel: null == userEntityModel
          ? _self.userEntityModel
          : userEntityModel // ignore: cast_nullable_to_non_nullable
              as UserEntityModel,
      authUser: null == authUser
          ? _self.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as AuthUser,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }

  /// Create a copy of UserModel
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
