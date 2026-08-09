// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_entity_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MissionEntityStates implements DiagnosticableTreeMixin {
  List<MissionEntity> get missionEntities;

  /// Create a copy of MissionEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MissionEntityStatesCopyWith<MissionEntityStates> get copyWith =>
      _$MissionEntityStatesCopyWithImpl<MissionEntityStates>(
          this as MissionEntityStates, _$identity);

  /// Serializes this MissionEntityStates to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MissionEntityStates'))
      ..add(DiagnosticsProperty('missionEntities', missionEntities));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MissionEntityStates &&
            const DeepCollectionEquality()
                .equals(other.missionEntities, missionEntities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(missionEntities));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MissionEntityStates(missionEntities: $missionEntities)';
  }
}

/// @nodoc
abstract mixin class $MissionEntityStatesCopyWith<$Res> {
  factory $MissionEntityStatesCopyWith(
          MissionEntityStates value, $Res Function(MissionEntityStates) _then) =
      _$MissionEntityStatesCopyWithImpl;
  @useResult
  $Res call({List<MissionEntity> missionEntities});
}

/// @nodoc
class _$MissionEntityStatesCopyWithImpl<$Res>
    implements $MissionEntityStatesCopyWith<$Res> {
  _$MissionEntityStatesCopyWithImpl(this._self, this._then);

  final MissionEntityStates _self;
  final $Res Function(MissionEntityStates) _then;

  /// Create a copy of MissionEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missionEntities = null,
  }) {
    return _then(_self.copyWith(
      missionEntities: null == missionEntities
          ? _self.missionEntities
          : missionEntities // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MissionEntityStates].
extension MissionEntityStatesPatterns on MissionEntityStates {
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
    TResult Function(_MissionEntityStates value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MissionEntityStates() when $default != null:
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
    TResult Function(_MissionEntityStates value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MissionEntityStates():
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
    TResult? Function(_MissionEntityStates value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MissionEntityStates() when $default != null:
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
    TResult Function(List<MissionEntity> missionEntities)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MissionEntityStates() when $default != null:
        return $default(_that.missionEntities);
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
    TResult Function(List<MissionEntity> missionEntities) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MissionEntityStates():
        return $default(_that.missionEntities);
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
    TResult? Function(List<MissionEntity> missionEntities)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MissionEntityStates() when $default != null:
        return $default(_that.missionEntities);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _MissionEntityStates
    with DiagnosticableTreeMixin
    implements MissionEntityStates {
  const _MissionEntityStates(
      {required final List<MissionEntity> missionEntities})
      : _missionEntities = missionEntities;
  factory _MissionEntityStates.fromJson(Map<String, dynamic> json) =>
      _$MissionEntityStatesFromJson(json);

  final List<MissionEntity> _missionEntities;
  @override
  List<MissionEntity> get missionEntities {
    if (_missionEntities is EqualUnmodifiableListView) return _missionEntities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missionEntities);
  }

  /// Create a copy of MissionEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MissionEntityStatesCopyWith<_MissionEntityStates> get copyWith =>
      __$MissionEntityStatesCopyWithImpl<_MissionEntityStates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MissionEntityStatesToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MissionEntityStates'))
      ..add(DiagnosticsProperty('missionEntities', missionEntities));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MissionEntityStates &&
            const DeepCollectionEquality()
                .equals(other._missionEntities, _missionEntities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_missionEntities));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MissionEntityStates(missionEntities: $missionEntities)';
  }
}

/// @nodoc
abstract mixin class _$MissionEntityStatesCopyWith<$Res>
    implements $MissionEntityStatesCopyWith<$Res> {
  factory _$MissionEntityStatesCopyWith(_MissionEntityStates value,
          $Res Function(_MissionEntityStates) _then) =
      __$MissionEntityStatesCopyWithImpl;
  @override
  @useResult
  $Res call({List<MissionEntity> missionEntities});
}

/// @nodoc
class __$MissionEntityStatesCopyWithImpl<$Res>
    implements _$MissionEntityStatesCopyWith<$Res> {
  __$MissionEntityStatesCopyWithImpl(this._self, this._then);

  final _MissionEntityStates _self;
  final $Res Function(_MissionEntityStates) _then;

  /// Create a copy of MissionEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? missionEntities = null,
  }) {
    return _then(_MissionEntityStates(
      missionEntities: null == missionEntities
          ? _self._missionEntities
          : missionEntities // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ));
  }
}

// dart format on
