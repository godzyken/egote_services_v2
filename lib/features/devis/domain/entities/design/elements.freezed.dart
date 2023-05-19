// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElementsEntityModel _$ElementsEntityModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _ElementsEntityModel.fromJson(json);
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
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)
        $default, {
    required TResult Function(int id, String name, Figures figures) figures,
    required TResult Function(int id, String name, Polygones polygones)
        polygones,
    required TResult Function(int id, String name, Volumes volumes) volumes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult? Function(int id, String name, Figures figures)? figures,
    TResult? Function(int id, String name, Polygones polygones)? polygones,
    TResult? Function(int id, String name, Volumes volumes)? volumes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult Function(int id, String name, Figures figures)? figures,
    TResult Function(int id, String name, Polygones polygones)? polygones,
    TResult Function(int id, String name, Volumes volumes)? volumes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value) $default, {
    required TResult Function(_ElementsEntityModelFigures value) figures,
    required TResult Function(_ElementsEntityModelPolygones value) polygones,
    required TResult Function(_ElementsEntityModelVolumes value) volumes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ElementsEntityModel value)? $default, {
    TResult? Function(_ElementsEntityModelFigures value)? figures,
    TResult? Function(_ElementsEntityModelPolygones value)? polygones,
    TResult? Function(_ElementsEntityModelVolumes value)? volumes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value)? $default, {
    TResult Function(_ElementsEntityModelFigures value)? figures,
    TResult Function(_ElementsEntityModelPolygones value)? polygones,
    TResult Function(_ElementsEntityModelVolumes value)? volumes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementsEntityModelCopyWith<ElementsEntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementsEntityModelCopyWith<$Res> {
  factory $ElementsEntityModelCopyWith(
          ElementsEntityModel value, $Res Function(ElementsEntityModel) then) =
      _$ElementsEntityModelCopyWithImpl<$Res, ElementsEntityModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ElementsEntityModelCopyWithImpl<$Res, $Val extends ElementsEntityModel>
    implements $ElementsEntityModelCopyWith<$Res> {
  _$ElementsEntityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElementsEntityModelCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$_ElementsEntityModelCopyWith(_$_ElementsEntityModel value,
          $Res Function(_$_ElementsEntityModel) then) =
      __$$_ElementsEntityModelCopyWithImpl<$Res>;
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
class __$$_ElementsEntityModelCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res, _$_ElementsEntityModel>
    implements _$$_ElementsEntityModelCopyWith<$Res> {
  __$$_ElementsEntityModelCopyWithImpl(_$_ElementsEntityModel _value,
      $Res Function(_$_ElementsEntityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? figures = freezed,
    Object? polygones = freezed,
    Object? volumes = freezed,
  }) {
    return _then(_$_ElementsEntityModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      figures: freezed == figures
          ? _value.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as Figures?,
      polygones: freezed == polygones
          ? _value.polygones
          : polygones // ignore: cast_nullable_to_non_nullable
              as Polygones?,
      volumes: freezed == volumes
          ? _value.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as Volumes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementsEntityModel implements _ElementsEntityModel {
  const _$_ElementsEntityModel(
      {required this.id,
      required this.name,
      this.figures,
      this.polygones,
      this.volumes,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$_ElementsEntityModel.fromJson(Map<String, dynamic> json) =>
      _$$_ElementsEntityModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final Figures? figures;
  @override
  final Polygones? polygones;
  @override
  final Volumes? volumes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ElementsEntityModel(id: $id, name: $name, figures: $figures, polygones: $polygones, volumes: $volumes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementsEntityModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.figures, figures) || other.figures == figures) &&
            (identical(other.polygones, polygones) ||
                other.polygones == polygones) &&
            (identical(other.volumes, volumes) || other.volumes == volumes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, figures, polygones, volumes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementsEntityModelCopyWith<_$_ElementsEntityModel> get copyWith =>
      __$$_ElementsEntityModelCopyWithImpl<_$_ElementsEntityModel>(
          this, _$identity);

  @override
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
    return $default(id, name, this.figures, this.polygones, this.volumes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult? Function(int id, String name, Figures figures)? figures,
    TResult? Function(int id, String name, Polygones polygones)? polygones,
    TResult? Function(int id, String name, Volumes volumes)? volumes,
  }) {
    return $default?.call(id, name, this.figures, this.polygones, this.volumes);
  }

  @override
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
    if ($default != null) {
      return $default(id, name, this.figures, this.polygones, this.volumes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value) $default, {
    required TResult Function(_ElementsEntityModelFigures value) figures,
    required TResult Function(_ElementsEntityModelPolygones value) polygones,
    required TResult Function(_ElementsEntityModelVolumes value) volumes,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ElementsEntityModel value)? $default, {
    TResult? Function(_ElementsEntityModelFigures value)? figures,
    TResult? Function(_ElementsEntityModelPolygones value)? polygones,
    TResult? Function(_ElementsEntityModelVolumes value)? volumes,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value)? $default, {
    TResult Function(_ElementsEntityModelFigures value)? figures,
    TResult Function(_ElementsEntityModelPolygones value)? polygones,
    TResult Function(_ElementsEntityModelVolumes value)? volumes,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementsEntityModelToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModel implements ElementsEntityModel {
  const factory _ElementsEntityModel(
      {required final int id,
      required final String name,
      final Figures? figures,
      final Polygones? polygones,
      final Volumes? volumes}) = _$_ElementsEntityModel;

  factory _ElementsEntityModel.fromJson(Map<String, dynamic> json) =
      _$_ElementsEntityModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  Figures? get figures;
  Polygones? get polygones;
  Volumes? get volumes;
  @override
  @JsonKey(ignore: true)
  _$$_ElementsEntityModelCopyWith<_$_ElementsEntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ElementsEntityModelFiguresCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$_ElementsEntityModelFiguresCopyWith(
          _$_ElementsEntityModelFigures value,
          $Res Function(_$_ElementsEntityModelFigures) then) =
      __$$_ElementsEntityModelFiguresCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Figures figures});
}

/// @nodoc
class __$$_ElementsEntityModelFiguresCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res,
        _$_ElementsEntityModelFigures>
    implements _$$_ElementsEntityModelFiguresCopyWith<$Res> {
  __$$_ElementsEntityModelFiguresCopyWithImpl(
      _$_ElementsEntityModelFigures _value,
      $Res Function(_$_ElementsEntityModelFigures) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? figures = null,
  }) {
    return _then(_$_ElementsEntityModelFigures(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      figures: null == figures
          ? _value.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as Figures,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementsEntityModelFigures implements _ElementsEntityModelFigures {
  const _$_ElementsEntityModelFigures(
      {required this.id,
      required this.name,
      this.figures = Figures.cercle,
      final String? $type})
      : $type = $type ?? 'figures';

  factory _$_ElementsEntityModelFigures.fromJson(Map<String, dynamic> json) =>
      _$$_ElementsEntityModelFiguresFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final Figures figures;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ElementsEntityModel.figures(id: $id, name: $name, figures: $figures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementsEntityModelFigures &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.figures, figures) || other.figures == figures));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, figures);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementsEntityModelFiguresCopyWith<_$_ElementsEntityModelFigures>
      get copyWith => __$$_ElementsEntityModelFiguresCopyWithImpl<
          _$_ElementsEntityModelFigures>(this, _$identity);

  @override
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
    return figures(id, name, this.figures);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult? Function(int id, String name, Figures figures)? figures,
    TResult? Function(int id, String name, Polygones polygones)? polygones,
    TResult? Function(int id, String name, Volumes volumes)? volumes,
  }) {
    return figures?.call(id, name, this.figures);
  }

  @override
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
    if (figures != null) {
      return figures(id, name, this.figures);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value) $default, {
    required TResult Function(_ElementsEntityModelFigures value) figures,
    required TResult Function(_ElementsEntityModelPolygones value) polygones,
    required TResult Function(_ElementsEntityModelVolumes value) volumes,
  }) {
    return figures(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ElementsEntityModel value)? $default, {
    TResult? Function(_ElementsEntityModelFigures value)? figures,
    TResult? Function(_ElementsEntityModelPolygones value)? polygones,
    TResult? Function(_ElementsEntityModelVolumes value)? volumes,
  }) {
    return figures?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value)? $default, {
    TResult Function(_ElementsEntityModelFigures value)? figures,
    TResult Function(_ElementsEntityModelPolygones value)? polygones,
    TResult Function(_ElementsEntityModelVolumes value)? volumes,
    required TResult orElse(),
  }) {
    if (figures != null) {
      return figures(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementsEntityModelFiguresToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModelFigures implements ElementsEntityModel {
  const factory _ElementsEntityModelFigures(
      {required final int id,
      required final String name,
      final Figures figures}) = _$_ElementsEntityModelFigures;

  factory _ElementsEntityModelFigures.fromJson(Map<String, dynamic> json) =
      _$_ElementsEntityModelFigures.fromJson;

  @override
  int get id;
  @override
  String get name;
  Figures get figures;
  @override
  @JsonKey(ignore: true)
  _$$_ElementsEntityModelFiguresCopyWith<_$_ElementsEntityModelFigures>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ElementsEntityModelPolygonesCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$_ElementsEntityModelPolygonesCopyWith(
          _$_ElementsEntityModelPolygones value,
          $Res Function(_$_ElementsEntityModelPolygones) then) =
      __$$_ElementsEntityModelPolygonesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Polygones polygones});
}

/// @nodoc
class __$$_ElementsEntityModelPolygonesCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res,
        _$_ElementsEntityModelPolygones>
    implements _$$_ElementsEntityModelPolygonesCopyWith<$Res> {
  __$$_ElementsEntityModelPolygonesCopyWithImpl(
      _$_ElementsEntityModelPolygones _value,
      $Res Function(_$_ElementsEntityModelPolygones) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? polygones = null,
  }) {
    return _then(_$_ElementsEntityModelPolygones(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      polygones: null == polygones
          ? _value.polygones
          : polygones // ignore: cast_nullable_to_non_nullable
              as Polygones,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementsEntityModelPolygones implements _ElementsEntityModelPolygones {
  const _$_ElementsEntityModelPolygones(
      {required this.id,
      required this.name,
      this.polygones = Polygones.quadrilatere,
      final String? $type})
      : $type = $type ?? 'polygones';

  factory _$_ElementsEntityModelPolygones.fromJson(Map<String, dynamic> json) =>
      _$$_ElementsEntityModelPolygonesFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final Polygones polygones;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ElementsEntityModel.polygones(id: $id, name: $name, polygones: $polygones)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementsEntityModelPolygones &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.polygones, polygones) ||
                other.polygones == polygones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, polygones);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementsEntityModelPolygonesCopyWith<_$_ElementsEntityModelPolygones>
      get copyWith => __$$_ElementsEntityModelPolygonesCopyWithImpl<
          _$_ElementsEntityModelPolygones>(this, _$identity);

  @override
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
    return polygones(id, name, this.polygones);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult? Function(int id, String name, Figures figures)? figures,
    TResult? Function(int id, String name, Polygones polygones)? polygones,
    TResult? Function(int id, String name, Volumes volumes)? volumes,
  }) {
    return polygones?.call(id, name, this.polygones);
  }

  @override
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
    if (polygones != null) {
      return polygones(id, name, this.polygones);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value) $default, {
    required TResult Function(_ElementsEntityModelFigures value) figures,
    required TResult Function(_ElementsEntityModelPolygones value) polygones,
    required TResult Function(_ElementsEntityModelVolumes value) volumes,
  }) {
    return polygones(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ElementsEntityModel value)? $default, {
    TResult? Function(_ElementsEntityModelFigures value)? figures,
    TResult? Function(_ElementsEntityModelPolygones value)? polygones,
    TResult? Function(_ElementsEntityModelVolumes value)? volumes,
  }) {
    return polygones?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value)? $default, {
    TResult Function(_ElementsEntityModelFigures value)? figures,
    TResult Function(_ElementsEntityModelPolygones value)? polygones,
    TResult Function(_ElementsEntityModelVolumes value)? volumes,
    required TResult orElse(),
  }) {
    if (polygones != null) {
      return polygones(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementsEntityModelPolygonesToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModelPolygones implements ElementsEntityModel {
  const factory _ElementsEntityModelPolygones(
      {required final int id,
      required final String name,
      final Polygones polygones}) = _$_ElementsEntityModelPolygones;

  factory _ElementsEntityModelPolygones.fromJson(Map<String, dynamic> json) =
      _$_ElementsEntityModelPolygones.fromJson;

  @override
  int get id;
  @override
  String get name;
  Polygones get polygones;
  @override
  @JsonKey(ignore: true)
  _$$_ElementsEntityModelPolygonesCopyWith<_$_ElementsEntityModelPolygones>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ElementsEntityModelVolumesCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$_ElementsEntityModelVolumesCopyWith(
          _$_ElementsEntityModelVolumes value,
          $Res Function(_$_ElementsEntityModelVolumes) then) =
      __$$_ElementsEntityModelVolumesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Volumes volumes});
}

/// @nodoc
class __$$_ElementsEntityModelVolumesCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res,
        _$_ElementsEntityModelVolumes>
    implements _$$_ElementsEntityModelVolumesCopyWith<$Res> {
  __$$_ElementsEntityModelVolumesCopyWithImpl(
      _$_ElementsEntityModelVolumes _value,
      $Res Function(_$_ElementsEntityModelVolumes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? volumes = null,
  }) {
    return _then(_$_ElementsEntityModelVolumes(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      volumes: null == volumes
          ? _value.volumes
          : volumes // ignore: cast_nullable_to_non_nullable
              as Volumes,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementsEntityModelVolumes implements _ElementsEntityModelVolumes {
  const _$_ElementsEntityModelVolumes(
      {required this.id,
      required this.name,
      this.volumes = Volumes.cube,
      final String? $type})
      : $type = $type ?? 'volumes';

  factory _$_ElementsEntityModelVolumes.fromJson(Map<String, dynamic> json) =>
      _$$_ElementsEntityModelVolumesFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final Volumes volumes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ElementsEntityModel.volumes(id: $id, name: $name, volumes: $volumes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementsEntityModelVolumes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.volumes, volumes) || other.volumes == volumes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, volumes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementsEntityModelVolumesCopyWith<_$_ElementsEntityModelVolumes>
      get copyWith => __$$_ElementsEntityModelVolumesCopyWithImpl<
          _$_ElementsEntityModelVolumes>(this, _$identity);

  @override
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
    return volumes(id, name, this.volumes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int id, String name, Figures? figures,
            Polygones? polygones, Volumes? volumes)?
        $default, {
    TResult? Function(int id, String name, Figures figures)? figures,
    TResult? Function(int id, String name, Polygones polygones)? polygones,
    TResult? Function(int id, String name, Volumes volumes)? volumes,
  }) {
    return volumes?.call(id, name, this.volumes);
  }

  @override
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
    if (volumes != null) {
      return volumes(id, name, this.volumes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value) $default, {
    required TResult Function(_ElementsEntityModelFigures value) figures,
    required TResult Function(_ElementsEntityModelPolygones value) polygones,
    required TResult Function(_ElementsEntityModelVolumes value) volumes,
  }) {
    return volumes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ElementsEntityModel value)? $default, {
    TResult? Function(_ElementsEntityModelFigures value)? figures,
    TResult? Function(_ElementsEntityModelPolygones value)? polygones,
    TResult? Function(_ElementsEntityModelVolumes value)? volumes,
  }) {
    return volumes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ElementsEntityModel value)? $default, {
    TResult Function(_ElementsEntityModelFigures value)? figures,
    TResult Function(_ElementsEntityModelPolygones value)? polygones,
    TResult Function(_ElementsEntityModelVolumes value)? volumes,
    required TResult orElse(),
  }) {
    if (volumes != null) {
      return volumes(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementsEntityModelVolumesToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModelVolumes implements ElementsEntityModel {
  const factory _ElementsEntityModelVolumes(
      {required final int id,
      required final String name,
      final Volumes volumes}) = _$_ElementsEntityModelVolumes;

  factory _ElementsEntityModelVolumes.fromJson(Map<String, dynamic> json) =
      _$_ElementsEntityModelVolumes.fromJson;

  @override
  int get id;
  @override
  String get name;
  Volumes get volumes;
  @override
  @JsonKey(ignore: true)
  _$$_ElementsEntityModelVolumesCopyWith<_$_ElementsEntityModelVolumes>
      get copyWith => throw _privateConstructorUsedError;
}
