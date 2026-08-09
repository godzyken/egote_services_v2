// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserList {
  List<UserEntityModel> get values;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserListCopyWith<UserList> get copyWith =>
      _$UserListCopyWithImpl<UserList>(this as UserList, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserList &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(values));

  @override
  String toString() {
    return 'UserList(values: $values)';
  }
}

/// @nodoc
abstract mixin class $UserListCopyWith<$Res> {
  factory $UserListCopyWith(UserList value, $Res Function(UserList) _then) =
      _$UserListCopyWithImpl;
  @useResult
  $Res call({List<UserEntityModel> values});
}

/// @nodoc
class _$UserListCopyWithImpl<$Res> implements $UserListCopyWith<$Res> {
  _$UserListCopyWithImpl(this._self, this._then);

  final UserList _self;
  final $Res Function(UserList) _then;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_self.copyWith(
      values: null == values
          ? _self.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<UserEntityModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserList].
extension UserListPatterns on UserList {
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
    TResult Function(_UserList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserList() when $default != null:
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
    TResult Function(_UserList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserList():
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
    TResult? Function(_UserList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserList() when $default != null:
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
    TResult Function(List<UserEntityModel> values)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserList() when $default != null:
        return $default(_that.values);
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
    TResult Function(List<UserEntityModel> values) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserList():
        return $default(_that.values);
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
    TResult? Function(List<UserEntityModel> values)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserList() when $default != null:
        return $default(_that.values);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserList extends UserList {
  const _UserList({required final List<UserEntityModel> values})
      : _values = values,
        super._();

  final List<UserEntityModel> _values;
  @override
  List<UserEntityModel> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserListCopyWith<_UserList> get copyWith =>
      __$UserListCopyWithImpl<_UserList>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserList &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_values));

  @override
  String toString() {
    return 'UserList(values: $values)';
  }
}

/// @nodoc
abstract mixin class _$UserListCopyWith<$Res>
    implements $UserListCopyWith<$Res> {
  factory _$UserListCopyWith(_UserList value, $Res Function(_UserList) _then) =
      __$UserListCopyWithImpl;
  @override
  @useResult
  $Res call({List<UserEntityModel> values});
}

/// @nodoc
class __$UserListCopyWithImpl<$Res> implements _$UserListCopyWith<$Res> {
  __$UserListCopyWithImpl(this._self, this._then);

  final _UserList _self;
  final $Res Function(_UserList) _then;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? values = null,
  }) {
    return _then(_UserList(
      values: null == values
          ? _self._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<UserEntityModel>,
    ));
  }
}

// dart format on
