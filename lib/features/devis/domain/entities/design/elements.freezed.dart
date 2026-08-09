// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ElementsEntityModel _$ElementsEntityModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _ElementsEntityModelDefault.fromJson(json);
    case 'figures':
      return _ElementsEntityModelFigures.fromJson(json);
    case 'polygones':
      return _ElementsEntityModelPolygones.fromJson(json);
    case 'volumes':
      return _ElementsEntityModelVolumes.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ElementsEntityModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ElementsEntityModel {
  int get id;
  String get name;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElementsEntityModelCopyWith<ElementsEntityModel> get copyWith =>
      _$ElementsEntityModelCopyWithImpl<ElementsEntityModel>(
          this as ElementsEntityModel, _$identity);

  /// Serializes this ElementsEntityModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElementsEntityModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'ElementsEntityModel(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ElementsEntityModelCopyWith<$Res> {
  factory $ElementsEntityModelCopyWith(
          ElementsEntityModel value, $Res Function(ElementsEntityModel) _then) =
      _$ElementsEntityModelCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ElementsEntityModelCopyWithImpl<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  _$ElementsEntityModelCopyWithImpl(this._self, this._then);

  final ElementsEntityModel _self;
  final $Res Function(ElementsEntityModel) _then;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ElementsEntityModel].
extension ElementsEntityModelPatterns on ElementsEntityModel {
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
    TResult Function(_ElementsEntityModelDefault value)? $default, {
    TResult Function(_ElementsEntityModelFigures value)? figures,
    TResult Function(_ElementsEntityModelPolygones value)? polygones,
    TResult Function(_ElementsEntityModelVolumes value)? volumes,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ElementsEntityModelDefault() when $default != null:
        return $default(_that);
      case _ElementsEntityModelFigures() when figures != null:
        return figures(_that);
      case _ElementsEntityModelPolygones() when polygones != null:
        return polygones(_that);
      case _ElementsEntityModelVolumes() when volumes != null:
        return volumes(_that);
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
    TResult Function(_ElementsEntityModelDefault value) $default, {
    required TResult Function(_ElementsEntityModelFigures value) figures,
    required TResult Function(_ElementsEntityModelPolygones value) polygones,
    required TResult Function(_ElementsEntityModelVolumes value) volumes,
  }) {
    final _that = this;
    switch (_that) {
      case _ElementsEntityModelDefault():
        return $default(_that);
      case _ElementsEntityModelFigures():
        return figures(_that);
      case _ElementsEntityModelPolygones():
        return polygones(_that);
      case _ElementsEntityModelVolumes():
        return volumes(_that);
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
    TResult? Function(_ElementsEntityModelDefault value)? $default, {
    TResult? Function(_ElementsEntityModelFigures value)? figures,
    TResult? Function(_ElementsEntityModelPolygones value)? polygones,
    TResult? Function(_ElementsEntityModelVolumes value)? volumes,
  }) {
    final _that = this;
    switch (_that) {
      case _ElementsEntityModelDefault() when $default != null:
        return $default(_that);
      case _ElementsEntityModelFigures() when figures != null:
        return figures(_that);
      case _ElementsEntityModelPolygones() when polygones != null:
        return polygones(_that);
      case _ElementsEntityModelVolumes() when volumes != null:
        return volumes(_that);
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
    TResult Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult Function(int id, String name, Figures figures)? figures,
    TResult Function(int id, String name, Polygones polygones)? polygones,
    TResult Function(int id, String name, Volumes volumes)? volumes,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ElementsEntityModelDefault() when $default != null:
        return $default(_that.id, _that.name, _that.figures, _that.polygones,
            _that.volumes);
      case _ElementsEntityModelFigures() when figures != null:
        return figures(_that.id, _that.name, _that.figures);
      case _ElementsEntityModelPolygones() when polygones != null:
        return polygones(_that.id, _that.name, _that.polygones);
      case _ElementsEntityModelVolumes() when volumes != null:
        return volumes(_that.id, _that.name, _that.volumes);
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
    TResult Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)
        $default, {
    required TResult Function(int id, String name, Figures figures) figures,
    required TResult Function(int id, String name, Polygones polygones)
        polygones,
    required TResult Function(int id, String name, Volumes volumes) volumes,
  }) {
    final _that = this;
    switch (_that) {
      case _ElementsEntityModelDefault():
        return $default(_that.id, _that.name, _that.figures, _that.polygones,
            _that.volumes);
      case _ElementsEntityModelFigures():
        return figures(_that.id, _that.name, _that.figures);
      case _ElementsEntityModelPolygones():
        return polygones(_that.id, _that.name, _that.polygones);
      case _ElementsEntityModelVolumes():
        return volumes(_that.id, _that.name, _that.volumes);
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
    TResult? Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult? Function(int id, String name, Figures figures)? figures,
    TResult? Function(int id, String name, Polygones polygones)? polygones,
    TResult? Function(int id, String name, Volumes volumes)? volumes,
  }) {
    final _that = this;
    switch (_that) {
      case _ElementsEntityModelDefault() when $default != null:
        return $default(_that.id, _that.name, _that.figures, _that.polygones,
            _that.volumes);
      case _ElementsEntityModelFigures() when figures != null:
        return figures(_that.id, _that.name, _that.figures);
      case _ElementsEntityModelPolygones() when polygones != null:
        return polygones(_that.id, _that.name, _that.polygones);
      case _ElementsEntityModelVolumes() when volumes != null:
        return volumes(_that.id, _that.name, _that.volumes);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ElementsEntityModelDefault implements ElementsEntityModel {
  const _ElementsEntityModelDefault(
      {required this.id,
      required this.name,
      this.figures,
      this.polygones,
      this.volumes,
      final String? $type})
      : $type = $type ?? 'default';
  factory _ElementsEntityModelDefault.fromJson(Map<String, dynamic> json) =>
      _$ElementsEntityModelDefaultFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final Figures? figures;
  final Polygones? polygones;
  final Volumes? volumes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElementsEntityModelDefaultCopyWith<_ElementsEntityModelDefault>
      get copyWith => __$ElementsEntityModelDefaultCopyWithImpl<
          _ElementsEntityModelDefault>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElementsEntityModelDefaultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElementsEntityModelDefault &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.figures, figures) || other.figures == figures) &&
            (identical(other.polygones, polygones) ||
                other.polygones == polygones) &&
            (identical(other.volumes, volumes) || other.volumes == volumes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, figures, polygones, volumes);

  @override
  String toString() {
    return 'ElementsEntityModel(id: $id, name: $name, figures: $figures, polygones: $polygones, volumes: $volumes)';
  }
}

/// @nodoc
abstract mixin class _$ElementsEntityModelDefaultCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$ElementsEntityModelDefaultCopyWith(
          _ElementsEntityModelDefault value,
          $Res Function(_ElementsEntityModelDefault) _then) =
      __$ElementsEntityModelDefaultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      Figures? figures,
      Polygones? polygones,
      Volumes? volumes});
}

