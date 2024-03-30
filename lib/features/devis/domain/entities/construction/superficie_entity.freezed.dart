// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'superficie_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuperficieEntity _$SuperficieEntityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initialize':
      return _SuperficieEntityInitialize.fromJson(json);
    case 'default':
      return _SuperficieEntityData.fromJson(json);
    case 'surface':
      return _SuperficieEntityAir.fromJson(json);
    case 'perimetre':
      return _SuperficieEntityPerimetre.fromJson(json);
    case 'volume':
      return _SuperficieEntityVolume.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'SuperficieEntity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$SuperficieEntity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuperficieEntityCopyWith<$Res> {
  factory $SuperficieEntityCopyWith(
          SuperficieEntity value, $Res Function(SuperficieEntity) then) =
      _$SuperficieEntityCopyWithImpl<$Res, SuperficieEntity>;
}

/// @nodoc
class _$SuperficieEntityCopyWithImpl<$Res, $Val extends SuperficieEntity>
    implements $SuperficieEntityCopyWith<$Res> {
  _$SuperficieEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuperficieEntityInitializeImplCopyWith<$Res> {
  factory _$$SuperficieEntityInitializeImplCopyWith(
          _$SuperficieEntityInitializeImpl value,
          $Res Function(_$SuperficieEntityInitializeImpl) then) =
      __$$SuperficieEntityInitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int longueur, int largeur, int? hauteur});
}

