// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travaux_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
TravauxEntity _$TravauxEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _TravauxEntityDefault.fromJson(json);
    case 'Init':
      return _TravauxEntityInit.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TravauxEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TravauxEntity implements DiagnosticableTreeMixin {
  TravauId get id;

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TravauxEntityCopyWith<TravauxEntity> get copyWith =>
      _$TravauxEntityCopyWithImpl<TravauxEntity>(
          this as TravauxEntity, _$identity);

  /// Serializes this TravauxEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntity'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TravauxEntity &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntity(id: $id)';
  }
}

/// @nodoc
abstract mixin class $TravauxEntityCopyWith<$Res> {
  factory $TravauxEntityCopyWith(
          TravauxEntity value, $Res Function(TravauxEntity) _then) =
      _$TravauxEntityCopyWithImpl;
  @useResult
  $Res call({TravauId id});

  $TravauIdCopyWith<$Res> get id;
}

/// @nodoc
class _$TravauxEntityCopyWithImpl<$Res>
    implements $TravauxEntityCopyWith<$Res> {
  _$TravauxEntityCopyWithImpl(this._self, this._then);

  final TravauxEntity _self;
  final $Res Function(TravauxEntity) _then;

  /// Create a copy of TravauxEntity
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
              as TravauId,
    ));
  }

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravauIdCopyWith<$Res> get id {
    return $TravauIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TravauxEntity].
extension TravauxEntityPatterns on TravauxEntity {
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
    TResult Function(_TravauxEntityDefault value)? $default, {
    TResult Function(_TravauxEntityInit value)? Init,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityDefault() when $default != null:
        return $default(_that);
      case _TravauxEntityInit() when Init != null:
        return Init(_that);
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
    TResult Function(_TravauxEntityDefault value) $default, {
    required TResult Function(_TravauxEntityInit value) Init,
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityDefault():
        return $default(_that);
      case _TravauxEntityInit():
        return Init(_that);
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
    TResult? Function(_TravauxEntityDefault value)? $default, {
    TResult? Function(_TravauxEntityInit value)? Init,
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityDefault() when $default != null:
        return $default(_that);
      case _TravauxEntityInit() when Init != null:
        return Init(_that);
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
            TravauId id,
            String denomination,
            List<TypesOfWork> typesOfWorks,
            List<AreaOfServices> areaOfServices,
            List<MissionEntity> missionEntity)?
        $default, {
    TResult Function(TravauId id)? Init,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityDefault() when $default != null:
        return $default(_that.id, _that.denomination, _that.typesOfWorks,
            _that.areaOfServices, _that.missionEntity);
      case _TravauxEntityInit() when Init != null:
        return Init(_that.id);
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
            TravauId id,
            String denomination,
            List<TypesOfWork> typesOfWorks,
            List<AreaOfServices> areaOfServices,
            List<MissionEntity> missionEntity)
        $default, {
    required TResult Function(TravauId id) Init,
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityDefault():
        return $default(_that.id, _that.denomination, _that.typesOfWorks,
            _that.areaOfServices, _that.missionEntity);
      case _TravauxEntityInit():
        return Init(_that.id);
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
            TravauId id,
            String denomination,
            List<TypesOfWork> typesOfWorks,
            List<AreaOfServices> areaOfServices,
            List<MissionEntity> missionEntity)?
        $default, {
    TResult? Function(TravauId id)? Init,
  }) {
    final _that = this;
    switch (_that) {
      case _TravauxEntityDefault() when $default != null:
        return $default(_that.id, _that.denomination, _that.typesOfWorks,
            _that.areaOfServices, _that.missionEntity);
      case _TravauxEntityInit() when Init != null:
        return Init(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TravauxEntityDefault
    with DiagnosticableTreeMixin
    implements TravauxEntity {
  const _TravauxEntityDefault(
      {required this.id,
      required this.denomination,
      required final List<TypesOfWork> typesOfWorks,
      required final List<AreaOfServices> areaOfServices,
      required final List<MissionEntity> missionEntity,
      final String? $type})
      : _typesOfWorks = typesOfWorks,
        _areaOfServices = areaOfServices,
        _missionEntity = missionEntity,
        $type = $type ?? 'default';
  factory _TravauxEntityDefault.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityDefaultFromJson(json);

  @override
  final TravauId id;
  final String denomination;
  final List<TypesOfWork> _typesOfWorks;
  List<TypesOfWork> get typesOfWorks {
    if (_typesOfWorks is EqualUnmodifiableListView) return _typesOfWorks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typesOfWorks);
  }

  final List<AreaOfServices> _areaOfServices;
  List<AreaOfServices> get areaOfServices {
    if (_areaOfServices is EqualUnmodifiableListView) return _areaOfServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areaOfServices);
  }

  final List<MissionEntity> _missionEntity;
  List<MissionEntity> get missionEntity {
    if (_missionEntity is EqualUnmodifiableListView) return _missionEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missionEntity);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TravauxEntityDefaultCopyWith<_TravauxEntityDefault> get copyWith =>
      __$TravauxEntityDefaultCopyWithImpl<_TravauxEntityDefault>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TravauxEntityDefaultToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('denomination', denomination))
      ..add(DiagnosticsProperty('typesOfWorks', typesOfWorks))
      ..add(DiagnosticsProperty('areaOfServices', areaOfServices))
      ..add(DiagnosticsProperty('missionEntity', missionEntity));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TravauxEntityDefault &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.denomination, denomination) ||
                other.denomination == denomination) &&
            const DeepCollectionEquality()
                .equals(other._typesOfWorks, _typesOfWorks) &&
            const DeepCollectionEquality()
                .equals(other._areaOfServices, _areaOfServices) &&
            const DeepCollectionEquality()
                .equals(other._missionEntity, _missionEntity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      denomination,
      const DeepCollectionEquality().hash(_typesOfWorks),
      const DeepCollectionEquality().hash(_areaOfServices),
      const DeepCollectionEquality().hash(_missionEntity));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntity(id: $id, denomination: $denomination, typesOfWorks: $typesOfWorks, areaOfServices: $areaOfServices, missionEntity: $missionEntity)';
  }
}

