// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travaux_entity_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TravauxEntityStates implements DiagnosticableTreeMixin {
  List<TravauxEntity> get travaux;

  /// Create a copy of TravauxEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TravauxEntityStatesCopyWith<TravauxEntityStates> get copyWith =>
      _$TravauxEntityStatesCopyWithImpl<TravauxEntityStates>(
          this as TravauxEntityStates, _$identity);

  /// Serializes this TravauxEntityStates to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntityStates'))
      ..add(DiagnosticsProperty('travaux', travaux));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TravauxEntityStates &&
            const DeepCollectionEquality().equals(other.travaux, travaux));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(travaux));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntityStates(travaux: $travaux)';
  }
}

/// @nodoc
abstract mixin class $TravauxEntityStatesCopyWith<$Res> {
  factory $TravauxEntityStatesCopyWith(
          TravauxEntityStates value, $Res Function(TravauxEntityStates) _then) =
      _$TravauxEntityStatesCopyWithImpl;
  @useResult
  $Res call({List<TravauxEntity> travaux});
}

/// @nodoc
class _$TravauxEntityStatesCopyWithImpl<$Res>
    implements $TravauxEntityStatesCopyWith<$Res> {
  _$TravauxEntityStatesCopyWithImpl(this._self, this._then);

  final TravauxEntityStates _self;
  final $Res Function(TravauxEntityStates) _then;

  /// Create a copy of TravauxEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travaux = null,
  }) {
    return _then(_self.copyWith(
      travaux: null == travaux
          ? _self.travaux
          : travaux // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TravauxEntityStates].
extension TravauxEntityStatesPatterns on TravauxEntityStates {
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
    TResult Function(_TravauxEntityStates value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityStates() when $default != null:
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
    TResult Function(_TravauxEntityStates value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityStates():
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
    TResult? Function(_TravauxEntityStates value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityStates() when $default != null:
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
    TResult Function(List<TravauxEntity> travaux)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityStates() when $default != null:
        return $default(_that.travaux);
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
    TResult Function(List<TravauxEntity> travaux) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityStates():
        return $default(_that.travaux);
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
    TResult? Function(List<TravauxEntity> travaux)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityStates() when $default != null:
        return $default(_that.travaux);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TravauxEntityStates
    with DiagnosticableTreeMixin
    implements TravauxEntityStates {
  const _TravauxEntityStates({required final List<TravauxEntity> travaux})
      : _travaux = travaux;
  factory _TravauxEntityStates.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityStatesFromJson(json);

  final List<TravauxEntity> _travaux;
  @override
  List<TravauxEntity> get travaux {
    if (_travaux is EqualUnmodifiableListView) return _travaux;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travaux);
  }

  /// Create a copy of TravauxEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TravauxEntityStatesCopyWith<_TravauxEntityStates> get copyWith =>
      __$TravauxEntityStatesCopyWithImpl<_TravauxEntityStates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TravauxEntityStatesToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntityStates'))
      ..add(DiagnosticsProperty('travaux', travaux));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TravauxEntityStates &&
            const DeepCollectionEquality().equals(other._travaux, _travaux));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_travaux));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntityStates(travaux: $travaux)';
  }
}

/// @nodoc
abstract mixin class _$TravauxEntityStatesCopyWith<$Res>
    implements $TravauxEntityStatesCopyWith<$Res> {
  factory _$TravauxEntityStatesCopyWith(_TravauxEntityStates value,
          $Res Function(_TravauxEntityStates) _then) =
      __$TravauxEntityStatesCopyWithImpl;
  @override
  @useResult
  $Res call({List<TravauxEntity> travaux});
}

/// @nodoc
class __$TravauxEntityStatesCopyWithImpl<$Res>
    implements _$TravauxEntityStatesCopyWith<$Res> {
  __$TravauxEntityStatesCopyWithImpl(this._self, this._then);

  final _TravauxEntityStates _self;
  final $Res Function(_TravauxEntityStates) _then;

  /// Create a copy of TravauxEntityStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? travaux = null,
  }) {
    return _then(_TravauxEntityStates(
      travaux: null == travaux
          ? _self._travaux
          : travaux // ignore: cast_nullable_to_non_nullable
              as List<TravauxEntity>,
    ));
  }
}

// dart format on
