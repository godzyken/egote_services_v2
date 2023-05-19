// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DevisEntity _$DevisEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'complete':
      return _DevisEntityComplete.fromJson(json);
    case 'initialize':
      return _DevisEntityInitialize.fromJson(json);
    case 'empty':
      return _DevisEntityEmpty.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DevisEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DevisEntity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)
        complete,
    required TResult Function(int id, String numDevis) initialize,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult? Function(int id, String numDevis)? initialize,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult Function(int id, String numDevis)? initialize,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisEntityComplete value) complete,
    required TResult Function(_DevisEntityInitialize value) initialize,
    required TResult Function(_DevisEntityEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisEntityComplete value)? complete,
    TResult? Function(_DevisEntityInitialize value)? initialize,
    TResult? Function(_DevisEntityEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisEntityComplete value)? complete,
    TResult Function(_DevisEntityInitialize value)? initialize,
    TResult Function(_DevisEntityEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevisEntityCopyWith<$Res> {
  factory $DevisEntityCopyWith(
          DevisEntity value, $Res Function(DevisEntity) then) =
      _$DevisEntityCopyWithImpl<$Res, DevisEntity>;
}

/// @nodoc
class _$DevisEntityCopyWithImpl<$Res, $Val extends DevisEntity>
    implements $DevisEntityCopyWith<$Res> {
  _$DevisEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DevisEntityCompleteCopyWith<$Res> {
  factory _$$_DevisEntityCompleteCopyWith(_$_DevisEntityComplete value,
          $Res Function(_$_DevisEntityComplete) then) =
      __$$_DevisEntityCompleteCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String numDevis,
      StatusModel? statusModel,
      TypesConstructionModel? typesConstructionModel,
      SuperficieEntity? superficieEntity,
      TravauxEntity? travauxEntity,
      ContactOwnerEntity? contactOwnerEntity,
      MissionEntity? missionEntity});

  $SuperficieEntityCopyWith<$Res>? get superficieEntity;
  $TravauxEntityCopyWith<$Res>? get travauxEntity;
  $ContactOwnerEntityCopyWith<$Res>? get contactOwnerEntity;
  $MissionEntityCopyWith<$Res>? get missionEntity;
}