/// @nodoc
abstract mixin class _$TravauxEntityDefaultCopyWith<$Res>
    implements $TravauxEntityCopyWith<$Res> {
  factory _$TravauxEntityDefaultCopyWith(_TravauxEntityDefault value,
          $Res Function(_TravauxEntityDefault) _then) =
      __$TravauxEntityDefaultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TravauId id,
      String denomination,
      List<TypesOfWork> typesOfWorks,
      List<AreaOfServices> areaOfServices,
      List<MissionEntity> missionEntity});

  @override
  $TravauIdCopyWith<$Res> get id;
}

/// @nodoc
class __$TravauxEntityDefaultCopyWithImpl<$Res>
    implements _$TravauxEntityDefaultCopyWith<$Res> {
  __$TravauxEntityDefaultCopyWithImpl(this._self, this._then);

  final _TravauxEntityDefault _self;
  final $Res Function(_TravauxEntityDefault) _then;

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? typesOfWorks = null,
    Object? areaOfServices = null,
    Object? missionEntity = null,
  }) {
    return _then(_TravauxEntityDefault(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as TravauId,
      denomination: null == denomination
          ? _self.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      typesOfWorks: null == typesOfWorks
          ? _self._typesOfWorks
          : typesOfWorks // ignore: cast_nullable_to_non_nullable
              as List<TypesOfWork>,
      areaOfServices: null == areaOfServices
          ? _self._areaOfServices
          : areaOfServices // ignore: cast_nullable_to_non_nullable
              as List<AreaOfServices>,
      missionEntity: null == missionEntity
          ? _self._missionEntity
          : missionEntity // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ));
  }

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravauIdCopyWith<$Res> get id {
    return $TravauIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _TravauxEntityInit with DiagnosticableTreeMixin implements TravauxEntity {
  _TravauxEntityInit({required this.id, final String? $type})
      : $type = $type ?? 'Init';
  factory _TravauxEntityInit.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityInitFromJson(json);

  @override
  final TravauId id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TravauxEntityInitCopyWith<_TravauxEntityInit> get copyWith =>
      __$TravauxEntityInitCopyWithImpl<_TravauxEntityInit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TravauxEntityInitToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntity.Init'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TravauxEntityInit &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntity.Init(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$TravauxEntityInitCopyWith<$Res>
    implements $TravauxEntityCopyWith<$Res> {
  factory _$TravauxEntityInitCopyWith(
          _TravauxEntityInit value, $Res Function(_TravauxEntityInit) _then) =
      __$TravauxEntityInitCopyWithImpl;
  @override
  @useResult
  $Res call({TravauId id});

  @override
  $TravauIdCopyWith<$Res> get id;
}

/// @nodoc
class __$TravauxEntityInitCopyWithImpl<$Res>
    implements _$TravauxEntityInitCopyWith<$Res> {
  __$TravauxEntityInitCopyWithImpl(this._self, this._then);

  final _TravauxEntityInit _self;
  final $Res Function(_TravauxEntityInit) _then;

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_TravauxEntityInit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as TravauId,
    ));
  }

  /// Create a copy of TravauxEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravauIdCopyWith<$Res> get id {
    return $TravauIdCopyWith<$Res>(_self.id, (value) {
      return _then(_self.copyWith(id: value));
    });
  }
}

// dart format on
