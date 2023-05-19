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
  return _TravauxEntity.fromJson(json);
}

/// @nodoc
mixin _$TravauxEntity {
  int get id => throw _privateConstructorUsedError;
  String get denomination => throw _privateConstructorUsedError;
  MissionEntity? get missionEntity => throw _privateConstructorUsedError;

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
  $Res call({int id, String denomination, MissionEntity? missionEntity});

  $MissionEntityCopyWith<$Res>? get missionEntity;
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
    Object? denomination = null,
    Object? missionEntity = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      missionEntity: freezed == missionEntity
          ? _value.missionEntity
          : missionEntity // ignore: cast_nullable_to_non_nullable
              as MissionEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MissionEntityCopyWith<$Res>? get missionEntity {
    if (_value.missionEntity == null) {
      return null;
    }

    return $MissionEntityCopyWith<$Res>(_value.missionEntity!, (value) {
      return _then(_value.copyWith(missionEntity: value) as $Val);
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
  $Res call({int id, String denomination, MissionEntity? missionEntity});

  @override
  $MissionEntityCopyWith<$Res>? get missionEntity;
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
    Object? missionEntity = freezed,
  }) {
    return _then(_$_TravauxEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      denomination: null == denomination
          ? _value.denomination
          : denomination // ignore: cast_nullable_to_non_nullable
              as String,
      missionEntity: freezed == missionEntity
          ? _value.missionEntity
          : missionEntity // ignore: cast_nullable_to_non_nullable
              as MissionEntity?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_TravauxEntity with DiagnosticableTreeMixin implements _TravauxEntity {
  const _$_TravauxEntity(
      {required this.id, required this.denomination, this.missionEntity});

  factory _$_TravauxEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TravauxEntityFromJson(json);

  @override
  final int id;
  @override
  final String denomination;
  @override
  final MissionEntity? missionEntity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravauxEntity(id: $id, denomination: $denomination, missionEntity: $missionEntity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravauxEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('denomination', denomination))
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
            (identical(other.missionEntity, missionEntity) ||
                other.missionEntity == missionEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, denomination, missionEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravauxEntityCopyWith<_$_TravauxEntity> get copyWith =>
      __$$_TravauxEntityCopyWithImpl<_$_TravauxEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravauxEntityToJson(
      this,
    );
  }
}

abstract class _TravauxEntity implements TravauxEntity {
  const factory _TravauxEntity(
      {required final int id,
      required final String denomination,
      final MissionEntity? missionEntity}) = _$_TravauxEntity;

  factory _TravauxEntity.fromJson(Map<String, dynamic> json) =
      _$_TravauxEntity.fromJson;

  @override
  int get id;
  @override
  String get denomination;
  @override
  MissionEntity? get missionEntity;
  @override
  @JsonKey(ignore: true)
  _$$_TravauxEntityCopyWith<_$_TravauxEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