/// @nodoc
class __$ElementsEntityModelDefaultCopyWithImpl<$Res>
    implements _$ElementsEntityModelDefaultCopyWith<$Res> {
  __$ElementsEntityModelDefaultCopyWithImpl(this._self, this._then);

  final _ElementsEntityModelDefault _self;
  final $Res Function(_ElementsEntityModelDefault) _then;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? figures = freezed,
    Object? polygones = freezed,
    Object? volumes = freezed,
  }) {
    return _then(_ElementsEntityModelDefault(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      figures: freezed == figures
          ? _self.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as Figures?,
      polygones: freezed == polygones
          ? _self.polygones
          : polygones // ignore: cast_nullable_to_non_nullable
              as Polygones?,
      volumes: freezed == volumes
          ? _self.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as Volumes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElementsEntityModelFigures implements ElementsEntityModel {
  const _ElementsEntityModelFigures(
      {required this.id,
      required this.name,
      this.figures = Figures.cercle,
      final String? $type})
      : $type = $type ?? 'figures';
  factory _ElementsEntityModelFigures.fromJson(Map<String, dynamic> json) =>
      _$ElementsEntityModelFiguresFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @JsonKey()
  final Figures figures;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElementsEntityModelFiguresCopyWith<_ElementsEntityModelFigures>
      get copyWith => __$ElementsEntityModelFiguresCopyWithImpl<
          _ElementsEntityModelFigures>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElementsEntityModelFiguresToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElementsEntityModelFigures &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.figures, figures) || other.figures == figures));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, figures);

  @override
  String toString() {
    return 'ElementsEntityModel.figures(id: $id, name: $name, figures: $figures)';
  }
}

