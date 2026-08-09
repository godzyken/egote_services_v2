// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travau_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TravauId {
  int get id;

  /// Create a copy of TravauId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TravauIdCopyWith<TravauId> get copyWith =>
      _$TravauIdCopyWithImpl<TravauId>(this as TravauId, _$identity);

  /// Serializes this TravauId to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TravauId &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'TravauId(id: $id)';
  }
}

/// @nodoc
abstract mixin class $TravauIdCopyWith<$Res> {
  factory $TravauIdCopyWith(TravauId value, $Res Function(TravauId) _then) =
      _$TravauIdCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$TravauIdCopyWithImpl<$Res> implements $TravauIdCopyWith<$Res> {
  _$TravauIdCopyWithImpl(this._self, this._then);

  final TravauId _self;
  final $Res Function(TravauId) _then;

  /// Create a copy of TravauId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [TravauId].
extension TravauIdPatterns on TravauId {
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
    TResult Function(_TravauId value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TravauId() when $default != null:
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
    TResult Function(_TravauId value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauId():
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
    TResult? Function(_TravauId value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauId() when $default != null:
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
    TResult Function(int id)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TravauId() when $default != null:
        return $default(_that.id);
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
    TResult Function(int id) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauId():
        return $default(_that.id);
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
    TResult? Function(int id)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauId() when $default != null:
        return $default(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TravauId implements TravauId {
  const _TravauId({required this.id});
  factory _TravauId.fromJson(Map<String, dynamic> json) =>
      _$TravauIdFromJson(json);

  @override
  final int id;

  /// Create a copy of TravauId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TravauIdCopyWith<_TravauId> get copyWith =>
      __$TravauIdCopyWithImpl<_TravauId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TravauIdToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TravauId &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'TravauId(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$TravauIdCopyWith<$Res>
    implements $TravauIdCopyWith<$Res> {
  factory _$TravauIdCopyWith(_TravauId value, $Res Function(_TravauId) _then) =
      __$TravauIdCopyWithImpl;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$TravauIdCopyWithImpl<$Res> implements _$TravauIdCopyWith<$Res> {
  __$TravauIdCopyWithImpl(this._self, this._then);

  final _TravauId _self;
  final $Res Function(_TravauId) _then;

  /// Create a copy of TravauId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_TravauId(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