/// @nodoc
class __$$_DevisEntityCompleteCopyWithImpl<$Res>
    extends _$DevisEntityCopyWithImpl<$Res, _$_DevisEntityComplete>
    implements _$$_DevisEntityCompleteCopyWith<$Res> {
  __$$_DevisEntityCompleteCopyWithImpl(_$_DevisEntityComplete _value,
      $Res Function(_$_DevisEntityComplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numDevis = null,
    Object? statusModel = freezed,
    Object? typesConstructionModel = freezed,
    Object? superficieEntity = freezed,
    Object? travauxEntity = freezed,
    Object? contactOwnerEntity = freezed,
    Object? missionEntity = freezed,
  }) {
    return _then(_$_DevisEntityComplete(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      numDevis: null == numDevis
          ? _value.numDevis
          : numDevis // ignore: cast_nullable_to_non_nullable
              as String,
      statusModel: freezed == statusModel
          ? _value.statusModel
          : statusModel // ignore: cast_nullable_to_non_nullable
              as StatusModel?,
      typesConstructionModel: freezed == typesConstructionModel
          ? _value.typesConstructionModel
          : typesConstructionModel // ignore: cast_nullable_to_non_nullable
              as TypesConstructionModel?,
      superficieEntity: freezed == superficieEntity
          ? _value.superficieEntity
          : superficieEntity // ignore: cast_nullable_to_non_nullable
              as SuperficieEntity?,
      travauxEntity: freezed == travauxEntity
          ? _value.travauxEntity
          : travauxEntity // ignore: cast_nullable_to_non_nullable
              as TravauxEntity?,
      contactOwnerEntity: freezed == contactOwnerEntity
          ? _value.contactOwnerEntity
          : contactOwnerEntity // ignore: cast_nullable_to_non_nullable
              as ContactOwnerEntity?,
      missionEntity: freezed == missionEntity
          ? _value.missionEntity
          : missionEntity // ignore: cast_nullable_to_non_nullable
              as MissionEntity?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SuperficieEntityCopyWith<$Res>? get superficieEntity {
    if (_value.superficieEntity == null) {
      return null;
    }

    return $SuperficieEntityCopyWith<$Res>(_value.superficieEntity!, (value) {
      return _then(_value.copyWith(superficieEntity: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TravauxEntityCopyWith<$Res>? get travauxEntity {
    if (_value.travauxEntity == null) {
      return null;
    }

    return $TravauxEntityCopyWith<$Res>(_value.travauxEntity!, (value) {
      return _then(_value.copyWith(travauxEntity: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactOwnerEntityCopyWith<$Res>? get contactOwnerEntity {
    if (_value.contactOwnerEntity == null) {
      return null;
    }

    return $ContactOwnerEntityCopyWith<$Res>(_value.contactOwnerEntity!,
        (value) {
      return _then(_value.copyWith(contactOwnerEntity: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MissionEntityCopyWith<$Res>? get missionEntity {
    if (_value.missionEntity == null) {
      return null;
    }

    return $MissionEntityCopyWith<$Res>(_value.missionEntity!, (value) {
      return _then(_value.copyWith(missionEntity: value));
    });
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_DevisEntityComplete implements _DevisEntityComplete {
  const _$_DevisEntityComplete(
      {required this.id,
      required this.numDevis,
      this.statusModel,
      this.typesConstructionModel,
      this.superficieEntity,
      this.travauxEntity,
      this.contactOwnerEntity,
      this.missionEntity,
      final String? $type})
      : $type = $type ?? 'complete';

  factory _$_DevisEntityComplete.fromJson(Map<String, dynamic> json) =>
      _$$_DevisEntityCompleteFromJson(json);

  @override
  final int id;
  @override
  final String numDevis;
  @override
  final StatusModel? statusModel;
  @override
  final TypesConstructionModel? typesConstructionModel;
  @override
  final SuperficieEntity? superficieEntity;
  @override
  final TravauxEntity? travauxEntity;
  @override
  final ContactOwnerEntity? contactOwnerEntity;
  @override
  final MissionEntity? missionEntity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DevisEntity.complete(id: $id, numDevis: $numDevis, statusModel: $statusModel, typesConstructionModel: $typesConstructionModel, superficieEntity: $superficieEntity, travauxEntity: $travauxEntity, contactOwnerEntity: $contactOwnerEntity, missionEntity: $missionEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevisEntityComplete &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numDevis, numDevis) ||
                other.numDevis == numDevis) &&
            (identical(other.statusModel, statusModel) ||
                other.statusModel == statusModel) &&
            (identical(other.typesConstructionModel, typesConstructionModel) ||
                other.typesConstructionModel == typesConstructionModel) &&
            (identical(other.superficieEntity, superficieEntity) ||
                other.superficieEntity == superficieEntity) &&
            (identical(other.travauxEntity, travauxEntity) ||
                other.travauxEntity == travauxEntity) &&
            (identical(other.contactOwnerEntity, contactOwnerEntity) ||
                other.contactOwnerEntity == contactOwnerEntity) &&
            (identical(other.missionEntity, missionEntity) ||
                other.missionEntity == missionEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      numDevis,
      statusModel,
      typesConstructionModel,
      superficieEntity,
      travauxEntity,
      contactOwnerEntity,
      missionEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DevisEntityCompleteCopyWith<_$_DevisEntityComplete> get copyWith =>
      __$$_DevisEntityCompleteCopyWithImpl<_$_DevisEntityComplete>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)
        complete,
    required TResult Function(int id, String numDevis) initialize,
    required TResult Function() empty,
  }) {
    return complete(id, numDevis, statusModel, typesConstructionModel,
        superficieEntity, travauxEntity, contactOwnerEntity, missionEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult? Function(int id, String numDevis)? initialize,
    TResult? Function()? empty,
  }) {
    return complete?.call(id, numDevis, statusModel, typesConstructionModel,
        superficieEntity, travauxEntity, contactOwnerEntity, missionEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult Function(int id, String numDevis)? initialize,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(id, numDevis, statusModel, typesConstructionModel,
          superficieEntity, travauxEntity, contactOwnerEntity, missionEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisEntityComplete value) complete,
    required TResult Function(_DevisEntityInitialize value) initialize,
    required TResult Function(_DevisEntityEmpty value) empty,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisEntityComplete value)? complete,
    TResult? Function(_DevisEntityInitialize value)? initialize,
    TResult? Function(_DevisEntityEmpty value)? empty,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisEntityComplete value)? complete,
    TResult Function(_DevisEntityInitialize value)? initialize,
    TResult Function(_DevisEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DevisEntityCompleteToJson(
      this,
    );
  }
}

abstract class _DevisEntityComplete implements DevisEntity {
  const factory _DevisEntityComplete(
      {required final int id,
      required final String numDevis,
      final StatusModel? statusModel,
      final TypesConstructionModel? typesConstructionModel,
      final SuperficieEntity? superficieEntity,
      final TravauxEntity? travauxEntity,
      final ContactOwnerEntity? contactOwnerEntity,
      final MissionEntity? missionEntity}) = _$_DevisEntityComplete;

  factory _DevisEntityComplete.fromJson(Map<String, dynamic> json) =
      _$_DevisEntityComplete.fromJson;

  int get id;
  String get numDevis;
  StatusModel? get statusModel;
  TypesConstructionModel? get typesConstructionModel;
  SuperficieEntity? get superficieEntity;
  TravauxEntity? get travauxEntity;
  ContactOwnerEntity? get contactOwnerEntity;
  MissionEntity? get missionEntity;
  @JsonKey(ignore: true)
  _$$_DevisEntityCompleteCopyWith<_$_DevisEntityComplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DevisEntityInitializeCopyWith<$Res> {
  factory _$$_DevisEntityInitializeCopyWith(_$_DevisEntityInitialize value,
          $Res Function(_$_DevisEntityInitialize) then) =
      __$$_DevisEntityInitializeCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String numDevis});
}

/// @nodoc
class __$$_DevisEntityInitializeCopyWithImpl<$Res>
    extends _$DevisEntityCopyWithImpl<$Res, _$_DevisEntityInitialize>
    implements _$$_DevisEntityInitializeCopyWith<$Res> {
  __$$_DevisEntityInitializeCopyWithImpl(_$_DevisEntityInitialize _value,
      $Res Function(_$_DevisEntityInitialize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numDevis = null,
  }) {
    return _then(_$_DevisEntityInitialize(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      numDevis: null == numDevis
          ? _value.numDevis
          : numDevis // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DevisEntityInitialize implements _DevisEntityInitialize {
  const _$_DevisEntityInitialize(
      {required this.id, required this.numDevis, final String? $type})
      : $type = $type ?? 'initialize';

  factory _$_DevisEntityInitialize.fromJson(Map<String, dynamic> json) =>
      _$$_DevisEntityInitializeFromJson(json);

  @override
  final int id;
  @override
  final String numDevis;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DevisEntity.initialize(id: $id, numDevis: $numDevis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DevisEntityInitialize &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numDevis, numDevis) ||
                other.numDevis == numDevis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, numDevis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DevisEntityInitializeCopyWith<_$_DevisEntityInitialize> get copyWith =>
      __$$_DevisEntityInitializeCopyWithImpl<_$_DevisEntityInitialize>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)
        complete,
    required TResult Function(int id, String numDevis) initialize,
    required TResult Function() empty,
  }) {
    return initialize(id, numDevis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult? Function(int id, String numDevis)? initialize,
    TResult? Function()? empty,
  }) {
    return initialize?.call(id, numDevis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult Function(int id, String numDevis)? initialize,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(id, numDevis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisEntityComplete value) complete,
    required TResult Function(_DevisEntityInitialize value) initialize,
    required TResult Function(_DevisEntityEmpty value) empty,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisEntityComplete value)? complete,
    TResult? Function(_DevisEntityInitialize value)? initialize,
    TResult? Function(_DevisEntityEmpty value)? empty,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisEntityComplete value)? complete,
    TResult Function(_DevisEntityInitialize value)? initialize,
    TResult Function(_DevisEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DevisEntityInitializeToJson(
      this,
    );
  }
}

abstract class _DevisEntityInitialize implements DevisEntity {
  const factory _DevisEntityInitialize(
      {required final int id,
      required final String numDevis}) = _$_DevisEntityInitialize;

  factory _DevisEntityInitialize.fromJson(Map<String, dynamic> json) =
      _$_DevisEntityInitialize.fromJson;

  int get id;
  String get numDevis;
  @JsonKey(ignore: true)
  _$$_DevisEntityInitializeCopyWith<_$_DevisEntityInitialize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DevisEntityEmptyCopyWith<$Res> {
  factory _$$_DevisEntityEmptyCopyWith(
          _$_DevisEntityEmpty value, $Res Function(_$_DevisEntityEmpty) then) =
      __$$_DevisEntityEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DevisEntityEmptyCopyWithImpl<$Res>
    extends _$DevisEntityCopyWithImpl<$Res, _$_DevisEntityEmpty>
    implements _$$_DevisEntityEmptyCopyWith<$Res> {
  __$$_DevisEntityEmptyCopyWithImpl(
      _$_DevisEntityEmpty _value, $Res Function(_$_DevisEntityEmpty) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_DevisEntityEmpty implements _DevisEntityEmpty {
  _$_DevisEntityEmpty({final String? $type}) : $type = $type ?? 'empty';

  factory _$_DevisEntityEmpty.fromJson(Map<String, dynamic> json) =>
      _$$_DevisEntityEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DevisEntity.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DevisEntityEmpty);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)
        complete,
    required TResult Function(int id, String numDevis) initialize,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult? Function(int id, String numDevis)? initialize,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int id,
            String numDevis,
            StatusModel? statusModel,
            TypesConstructionModel? typesConstructionModel,
            SuperficieEntity? superficieEntity,
            TravauxEntity? travauxEntity,
            ContactOwnerEntity? contactOwnerEntity,
            MissionEntity? missionEntity)?
        complete,
    TResult Function(int id, String numDevis)? initialize,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DevisEntityComplete value) complete,
    required TResult Function(_DevisEntityInitialize value) initialize,
    required TResult Function(_DevisEntityEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DevisEntityComplete value)? complete,
    TResult? Function(_DevisEntityInitialize value)? initialize,
    TResult? Function(_DevisEntityEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DevisEntityComplete value)? complete,
    TResult Function(_DevisEntityInitialize value)? initialize,
    TResult Function(_DevisEntityEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_DevisEntityEmptyToJson(
      this,
    );
  }
}

abstract class _DevisEntityEmpty implements DevisEntity {
  factory _DevisEntityEmpty() = _$_DevisEntityEmpty;

  factory _DevisEntityEmpty.fromJson(Map<String, dynamic> json) =
      _$_DevisEntityEmpty.fromJson;
}