/// @nodoc
class __$$SuperficieEntityInitializeImplCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res,
        _$SuperficieEntityInitializeImpl>
    implements _$$SuperficieEntityInitializeImplCopyWith<$Res> {
  __$$SuperficieEntityInitializeImplCopyWithImpl(
      _$SuperficieEntityInitializeImpl _value,
      $Res Function(_$SuperficieEntityInitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longueur = null,
    Object? largeur = null,
    Object? hauteur = freezed,
  }) {
    return _then(_$SuperficieEntityInitializeImpl(
      longueur: null == longueur
          ? _value.longueur
          : longueur // ignore: cast_nullable_to_non_nullable
              as int,
      largeur: null == largeur
          ? _value.largeur
          : largeur // ignore: cast_nullable_to_non_nullable
              as int,
      hauteur: freezed == hauteur
          ? _value.hauteur
          : hauteur // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperficieEntityInitializeImpl extends _SuperficieEntityInitialize {
  const _$SuperficieEntityInitializeImpl(
      {required this.longueur,
      required this.largeur,
      this.hauteur,
      final String? $type})
      : $type = $type ?? 'initialize',
        super._();

  factory _$SuperficieEntityInitializeImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SuperficieEntityInitializeImplFromJson(json);

  @override
  final int longueur;
  @override
  final int largeur;
  @override
  final int? hauteur;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.initialize(longueur: $longueur, largeur: $largeur, hauteur: $hauteur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperficieEntityInitializeImpl &&
            (identical(other.longueur, longueur) ||
                other.longueur == longueur) &&
            (identical(other.largeur, largeur) || other.largeur == largeur) &&
            (identical(other.hauteur, hauteur) || other.hauteur == hauteur));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longueur, largeur, hauteur);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperficieEntityInitializeImplCopyWith<_$SuperficieEntityInitializeImpl>
      get copyWith => __$$SuperficieEntityInitializeImplCopyWithImpl<
          _$SuperficieEntityInitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) {
    return initialize(longueur, largeur, hauteur);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) {
    return initialize?.call(longueur, largeur, hauteur);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(longueur, largeur, hauteur);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperficieEntityInitializeImplToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityInitialize extends SuperficieEntity {
  const factory _SuperficieEntityInitialize(
      {required final int longueur,
      required final int largeur,
      final int? hauteur}) = _$SuperficieEntityInitializeImpl;
  const _SuperficieEntityInitialize._() : super._();

  factory _SuperficieEntityInitialize.fromJson(Map<String, dynamic> json) =
      _$SuperficieEntityInitializeImpl.fromJson;

  int get longueur;
  int get largeur;
  int? get hauteur;
  @JsonKey(ignore: true)
  _$$SuperficieEntityInitializeImplCopyWith<_$SuperficieEntityInitializeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuperficieEntityDataImplCopyWith<$Res> {
  factory _$$SuperficieEntityDataImplCopyWith(_$SuperficieEntityDataImpl value,
          $Res Function(_$SuperficieEntityDataImpl) then) =
      __$$SuperficieEntityDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int longueur, int largeur, int? hauteur});
}

/// @nodoc
class __$$SuperficieEntityDataImplCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$SuperficieEntityDataImpl>
    implements _$$SuperficieEntityDataImplCopyWith<$Res> {
  __$$SuperficieEntityDataImplCopyWithImpl(_$SuperficieEntityDataImpl _value,
      $Res Function(_$SuperficieEntityDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longueur = null,
    Object? largeur = null,
    Object? hauteur = freezed,
  }) {
    return _then(_$SuperficieEntityDataImpl(
      longueur: null == longueur
          ? _value.longueur
          : longueur // ignore: cast_nullable_to_non_nullable
              as int,
      largeur: null == largeur
          ? _value.largeur
          : largeur // ignore: cast_nullable_to_non_nullable
              as int,
      hauteur: freezed == hauteur
          ? _value.hauteur
          : hauteur // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperficieEntityDataImpl extends _SuperficieEntityData {
  const _$SuperficieEntityDataImpl(
      {required this.longueur,
      required this.largeur,
      this.hauteur,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$SuperficieEntityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuperficieEntityDataImplFromJson(json);

  @override
  final int longueur;
  @override
  final int largeur;
  @override
  final int? hauteur;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity(longueur: $longueur, largeur: $largeur, hauteur: $hauteur)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperficieEntityDataImpl &&
            (identical(other.longueur, longueur) ||
                other.longueur == longueur) &&
            (identical(other.largeur, largeur) || other.largeur == largeur) &&
            (identical(other.hauteur, hauteur) || other.hauteur == hauteur));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longueur, largeur, hauteur);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperficieEntityDataImplCopyWith<_$SuperficieEntityDataImpl>
      get copyWith =>
          __$$SuperficieEntityDataImplCopyWithImpl<_$SuperficieEntityDataImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) {
    return $default(longueur, largeur, hauteur);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) {
    return $default?.call(longueur, largeur, hauteur);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(longueur, largeur, hauteur);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperficieEntityDataImplToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityData extends SuperficieEntity {
  const factory _SuperficieEntityData(
      {required final int longueur,
      required final int largeur,
      final int? hauteur}) = _$SuperficieEntityDataImpl;
  const _SuperficieEntityData._() : super._();

  factory _SuperficieEntityData.fromJson(Map<String, dynamic> json) =
      _$SuperficieEntityDataImpl.fromJson;

  int get longueur;
  int get largeur;
  int? get hauteur;
  @JsonKey(ignore: true)
  _$$SuperficieEntityDataImplCopyWith<_$SuperficieEntityDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuperficieEntityAirImplCopyWith<$Res> {
  factory _$$SuperficieEntityAirImplCopyWith(_$SuperficieEntityAirImpl value,
          $Res Function(_$SuperficieEntityAirImpl) then) =
      __$$SuperficieEntityAirImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int surface});
}

/// @nodoc
class __$$SuperficieEntityAirImplCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$SuperficieEntityAirImpl>
    implements _$$SuperficieEntityAirImplCopyWith<$Res> {
  __$$SuperficieEntityAirImplCopyWithImpl(_$SuperficieEntityAirImpl _value,
      $Res Function(_$SuperficieEntityAirImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surface = null,
  }) {
    return _then(_$SuperficieEntityAirImpl(
      surface: null == surface
          ? _value.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperficieEntityAirImpl extends _SuperficieEntityAir {
  const _$SuperficieEntityAirImpl({required this.surface, final String? $type})
      : $type = $type ?? 'surface',
        super._();

  factory _$SuperficieEntityAirImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuperficieEntityAirImplFromJson(json);

  @override
  final int surface;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.surface(surface: $surface)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperficieEntityAirImpl &&
            (identical(other.surface, surface) || other.surface == surface));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, surface);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperficieEntityAirImplCopyWith<_$SuperficieEntityAirImpl> get copyWith =>
      __$$SuperficieEntityAirImplCopyWithImpl<_$SuperficieEntityAirImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) {
    return surface(this.surface);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) {
    return surface?.call(this.surface);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) {
    if (surface != null) {
      return surface(this.surface);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) {
    return surface(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) {
    return surface?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) {
    if (surface != null) {
      return surface(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperficieEntityAirImplToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityAir extends SuperficieEntity {
  const factory _SuperficieEntityAir({required final int surface}) =
      _$SuperficieEntityAirImpl;
  const _SuperficieEntityAir._() : super._();

  factory _SuperficieEntityAir.fromJson(Map<String, dynamic> json) =
      _$SuperficieEntityAirImpl.fromJson;

  int get surface;
  @JsonKey(ignore: true)
  _$$SuperficieEntityAirImplCopyWith<_$SuperficieEntityAirImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuperficieEntityPerimetreImplCopyWith<$Res> {
  factory _$$SuperficieEntityPerimetreImplCopyWith(
          _$SuperficieEntityPerimetreImpl value,
          $Res Function(_$SuperficieEntityPerimetreImpl) then) =
      __$$SuperficieEntityPerimetreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int perimetre});
}

/// @nodoc
class __$$SuperficieEntityPerimetreImplCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res,
        _$SuperficieEntityPerimetreImpl>
    implements _$$SuperficieEntityPerimetreImplCopyWith<$Res> {
  __$$SuperficieEntityPerimetreImplCopyWithImpl(
      _$SuperficieEntityPerimetreImpl _value,
      $Res Function(_$SuperficieEntityPerimetreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perimetre = null,
  }) {
    return _then(_$SuperficieEntityPerimetreImpl(
      perimetre: null == perimetre
          ? _value.perimetre
          : perimetre // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperficieEntityPerimetreImpl extends _SuperficieEntityPerimetre {
  const _$SuperficieEntityPerimetreImpl(
      {required this.perimetre, final String? $type})
      : $type = $type ?? 'perimetre',
        super._();

  factory _$SuperficieEntityPerimetreImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuperficieEntityPerimetreImplFromJson(json);

  @override
  final int perimetre;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.perimetre(perimetre: $perimetre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperficieEntityPerimetreImpl &&
            (identical(other.perimetre, perimetre) ||
                other.perimetre == perimetre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perimetre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperficieEntityPerimetreImplCopyWith<_$SuperficieEntityPerimetreImpl>
      get copyWith => __$$SuperficieEntityPerimetreImplCopyWithImpl<
          _$SuperficieEntityPerimetreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) {
    return perimetre(this.perimetre);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) {
    return perimetre?.call(this.perimetre);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) {
    if (perimetre != null) {
      return perimetre(this.perimetre);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) {
    return perimetre(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) {
    return perimetre?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) {
    if (perimetre != null) {
      return perimetre(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperficieEntityPerimetreImplToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityPerimetre extends SuperficieEntity {
  const factory _SuperficieEntityPerimetre({required final int perimetre}) =
      _$SuperficieEntityPerimetreImpl;
  const _SuperficieEntityPerimetre._() : super._();

  factory _SuperficieEntityPerimetre.fromJson(Map<String, dynamic> json) =
      _$SuperficieEntityPerimetreImpl.fromJson;

  int get perimetre;
  @JsonKey(ignore: true)
  _$$SuperficieEntityPerimetreImplCopyWith<_$SuperficieEntityPerimetreImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuperficieEntityVolumeImplCopyWith<$Res> {
  factory _$$SuperficieEntityVolumeImplCopyWith(
          _$SuperficieEntityVolumeImpl value,
          $Res Function(_$SuperficieEntityVolumeImpl) then) =
      __$$SuperficieEntityVolumeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int volume});
}

/// @nodoc
class __$$SuperficieEntityVolumeImplCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$SuperficieEntityVolumeImpl>
    implements _$$SuperficieEntityVolumeImplCopyWith<$Res> {
  __$$SuperficieEntityVolumeImplCopyWithImpl(
      _$SuperficieEntityVolumeImpl _value,
      $Res Function(_$SuperficieEntityVolumeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = null,
  }) {
    return _then(_$SuperficieEntityVolumeImpl(
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperficieEntityVolumeImpl extends _SuperficieEntityVolume {
  const _$SuperficieEntityVolumeImpl(
      {required this.volume, final String? $type})
      : $type = $type ?? 'volume',
        super._();

  factory _$SuperficieEntityVolumeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuperficieEntityVolumeImplFromJson(json);

  @override
  final int volume;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.volume(volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperficieEntityVolumeImpl &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperficieEntityVolumeImplCopyWith<_$SuperficieEntityVolumeImpl>
      get copyWith => __$$SuperficieEntityVolumeImplCopyWithImpl<
          _$SuperficieEntityVolumeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) {
    return volume(this.volume);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) {
    return volume?.call(this.volume);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this.volume);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) {
    return volume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) {
    return volume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperficieEntityVolumeImplToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityVolume extends SuperficieEntity {
  const factory _SuperficieEntityVolume({required final int volume}) =
      _$SuperficieEntityVolumeImpl;
  const _SuperficieEntityVolume._() : super._();

  factory _SuperficieEntityVolume.fromJson(Map<String, dynamic> json) =
      _$SuperficieEntityVolumeImpl.fromJson;

  int get volume;
  @JsonKey(ignore: true)
  _$$SuperficieEntityVolumeImplCopyWith<_$SuperficieEntityVolumeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
