// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travaux_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravauxEntity _$TravauxEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _TravauxEntity.fromJson(json);
    case 'Init':
      return _TravauxEntityInit.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TravauxEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TravauxEntity {
  TravauId get id => throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TravauxEntity value) $default, {
    required TResult Function(_TravauxEntityInit value) Init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TravauxEntity value)? $default, {
    TResult? Function(_TravauxEntityInit value)? Init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TravauxEntity value)? $default, {
    TResult Function(_TravauxEntityInit value)? Init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravauxEntityCopyWith<TravauxEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravauxEntityCopyWith<$Res> {
  factory $TravauxEntityCopyWith(
          TravauxEntity value, $Res Function(TravauxEntity) then) =
      _$TravauxEntityCopyWithImpl<$Res, TravauxEntity>;
  @useResult
  $Res call({TravauId id});

  $TravauIdCopyWith<$Res> get id;
}

/// @nodoc
class _$TravauxEntityCopyWithImpl<$Res, $Val extends TravauxEntity>
    implements $TravauxEntityCopyWith<$Res> {
  _$TravauxEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TravauId,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TravauIdCopyWith<$Res> get id {
    return $TravauIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TravauxEntityCopyWith<$Res>
    implements $TravauxEntityCopyWith<$Res> {
  factory _$$_TravauxEntityCopyWith(
          _$_TravauxEntity value, $Res Function(_$_TravauxEntity) then) =
      __$$_TravauxEntityCopyWithImpl<$Res>;
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
class __$$_TravauxEntityCopyWithImpl<$Res>
    extends _$TravauxEntityCopyWithImpl<$Res, _$_TravauxEntity>
    implements _$$_TravauxEntityCopyWith<$Res> {
  __$$_TravauxEntityCopyWithImpl(
      _$_TravauxEntity _value, $Res Function(_$_TravauxEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? denomination = null,
    Object? typesOfWorks = null,
    Object? areaOfServices = null,
    Object? missionEntity = null,
  }) {
    return _then(_$_TravauxEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TravauId,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      typesOfWorks: null == typesOfWorks
          ? _value._typesOfWorks
          : typesOfWorks // ignore: cast_nullable_to_non_nullable
              as List<TypesOfWork>,
      areaOfServices: null == areaOfServices
          ? _value._areaOfServices
          : areaOfServices // ignore: cast_nullable_to_non_nullable
              as List<AreaOfServices>,
      missionEntity: null == missionEntity
          ? _value._missionEntity
          : missionEntity // ignore: cast_nullable_to_non_nullable
              as List<MissionEntity>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_TravauxEntity with DiagnosticableTreeMixin implements _TravauxEntity {
  const _$_TravauxEntity(
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

  factory _$_TravauxEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TravauxEntityFromJson(json);

  @override
  final TravauId id;
  @override
  final String denomination;
  final List<TypesOfWork> _typesOfWorks;
  @override
  List<TypesOfWork> get typesOfWorks {
    if (_typesOfWorks is EqualUnmodifiableListView) return _typesOfWorks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typesOfWorks);
  }

  final List<AreaOfServices> _areaOfServices;
  @override
  List<AreaOfServices> get areaOfServices {
    if (_areaOfServices is EqualUnmodifiableListView) return _areaOfServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_areaOfServices);
  }

  final List<MissionEntity> _missionEntity;
  @override
  List<MissionEntity> get missionEntity {
    if (_missionEntity is EqualUnmodifiableListView) return _missionEntity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missionEntity);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntity(id: $id, denomination: $denomination, typesOfWorks: $typesOfWorks, areaOfServices: $areaOfServices, missionEntity: $missionEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('denomination', denomination))
      ..add(DiagnosticsProperty('typesOfWorks', typesOfWorks))
      ..add(DiagnosticsProperty('areaOfServices', areaOfServices))
      ..add(DiagnosticsProperty('missionEntity', missionEntity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravauxEntity &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      denomination,
      const DeepCollectionEquality().hash(_typesOfWorks),
      const DeepCollectionEquality().hash(_areaOfServices),
      const DeepCollectionEquality().hash(_missionEntity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravauxEntityCopyWith<_$_TravauxEntity> get copyWith =>
      __$$_TravauxEntityCopyWithImpl<_$_TravauxEntity>(this, _$identity);

  @override
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
    return $default(
        id, denomination, typesOfWorks, areaOfServices, missionEntity);
  }

  @override
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
    return $default?.call(
        id, denomination, typesOfWorks, areaOfServices, missionEntity);
  }

  @override
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
    if ($default != null) {
      return $default(
          id, denomination, typesOfWorks, areaOfServices, missionEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TravauxEntity value) $default, {
    required TResult Function(_TravauxEntityInit value) Init,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TravauxEntity value)? $default, {
    TResult? Function(_TravauxEntityInit value)? Init,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TravauxEntity value)? $default, {
    TResult Function(_TravauxEntityInit value)? Init,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravauxEntityToJson(
      this,
    );
  }
}

abstract class _TravauxEntity implements TravauxEntity {
  const factory _TravauxEntity(
      {required final TravauId id,
      required final String denomination,
      required final List<TypesOfWork> typesOfWorks,
      required final List<AreaOfServices> areaOfServices,
      required final List<MissionEntity> missionEntity}) = _$_TravauxEntity;

  factory _TravauxEntity.fromJson(Map<String, dynamic> json) =
      _$_TravauxEntity.fromJson;

  @override
  TravauId get id;
  String get denomination;
  List<TypesOfWork> get typesOfWorks;
  List<AreaOfServices> get areaOfServices;
  List<MissionEntity> get missionEntity;
  @override
  @JsonKey(ignore: true)
  _$$_TravauxEntityCopyWith<_$_TravauxEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TravauxEntityInitCopyWith<$Res>
    implements $TravauxEntityCopyWith<$Res> {
  factory _$$_TravauxEntityInitCopyWith(_$_TravauxEntityInit value,
          $Res Function(_$_TravauxEntityInit) then) =
      __$$_TravauxEntityInitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TravauId id});

  @override
  $TravauIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_TravauxEntityInitCopyWithImpl<$Res>
    extends _$TravauxEntityCopyWithImpl<$Res, _$_TravauxEntityInit>
    implements _$$_TravauxEntityInitCopyWith<$Res> {
  __$$_TravauxEntityInitCopyWithImpl(
      _$_TravauxEntityInit _value, $Res Function(_$_TravauxEntityInit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_TravauxEntityInit(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TravauId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TravauxEntityInit
    with DiagnosticableTreeMixin
    implements _TravauxEntityInit {
  _$_TravauxEntityInit({required this.id, final String? $type})
      : $type = $type ?? 'Init';

  factory _$_TravauxEntityInit.fromJson(Map<String, dynamic> json) =>
      _$$_TravauxEntityInitFromJson(json);

  @override
  final TravauId id;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntity.Init(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntity.Init'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravauxEntityInit &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravauxEntityInitCopyWith<_$_TravauxEntityInit> get copyWith =>
      __$$_TravauxEntityInitCopyWithImpl<_$_TravauxEntityInit>(
          this, _$identity);

  @override
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
    return Init(id);
  }

  @override
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
    return Init?.call(id);
  }

  @override
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
    if (Init != null) {
      return Init(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TravauxEntity value) $default, {
    required TResult Function(_TravauxEntityInit value) Init,
  }) {
    return Init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TravauxEntity value)? $default, {
    TResult? Function(_TravauxEntityInit value)? Init,
  }) {
    return Init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TravauxEntity value)? $default, {
    TResult Function(_TravauxEntityInit value)? Init,
    required TResult orElse(),
  }) {
    if (Init != null) {
      return Init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravauxEntityInitToJson(
      this,
    );
  }
}

abstract class _TravauxEntityInit implements TravauxEntity {
  factory _TravauxEntityInit({required final TravauId id}) =
      _$_TravauxEntityInit;

  factory _TravauxEntityInit.fromJson(Map<String, dynamic> json) =
      _$_TravauxEntityInit.fromJson;

  @override
  TravauId get id;
  @override
  @JsonKey(ignore: true)
  _$$_TravauxEntityInitCopyWith<_$_TravauxEntityInit> get copyWith =>
      throw _privateConstructorUsedError;
}
