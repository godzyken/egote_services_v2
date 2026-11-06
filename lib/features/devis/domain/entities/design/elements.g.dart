// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ElementsEntityModelDefault _$ElementsEntityModelDefaultFromJson(
  Map<String, dynamic> json,
) => _ElementsEntityModelDefault(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  figures: $enumDecodeNullable(_$FiguresEnumMap, json['figures']),
  polygones: $enumDecodeNullable(_$PolygonesEnumMap, json['polygones']),
  volumes: $enumDecodeNullable(_$VolumesEnumMap, json['volumes']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ElementsEntityModelDefaultToJson(
  _ElementsEntityModelDefault instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'figures': _$FiguresEnumMap[instance.figures],
  'polygones': _$PolygonesEnumMap[instance.polygones],
  'volumes': _$VolumesEnumMap[instance.volumes],
  'runtimeType': instance.$type,
};

const _$FiguresEnumMap = {
  Figures.cercle: 'cercle',
  Figures.disque: 'disque',
  Figures.ovale: 'ovale',
  Figures.ellipse: 'ellipse',
};

const _$PolygonesEnumMap = {
  Polygones.triangle: 'triangle',
  Polygones.losange: 'losange',
  Polygones.octogone: 'octogone',
  Polygones.pentagone: 'pentagone',
  Polygones.hexagone: 'hexagone',
  Polygones.quadrilatere: 'quadrilatere',
  Polygones.trapeze: 'trapeze',
};

const _$VolumesEnumMap = {
  Volumes.cube: 'cube',
  Volumes.boule: 'boule',
  Volumes.sphere: 'sphere',
  Volumes.cylindre: 'cylindre',
  Volumes.pyramide: 'pyramide',
  Volumes.cone: 'cone',
};

_ElementsEntityModelFigures _$ElementsEntityModelFiguresFromJson(
  Map<String, dynamic> json,
) => _ElementsEntityModelFigures(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  figures:
      $enumDecodeNullable(_$FiguresEnumMap, json['figures']) ?? Figures.cercle,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ElementsEntityModelFiguresToJson(
  _ElementsEntityModelFigures instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'figures': _$FiguresEnumMap[instance.figures]!,
  'runtimeType': instance.$type,
};

_ElementsEntityModelPolygones _$ElementsEntityModelPolygonesFromJson(
  Map<String, dynamic> json,
) => _ElementsEntityModelPolygones(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  polygones:
      $enumDecodeNullable(_$PolygonesEnumMap, json['polygones']) ??
      Polygones.quadrilatere,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ElementsEntityModelPolygonesToJson(
  _ElementsEntityModelPolygones instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'polygones': _$PolygonesEnumMap[instance.polygones]!,
  'runtimeType': instance.$type,
};

_ElementsEntityModelVolumes _$ElementsEntityModelVolumesFromJson(
  Map<String, dynamic> json,
) => _ElementsEntityModelVolumes(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  volumes:
      $enumDecodeNullable(_$VolumesEnumMap, json['volumes']) ?? Volumes.cube,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ElementsEntityModelVolumesToJson(
  _ElementsEntityModelVolumes instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'volumes': _$VolumesEnumMap[instance.volumes]!,
  'runtimeType': instance.$type,
};
