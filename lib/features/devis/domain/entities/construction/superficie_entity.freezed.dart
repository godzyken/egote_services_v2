// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'superficie_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
  /// Serializes this SuperficieEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SuperficieEntity);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SuperficieEntity()';
  }
}

/// @nodoc
class $SuperficieEntityCopyWith<$Res> {
  $SuperficieEntityCopyWith(
      SuperficieEntity _, $Res Function(SuperficieEntity) __);
}

/// Adds pattern-matching-related methods to [SuperficieEntity].
extension SuperficieEntityPatterns on SuperficieEntity {
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
    TResult Function(_SuperficieEntityData value)? $default, {
    TResult Function(_SuperficieEntityInitialize value)? initialize,
    TResult Function(_SuperficieEntityAir value)? surface,
    TResult Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult Function(_SuperficieEntityVolume value)? volume,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SuperficieEntityInitialize() when initialize != null:
        return initialize(_that);
      case _SuperficieEntityData() when $default != null:
        return $default(_that);
      case _SuperficieEntityAir() when surface != null:
        return surface(_that);
      case _SuperficieEntityPerimetre() when perimetre != null:
        return perimetre(_that);
      case _SuperficieEntityVolume() when volume != null:
        return volume(_that);
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
    TResult Function(_SuperficieEntityData value) $default, {
    required TResult Function(_SuperficieEntityInitialize value) initialize,
    required TResult Function(_SuperficieEntityAir value) surface,
    required TResult Function(_SuperficieEntityPerimetre value) perimetre,
    required TResult Function(_SuperficieEntityVolume value) volume,
  }) {
    final _that = this;
    switch (_that) {
      case _SuperficieEntityInitialize():
        return initialize(_that);
      case _SuperficieEntityData():
        return $default(_that);
      case _SuperficieEntityAir():
        return surface(_that);
      case _SuperficieEntityPerimetre():
        return perimetre(_that);
      case _SuperficieEntityVolume():
        return volume(_that);
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
    TResult? Function(_SuperficieEntityData value)? $default, {
    TResult? Function(_SuperficieEntityInitialize value)? initialize,
    TResult? Function(_SuperficieEntityAir value)? surface,
    TResult? Function(_SuperficieEntityPerimetre value)? perimetre,
    TResult? Function(_SuperficieEntityVolume value)? volume,
  }) {
    final _that = this;
    switch (_that) {
      case _SuperficieEntityInitialize() when initialize != null:
        return initialize(_that);
      case _SuperficieEntityData() when $default != null:
        return $default(_that);
      case _SuperficieEntityAir() when surface != null:
        return surface(_that);
      case _SuperficieEntityPerimetre() when perimetre != null:
        return perimetre(_that);
      case _SuperficieEntityVolume() when volume != null:
        return volume(_that);
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
    TResult Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult Function(int surface)? surface,
    TResult Function(int perimetre)? perimetre,
    TResult Function(int volume)? volume,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SuperficieEntityInitialize() when initialize != null:
        return initialize(_that.longueur, _that.largeur, _that.hauteur);
      case _SuperficieEntityData() when $default != null:
        return $default(_that.longueur, _that.largeur, _that.hauteur);
      case _SuperficieEntityAir() when surface != null:
        return surface(_that.surface);
      case _SuperficieEntityPerimetre() when perimetre != null:
        return perimetre(_that.perimetre);
      case _SuperficieEntityVolume() when volume != null:
        return volume(_that.volume);
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
    TResult Function(int longueur, int largeur, int? hauteur) $default, {
    required TResult Function(int longueur, int largeur, int? hauteur)
        initialize,
    required TResult Function(int surface) surface,
    required TResult Function(int perimetre) perimetre,
    required TResult Function(int volume) volume,
  }) {
    final _that = this;
    switch (_that) {
      case _SuperficieEntityInitialize():
        return initialize(_that.longueur, _that.largeur, _that.hauteur);
      case _SuperficieEntityData():
        return $default(_that.longueur, _that.largeur, _that.hauteur);
      case _SuperficieEntityAir():
        return surface(_that.surface);
      case _SuperficieEntityPerimetre():
        return perimetre(_that.perimetre);
      case _SuperficieEntityVolume():
        return volume(_that.volume);
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
    TResult? Function(int longueur, int largeur, int? hauteur)? $default, {
    TResult? Function(int longueur, int largeur, int? hauteur)? initialize,
    TResult? Function(int surface)? surface,
    TResult? Function(int perimetre)? perimetre,
    TResult? Function(int volume)? volume,
  }) {
    final _that = this;
    switch (_that) {
      case _SuperficieEntityInitialize() when initialize != null:
        return initialize(_that.longueur, _that.largeur, _that.hauteur);
      case _SuperficieEntityData() when $default != null:
        return $default(_that.longueur, _that.largeur, _that.hauteur);
      case _SuperficieEntityAir() when surface != null:
        return surface(_that.surface);
      case _SuperficieEntityPerimetre() when perimetre != null:
        return perimetre(_that.perimetre);
      case _SuperficieEntityVolume() when volume != null:
        return volume(_that.volume);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SuperficieEntityInitialize extends SuperficieEntity {
  const _SuperficieEntityInitialize(
      {required this.longueur,
      required this.largeur,
      this.hauteur,
      final String? $type})
      : $type = $type ?? 'initialize',
        super._();
  factory _SuperficieEntityInitialize.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityInitializeFromJson(json);

  final int longueur;
  final int largeur;
  final int? hauteur;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperficieEntityInitializeCopyWith<_SuperficieEntityInitialize>
      get copyWith => __$SuperficieEntityInitializeCopyWithImpl<
          _SuperficieEntityInitialize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuperficieEntityInitializeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperficieEntityInitialize &&
            (identical(other.longueur, longueur) ||
                other.longueur == longueur) &&
            (identical(other.largeur, largeur) || other.largeur == largeur) &&
            (identical(other.hauteur, hauteur) || other.hauteur == hauteur));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longueur, largeur, hauteur);

  @override
  String toString() {
    return 'SuperficieEntity.initialize(longueur: $longueur, largeur: $largeur, hauteur: $hauteur)';
  }
}

/// @nodoc
abstract mixin class _$SuperficieEntityInitializeCopyWith<$Res>
    implements $SuperficieEntityCopyWith<$Res> {
  factory _$SuperficieEntityInitializeCopyWith(
          _SuperficieEntityInitialize value,
          $Res Function(_SuperficieEntityInitialize) _then) =
      __$SuperficieEntityInitializeCopyWithImpl;
  @useResult
  $Res call({int longueur, int largeur, int? hauteur});
}

/// @nodoc
class __$SuperficieEntityInitializeCopyWithImpl<$Res>
    implements _$SuperficieEntityInitializeCopyWith<$Res> {
  __$SuperficieEntityInitializeCopyWithImpl(this._self, this._then);

  final _SuperficieEntityInitialize _self;
  final $Res Function(_SuperficieEntityInitialize) _then;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? longueur = null,
    Object? largeur = null,
    Object? hauteur = freezed,
  }) {
    return _then(_SuperficieEntityInitialize(
      longueur: null == longueur
          ? _self.longueur
          : longueur // ignore: cast_nullable_to_non_nullable
              as int,
      largeur: null == largeur
          ? _self.largeur
          : largeur // ignore: cast_nullable_to_non_nullable
              as int,
      hauteur: freezed == hauteur
          ? _self.hauteur
          : hauteur // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuperficieEntityData extends SuperficieEntity {
  const _SuperficieEntityData(
      {required this.longueur,
      required this.largeur,
      this.hauteur,
      final String? $type})
      : $type = $type ?? 'default',
        super._();
  factory _SuperficieEntityData.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityDataFromJson(json);

  final int longueur;
  final int largeur;
  final int? hauteur;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperficieEntityDataCopyWith<_SuperficieEntityData> get copyWith =>
      __$SuperficieEntityDataCopyWithImpl<_SuperficieEntityData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuperficieEntityDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperficieEntityData &&
            (identical(other.longueur, longueur) ||
                other.longueur == longueur) &&
            (identical(other.largeur, largeur) || other.largeur == largeur) &&
            (identical(other.hauteur, hauteur) || other.hauteur == hauteur));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longueur, largeur, hauteur);

  @override
  String toString() {
    return 'SuperficieEntity(longueur: $longueur, largeur: $largeur, hauteur: $hauteur)';
  }
}

/// @nodoc
abstract mixin class _$SuperficieEntityDataCopyWith<$Res>
    implements $SuperficieEntityCopyWith<$Res> {
  factory _$SuperficieEntityDataCopyWith(_SuperficieEntityData value,
          $Res Function(_SuperficieEntityData) _then) =
      __$SuperficieEntityDataCopyWithImpl;
  @useResult
  $Res call({int longueur, int largeur, int? hauteur});
}

/// @nodoc
class __$SuperficieEntityDataCopyWithImpl<$Res>
    implements _$SuperficieEntityDataCopyWith<$Res> {
  __$SuperficieEntityDataCopyWithImpl(this._self, this._then);

  final _SuperficieEntityData _self;
  final $Res Function(_SuperficieEntityData) _then;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? longueur = null,
    Object? largeur = null,
    Object? hauteur = freezed,
  }) {
    return _then(_SuperficieEntityData(
      longueur: null == longueur
          ? _self.longueur
          : longueur // ignore: cast_nullable_to_non_nullable
              as int,
      largeur: null == largeur
          ? _self.largeur
          : largeur // ignore: cast_nullable_to_non_nullable
              as int,
      hauteur: freezed == hauteur
          ? _self.hauteur
          : hauteur // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuperficieEntityAir extends SuperficieEntity {
  const _SuperficieEntityAir({required this.surface, final String? $type})
      : $type = $type ?? 'surface',
        super._();
  factory _SuperficieEntityAir.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityAirFromJson(json);

  final int surface;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperficieEntityAirCopyWith<_SuperficieEntityAir> get copyWith =>
      __$SuperficieEntityAirCopyWithImpl<_SuperficieEntityAir>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuperficieEntityAirToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperficieEntityAir &&
            (identical(other.surface, surface) || other.surface == surface));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, surface);

  @override
  String toString() {
    return 'SuperficieEntity.surface(surface: $surface)';
  }
}

/// @nodoc
abstract mixin class _$SuperficieEntityAirCopyWith<$Res>
    implements $SuperficieEntityCopyWith<$Res> {
  factory _$SuperficieEntityAirCopyWith(_SuperficieEntityAir value,
          $Res Function(_SuperficieEntityAir) _then) =
      __$SuperficieEntityAirCopyWithImpl;
  @useResult
  $Res call({int surface});
}

/// @nodoc
class __$SuperficieEntityAirCopyWithImpl<$Res>
    implements _$SuperficieEntityAirCopyWith<$Res> {
  __$SuperficieEntityAirCopyWithImpl(this._self, this._then);

  final _SuperficieEntityAir _self;
  final $Res Function(_SuperficieEntityAir) _then;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? surface = null,
  }) {
    return _then(_SuperficieEntityAir(
      surface: null == surface
          ? _self.surface
          : surface // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuperficieEntityPerimetre extends SuperficieEntity {
  const _SuperficieEntityPerimetre(
      {required this.perimetre, final String? $type})
      : $type = $type ?? 'perimetre',
        super._();
  factory _SuperficieEntityPerimetre.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityPerimetreFromJson(json);

  final int perimetre;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperficieEntityPerimetreCopyWith<_SuperficieEntityPerimetre>
      get copyWith =>
          __$SuperficieEntityPerimetreCopyWithImpl<_SuperficieEntityPerimetre>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuperficieEntityPerimetreToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperficieEntityPerimetre &&
            (identical(other.perimetre, perimetre) ||
                other.perimetre == perimetre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, perimetre);

  @override
  String toString() {
    return 'SuperficieEntity.perimetre(perimetre: $perimetre)';
  }
}

/// @nodoc
abstract mixin class _$SuperficieEntityPerimetreCopyWith<$Res>
    implements $SuperficieEntityCopyWith<$Res> {
  factory _$SuperficieEntityPerimetreCopyWith(_SuperficieEntityPerimetre value,
          $Res Function(_SuperficieEntityPerimetre) _then) =
      __$SuperficieEntityPerimetreCopyWithImpl;
  @useResult
  $Res call({int perimetre});
}

/// @nodoc
class __$SuperficieEntityPerimetreCopyWithImpl<$Res>
    implements _$SuperficieEntityPerimetreCopyWith<$Res> {
  __$SuperficieEntityPerimetreCopyWithImpl(this._self, this._then);

  final _SuperficieEntityPerimetre _self;
  final $Res Function(_SuperficieEntityPerimetre) _then;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? perimetre = null,
  }) {
    return _then(_SuperficieEntityPerimetre(
      perimetre: null == perimetre
          ? _self.perimetre
          : perimetre // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SuperficieEntityVolume extends SuperficieEntity {
  const _SuperficieEntityVolume({required this.volume, final String? $type})
      : $type = $type ?? 'volume',
        super._();
  factory _SuperficieEntityVolume.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityVolumeFromJson(json);

  final int volume;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuperficieEntityVolumeCopyWith<_SuperficieEntityVolume> get copyWith =>
      __$SuperficieEntityVolumeCopyWithImpl<_SuperficieEntityVolume>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SuperficieEntityVolumeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuperficieEntityVolume &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, volume);

  @override
  String toString() {
    return 'SuperficieEntity.volume(volume: $volume)';
  }
}

/// @nodoc
abstract mixin class _$SuperficieEntityVolumeCopyWith<$Res>
    implements $SuperficieEntityCopyWith<$Res> {
  factory _$SuperficieEntityVolumeCopyWith(_SuperficieEntityVolume value,
          $Res Function(_SuperficieEntityVolume) _then) =
      __$SuperficieEntityVolumeCopyWithImpl;
  @useResult
  $Res call({int volume});
}

/// @nodoc
class __$SuperficieEntityVolumeCopyWithImpl<$Res>
    implements _$SuperficieEntityVolumeCopyWith<$Res> {
  __$SuperficieEntityVolumeCopyWithImpl(this._self, this._then);

  final _SuperficieEntityVolume _self;
  final $Res Function(_SuperficieEntityVolume) _then;

  /// Create a copy of SuperficieEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? volume = null,
  }) {
    return _then(_SuperficieEntityVolume(
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
