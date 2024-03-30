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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$ElementsEntityModelImplCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$ElementsEntityModelImplCopyWith(_$ElementsEntityModelImpl value,
          $Res Function(_$ElementsEntityModelImpl) then) =
      __$$ElementsEntityModelImplCopyWithImpl<$Res>;
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
class __$$ElementsEntityModelImplCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res, _$ElementsEntityModelImpl>
    implements _$$ElementsEntityModelImplCopyWith<$Res> {
  __$$ElementsEntityModelImplCopyWithImpl(_$ElementsEntityModelImpl _value,
      $Res Function(_$ElementsEntityModelImpl) _then)
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
    return _then(_$ElementsEntityModelImpl(
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
class _$ElementsEntityModelImpl implements _ElementsEntityModel {
  const _$ElementsEntityModelImpl(
      {required this.id,
      required this.name,
      this.figures,
      this.polygones,
      this.volumes,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$ElementsEntityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElementsEntityModelImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementsEntityModelImpl &&
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
  _$$ElementsEntityModelImplCopyWith<_$ElementsEntityModelImpl> get copyWith =>
      __$$ElementsEntityModelImplCopyWithImpl<_$ElementsEntityModelImpl>(
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
    return _$$ElementsEntityModelImplToJson(
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
      final Volumes? volumes}) = _$ElementsEntityModelImpl;

  factory _ElementsEntityModel.fromJson(Map<String, dynamic> json) =
      _$ElementsEntityModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  Figures? get figures;
  Polygones? get polygones;
  Volumes? get volumes;
  @override
  @JsonKey(ignore: true)
  _$$ElementsEntityModelImplCopyWith<_$ElementsEntityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ElementsEntityModelFiguresImplCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$ElementsEntityModelFiguresImplCopyWith(
          _$ElementsEntityModelFiguresImpl value,
          $Res Function(_$ElementsEntityModelFiguresImpl) then) =
      __$$ElementsEntityModelFiguresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Figures figures});
}

/// @nodoc
class __$$ElementsEntityModelFiguresImplCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res,
        _$ElementsEntityModelFiguresImpl>
    implements _$$ElementsEntityModelFiguresImplCopyWith<$Res> {
  __$$ElementsEntityModelFiguresImplCopyWithImpl(
      _$ElementsEntityModelFiguresImpl _value,
      $Res Function(_$ElementsEntityModelFiguresImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? figures = null,
  }) {
    return _then(_$ElementsEntityModelFiguresImpl(
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
class _$ElementsEntityModelFiguresImpl implements _ElementsEntityModelFigures {
  const _$ElementsEntityModelFiguresImpl(
      {required this.id,
      required this.name,
      this.figures = Figures.cercle,
      final String? $type})
      : $type = $type ?? 'figures';

  factory _$ElementsEntityModelFiguresImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ElementsEntityModelFiguresImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementsEntityModelFiguresImpl &&
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
  _$$ElementsEntityModelFiguresImplCopyWith<_$ElementsEntityModelFiguresImpl>
      get copyWith => __$$ElementsEntityModelFiguresImplCopyWithImpl<
          _$ElementsEntityModelFiguresImpl>(this, _$identity);

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
    return _$$ElementsEntityModelFiguresImplToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModelFigures implements ElementsEntityModel {
  const factory _ElementsEntityModelFigures(
      {required final int id,
      required final String name,
      final Figures figures}) = _$ElementsEntityModelFiguresImpl;

  factory _ElementsEntityModelFigures.fromJson(Map<String, dynamic> json) =
      _$ElementsEntityModelFiguresImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  Figures get figures;
  @override
  @JsonKey(ignore: true)
  _$$ElementsEntityModelFiguresImplCopyWith<_$ElementsEntityModelFiguresImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ElementsEntityModelPolygonesImplCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$ElementsEntityModelPolygonesImplCopyWith(
          _$ElementsEntityModelPolygonesImpl value,
          $Res Function(_$ElementsEntityModelPolygonesImpl) then) =
      __$$ElementsEntityModelPolygonesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Polygones polygones});
}

/// @nodoc
class __$$ElementsEntityModelPolygonesImplCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res,
        _$ElementsEntityModelPolygonesImpl>
    implements _$$ElementsEntityModelPolygonesImplCopyWith<$Res> {
  __$$ElementsEntityModelPolygonesImplCopyWithImpl(
      _$ElementsEntityModelPolygonesImpl _value,
      $Res Function(_$ElementsEntityModelPolygonesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? polygones = null,
  }) {
    return _then(_$ElementsEntityModelPolygonesImpl(
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
class _$ElementsEntityModelPolygonesImpl
    implements _ElementsEntityModelPolygones {
  const _$ElementsEntityModelPolygonesImpl(
      {required this.id,
      required this.name,
      this.polygones = Polygones.quadrilatere,
      final String? $type})
      : $type = $type ?? 'polygones';

  factory _$ElementsEntityModelPolygonesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ElementsEntityModelPolygonesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementsEntityModelPolygonesImpl &&
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
  _$$ElementsEntityModelPolygonesImplCopyWith<
          _$ElementsEntityModelPolygonesImpl>
      get copyWith => __$$ElementsEntityModelPolygonesImplCopyWithImpl<
          _$ElementsEntityModelPolygonesImpl>(this, _$identity);

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
    return _$$ElementsEntityModelPolygonesImplToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModelPolygones implements ElementsEntityModel {
  const factory _ElementsEntityModelPolygones(
      {required final int id,
      required final String name,
      final Polygones polygones}) = _$ElementsEntityModelPolygonesImpl;

  factory _ElementsEntityModelPolygones.fromJson(Map<String, dynamic> json) =
      _$ElementsEntityModelPolygonesImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  Polygones get polygones;
  @override
  @JsonKey(ignore: true)
  _$$ElementsEntityModelPolygonesImplCopyWith<
          _$ElementsEntityModelPolygonesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ElementsEntityModelVolumesImplCopyWith<$Res>
    implements $ElementsEntityModelCopyWith<$Res> {
  factory _$$ElementsEntityModelVolumesImplCopyWith(
          _$ElementsEntityModelVolumesImpl value,
          $Res Function(_$ElementsEntityModelVolumesImpl) then) =
      __$$ElementsEntityModelVolumesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, Volumes volumes});
}

/// @nodoc
class __$$ElementsEntityModelVolumesImplCopyWithImpl<$Res>
    extends _$ElementsEntityModelCopyWithImpl<$Res,
        _$ElementsEntityModelVolumesImpl>
    implements _$$ElementsEntityModelVolumesImplCopyWith<$Res> {
  __$$ElementsEntityModelVolumesImplCopyWithImpl(
      _$ElementsEntityModelVolumesImpl _value,
      $Res Function(_$ElementsEntityModelVolumesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? volumes = null,
  }) {
    return _then(_$ElementsEntityModelVolumesImpl(
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
class _$ElementsEntityModelVolumesImpl implements _ElementsEntityModelVolumes {
  const _$ElementsEntityModelVolumesImpl(
      {required this.id,
      required this.name,
      this.volumes = Volumes.cube,
      final String? $type})
      : $type = $type ?? 'volumes';

  factory _$ElementsEntityModelVolumesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ElementsEntityModelVolumesImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElementsEntityModelVolumesImpl &&
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
  _$$ElementsEntityModelVolumesImplCopyWith<_$ElementsEntityModelVolumesImpl>
      get copyWith => __$$ElementsEntityModelVolumesImplCopyWithImpl<
          _$ElementsEntityModelVolumesImpl>(this, _$identity);

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
    return _$$ElementsEntityModelVolumesImplToJson(
      this,
    );
  }
}

abstract class _ElementsEntityModelVolumes implements ElementsEntityModel {
  const factory _ElementsEntityModelVolumes(
      {required final int id,
      required final String name,
      final Volumes volumes}) = _$ElementsEntityModelVolumesImpl;

  factory _ElementsEntityModelVolumes.fromJson(Map<String, dynamic> json) =
      _$ElementsEntityModelVolumesImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  Volumes get volumes;
  @override
  @JsonKey(ignore: true)
  _$$ElementsEntityModelVolumesImplCopyWith<_$ElementsEntityModelVolumesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