/// @nodoc
abstract mixin class _$ElementsEntityModelFiguresCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$ElementsEntityModelFiguresCopyWith(
          _ElementsEntityModelFigures value,
          $Res Function(_ElementsEntityModelFigures) _then) =
      __$ElementsEntityModelFiguresCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, Figures figures});
}

/// @nodoc
class __$ElementsEntityModelFiguresCopyWithImpl<$Res>
    implements _$ElementsEntityModelFiguresCopyWith<$Res> {
  __$ElementsEntityModelFiguresCopyWithImpl(this._self, this._then);

  final _ElementsEntityModelFigures _self;
  final $Res Function(_ElementsEntityModelFigures) _then;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? figures = null,
  }) {
    return _then(_ElementsEntityModelFigures(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      figures: null == figures
          ? _self.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as Figures,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElementsEntityModelPolygones implements ElementsEntityModel {
  const _ElementsEntityModelPolygones(
      {required this.id,
      required this.name,
      this.polygones = Polygones.quadrilatere,
      final String? $type})
      : $type = $type ?? 'polygones';
  factory _ElementsEntityModelPolygones.fromJson(Map<String, dynamic> json) =>
      _$ElementsEntityModelPolygonesFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @JsonKey()
  final Polygones polygones;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElementsEntityModelPolygonesCopyWith<_ElementsEntityModelPolygones>
      get copyWith => __$ElementsEntityModelPolygonesCopyWithImpl<
          _ElementsEntityModelPolygones>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElementsEntityModelPolygonesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElementsEntityModelPolygones &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.polygones, polygones) ||
                other.polygones == polygones));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, polygones);

  @override
  String toString() {
    return 'ElementsEntityModel.polygones(id: $id, name: $name, polygones: $polygones)';
  }
}

/// @nodoc
abstract mixin class _$ElementsEntityModelPolygonesCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$ElementsEntityModelPolygonesCopyWith(
          _ElementsEntityModelPolygones value,
          $Res Function(_ElementsEntityModelPolygones) _then) =
      __$ElementsEntityModelPolygonesCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, Polygones polygones});
}

/// @nodoc
class __$ElementsEntityModelPolygonesCopyWithImpl<$Res>
    implements _$ElementsEntityModelPolygonesCopyWith<$Res> {
  __$ElementsEntityModelPolygonesCopyWithImpl(this._self, this._then);

  final _ElementsEntityModelPolygones _self;
  final $Res Function(_ElementsEntityModelPolygones) _then;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? polygones = null,
  }) {
    return _then(_ElementsEntityModelPolygones(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      polygones: null == polygones
          ? _self.polygones
          : polygones // ignore: cast_nullable_to_non_nullable
              as Polygones,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElementsEntityModelVolumes implements ElementsEntityModel {
  const _ElementsEntityModelVolumes(
      {required this.id,
      required this.name,
      this.volumes = Volumes.cube,
      final String? $type})
      : $type = $type ?? 'volumes';
  factory _ElementsEntityModelVolumes.fromJson(Map<String, dynamic> json) =>
      _$ElementsEntityModelVolumesFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @JsonKey()
  final Volumes volumes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElementsEntityModelVolumesCopyWith<_ElementsEntityModelVolumes>
      get copyWith => __$ElementsEntityModelVolumesCopyWithImpl<
          _ElementsEntityModelVolumes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElementsEntityModelVolumesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElementsEntityModelVolumes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.volumes, volumes) || other.volumes == volumes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, volumes);

  @override
  String toString() {
    return 'ElementsEntityModel.volumes(id: $id, name: $name, volumes: $volumes)';
  }
}

/// @nodoc
abstract mixin class _$ElementsEntityModelVolumesCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$ElementsEntityModelVolumesCopyWith(
          _ElementsEntityModelVolumes value,
          $Res Function(_ElementsEntityModelVolumes) _then) =
      __$ElementsEntityModelVolumesCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, Volumes volumes});
}

/// @nodoc
class __$ElementsEntityModelVolumesCopyWithImpl<$Res>
    implements _$ElementsEntityModelVolumesCopyWith<$Res> {
  __$ElementsEntityModelVolumesCopyWithImpl(this._self, this._then);

  final _ElementsEntityModelVolumes _self;
  final $Res Function(_ElementsEntityModelVolumes) _then;

  /// Create a copy of ElementsEntityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? volumes = null,
  }) {
    return _then(_ElementsEntityModelVolumes(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      volumes: null == volumes
          ? _self.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as Volumes,
    ));
  }
}

// dart format on
