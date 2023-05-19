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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_SuperficieEntityInitializeCopyWith<$Res> {
  factory _$$_SuperficieEntityInitializeCopyWith(
          _$_SuperficieEntityInitialize value,
          $Res Function(_$_SuperficieEntityInitialize) then) =
      __$$_SuperficieEntityInitializeCopyWithImpl<$Res>;
  @useResult
  $Res call({int longueur, int largeur, int? hauteur});
}

/// @nodoc
class __$$_SuperficieEntityInitializeCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$_SuperficieEntityInitialize>
    implements _$$_SuperficieEntityInitializeCopyWith<$Res> {
  __$$_SuperficieEntityInitializeCopyWithImpl(
      _$_SuperficieEntityInitialize _value,
      $Res Function(_$_SuperficieEntityInitialize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longueur = null,
    Object? largeur = null,
    Object? hauteur = freezed,
  }) {
    return _then(_$_SuperficieEntityInitialize(
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
class _$_SuperficieEntityInitialize extends _SuperficieEntityInitialize {
  const _$_SuperficieEntityInitialize(
      {required this.longueur,
      required this.largeur,
      this.hauteur,
      final String? $type})
      : $type = $type ?? 'initialize',
        super._();

  factory _$_SuperficieEntityInitialize.fromJson(Map<String, dynamic> json) =>
      _$$_SuperficieEntityInitializeFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuperficieEntityInitialize &&
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
  _$$_SuperficieEntityInitializeCopyWith<_$_SuperficieEntityInitialize>
      get copyWith => __$$_SuperficieEntityInitializeCopyWithImpl<
          _$_SuperficieEntityInitialize>(this, _$identity);

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
    return _$$_SuperficieEntityInitializeToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityInitialize extends SuperficieEntity {
  const factory _SuperficieEntityInitialize(
      {required final int longueur,
      required final int largeur,
      final int? hauteur}) = _$_SuperficieEntityInitialize;
  const _SuperficieEntityInitialize._() : super._();

  factory _SuperficieEntityInitialize.fromJson(Map<String, dynamic> json) =
      _$_SuperficieEntityInitialize.fromJson;

  int get longueur;
  int get largeur;
  int? get hauteur;
  @JsonKey(ignore: true)
  _$$_SuperficieEntityInitializeCopyWith<_$_SuperficieEntityInitialize>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuperficieEntityDataCopyWith<$Res> {
  factory _$$_SuperficieEntityDataCopyWith(_$_SuperficieEntityData value,
          $Res Function(_$_SuperficieEntityData) then) =
      __$$_SuperficieEntityDataCopyWithImpl<$Res>;
  @useResult
  $Res call({int longueur, int largeur, int? hauteur});
}

/// @nodoc
class __$$_SuperficieEntityDataCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$_SuperficieEntityData>
    implements _$$_SuperficieEntityDataCopyWith<$Res> {
  __$$_SuperficieEntityDataCopyWithImpl(_$_SuperficieEntityData _value,
      $Res Function(_$_SuperficieEntityData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longueur = null,
    Object? largeur = null,
    Object? hauteur = freezed,
  }) {
    return _then(_$_SuperficieEntityData(
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
class _$_SuperficieEntityData extends _SuperficieEntityData {
  const _$_SuperficieEntityData(
      {required this.longueur,
      required this.largeur,
      this.hauteur,
      final String? $type})
      : $type = $type ?? 'default',
        super._();

  factory _$_SuperficieEntityData.fromJson(Map<String, dynamic> json) =>
      _$$_SuperficieEntityDataFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuperficieEntityData &&
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
  _$$_SuperficieEntityDataCopyWith<_$_SuperficieEntityData> get copyWith =>
      __$$_SuperficieEntityDataCopyWithImpl<_$_SuperficieEntityData>(
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
    return _$$_SuperficieEntityDataToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityData extends SuperficieEntity {
  const factory _SuperficieEntityData(
      {required final int longueur,
      required final int largeur,
      final int? hauteur}) = _$_SuperficieEntityData;
  const _SuperficieEntityData._() : super._();

  factory _SuperficieEntityData.fromJson(Map<String, dynamic> json) =
      _$_SuperficieEntityData.fromJson;

  int get longueur;
  int get largeur;
  int? get hauteur;
  @JsonKey(ignore: true)
  _$$_SuperficieEntityDataCopyWith<_$_SuperficieEntityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuperficieEntityAirCopyWith<$Res> {
  factory _$$_SuperficieEntityAirCopyWith(_$_SuperficieEntityAir value,
          $Res Function(_$_SuperficieEntityAir) then) =
      __$$_SuperficieEntityAirCopyWithImpl<$Res>;
  @useResult
  $Res call({int surface});
}

/// @nodoc
class __$$_SuperficieEntityAirCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$_SuperficieEntityAir>
    implements _$$_SuperficieEntityAirCopyWith<$Res> {
  __$$_SuperficieEntityAirCopyWithImpl(_$_SuperficieEntityAir _value,
      $Res Function(_$_SuperficieEntityAir) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surface = null,
  }) {
    return _then(_$_SuperficieEntityAir(
      surface: null == surface
          ? _value.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuperficieEntityAir extends _SuperficieEntityAir {
  const _$_SuperficieEntityAir({required this.surface, final String? $type})
      : $type = $type ?? 'surface',
        super._();

  factory _$_SuperficieEntityAir.fromJson(Map<String, dynamic> json) =>
      _$$_SuperficieEntityAirFromJson(json);

  @override
  final int surface;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.surface(surface: $surface)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuperficieEntityAir &&
            (identical(other.surface, surface) || other.surface == surface));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, surface);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuperficieEntityAirCopyWith<_$_SuperficieEntityAir> get copyWith =>
      __$$_SuperficieEntityAirCopyWithImpl<_$_SuperficieEntityAir>(
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
    return _$$_SuperficieEntityAirToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityAir extends SuperficieEntity {
  const factory _SuperficieEntityAir({required final int surface}) =
      _$_SuperficieEntityAir;
  const _SuperficieEntityAir._() : super._();

  factory _SuperficieEntityAir.fromJson(Map<String, dynamic> json) =
      _$_SuperficieEntityAir.fromJson;

  int get surface;
  @JsonKey(ignore: true)
  _$$_SuperficieEntityAirCopyWith<_$_SuperficieEntityAir> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuperficieEntityPerimetreCopyWith<$Res> {
  factory _$$_SuperficieEntityPerimetreCopyWith(
          _$_SuperficieEntityPerimetre value,
          $Res Function(_$_SuperficieEntityPerimetre) then) =
      __$$_SuperficieEntityPerimetreCopyWithImpl<$Res>;
  @useResult
  $Res call({int perimetre});
}

/// @nodoc
class __$$_SuperficieEntityPerimetreCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$_SuperficieEntityPerimetre>
    implements _$$_SuperficieEntityPerimetreCopyWith<$Res> {
  __$$_SuperficieEntityPerimetreCopyWithImpl(
      _$_SuperficieEntityPerimetre _value,
      $Res Function(_$_SuperficieEntityPerimetre) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perimetre = null,
  }) {
    return _then(_$_SuperficieEntityPerimetre(
      perimetre: null == perimetre
          ? _value.perimetre
          : perimetre // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuperficieEntityPerimetre extends _SuperficieEntityPerimetre {
  const _$_SuperficieEntityPerimetre(
      {required this.perimetre, final String? $type})
      : $type = $type ?? 'perimetre',
        super._();

  factory _$_SuperficieEntityPerimetre.fromJson(Map<String, dynamic> json) =>
      _$$_SuperficieEntityPerimetreFromJson(json);

  @override
  final int perimetre;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.perimetre(perimetre: $perimetre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuperficieEntityPerimetre &&
            (identical(other.perimetre, perimetre) ||
                other.perimetre == perimetre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perimetre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuperficieEntityPerimetreCopyWith<_$_SuperficieEntityPerimetre>
      get copyWith => __$$_SuperficieEntityPerimetreCopyWithImpl<
          _$_SuperficieEntityPerimetre>(this, _$identity);

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
    return _$$_SuperficieEntityPerimetreToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityPerimetre extends SuperficieEntity {
  const factory _SuperficieEntityPerimetre({required final int perimetre}) =
      _$_SuperficieEntityPerimetre;
  const _SuperficieEntityPerimetre._() : super._();

  factory _SuperficieEntityPerimetre.fromJson(Map<String, dynamic> json) =
      _$_SuperficieEntityPerimetre.fromJson;

  int get perimetre;
  @JsonKey(ignore: true)
  _$$_SuperficieEntityPerimetreCopyWith<_$_SuperficieEntityPerimetre>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuperficieEntityVolumeCopyWith<$Res> {
  factory _$$_SuperficieEntityVolumeCopyWith(_$_SuperficieEntityVolume value,
          $Res Function(_$_SuperficieEntityVolume) then) =
      __$$_SuperficieEntityVolumeCopyWithImpl<$Res>;
  @useResult
  $Res call({int volume});
}

/// @nodoc
class __$$_SuperficieEntityVolumeCopyWithImpl<$Res>
    extends _$SuperficieEntityCopyWithImpl<$Res, _$_SuperficieEntityVolume>
    implements _$$_SuperficieEntityVolumeCopyWith<$Res> {
  __$$_SuperficieEntityVolumeCopyWithImpl(_$_SuperficieEntityVolume _value,
      $Res Function(_$_SuperficieEntityVolume) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? volume = null,
  }) {
    return _then(_$_SuperficieEntityVolume(
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SuperficieEntityVolume extends _SuperficieEntityVolume {
  const _$_SuperficieEntityVolume({required this.volume, final String? $type})
      : $type = $type ?? 'volume',
        super._();

  factory _$_SuperficieEntityVolume.fromJson(Map<String, dynamic> json) =>
      _$$_SuperficieEntityVolumeFromJson(json);

  @override
  final int volume;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SuperficieEntity.volume(volume: $volume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuperficieEntityVolume &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuperficieEntityVolumeCopyWith<_$_SuperficieEntityVolume> get copyWith =>
      __$$_SuperficieEntityVolumeCopyWithImpl<_$_SuperficieEntityVolume>(
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
    return _$$_SuperficieEntityVolumeToJson(
      this,
    );
  }
}

abstract class _SuperficieEntityVolume extends SuperficieEntity {
  const factory _SuperficieEntityVolume({required final int volume}) =
      _$_SuperficieEntityVolume;
  const _SuperficieEntityVolume._() : super._();

  factory _SuperficieEntityVolume.fromJson(Map<String, dynamic> json) =
      _$_SuperficieEntityVolume.fromJson;

  int get volume;
  @JsonKey(ignore: true)
  _$$_SuperficieEntityVolumeCopyWith<_$_SuperficieEntityVolume> get copyWith =>
      throw _privateConstructorUsedError;
}
