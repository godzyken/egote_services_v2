// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'superficie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuperficieEntityInitialize _$SuperficieEntityInitializeFromJson(
  Map<String, dynamic> json,
) => _SuperficieEntityInitialize(
  longueur: (json['longueur'] as num).toInt(),
  largeur: (json['largeur'] as num).toInt(),
  hauteur: (json['hauteur'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuperficieEntityInitializeToJson(
  _SuperficieEntityInitialize instance,
) => <String, dynamic>{
  'longueur': instance.longueur,
  'largeur': instance.largeur,
  'hauteur': instance.hauteur,
  'runtimeType': instance.$type,
};

_SuperficieEntityData _$SuperficieEntityDataFromJson(
  Map<String, dynamic> json,
) => _SuperficieEntityData(
  longueur: (json['longueur'] as num).toInt(),
  largeur: (json['largeur'] as num).toInt(),
  hauteur: (json['hauteur'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuperficieEntityDataToJson(
  _SuperficieEntityData instance,
) => <String, dynamic>{
  'longueur': instance.longueur,
  'largeur': instance.largeur,
  'hauteur': instance.hauteur,
  'runtimeType': instance.$type,
};

_SuperficieEntityAir _$SuperficieEntityAirFromJson(Map<String, dynamic> json) =>
    _SuperficieEntityAir(
      surface: (json['surface'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$SuperficieEntityAirToJson(
  _SuperficieEntityAir instance,
) => <String, dynamic>{
  'surface': instance.surface,
  'runtimeType': instance.$type,
};

_SuperficieEntityPerimetre _$SuperficieEntityPerimetreFromJson(
  Map<String, dynamic> json,
) => _SuperficieEntityPerimetre(
  perimetre: (json['perimetre'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuperficieEntityPerimetreToJson(
  _SuperficieEntityPerimetre instance,
) => <String, dynamic>{
  'perimetre': instance.perimetre,
  'runtimeType': instance.$type,
};

_SuperficieEntityVolume _$SuperficieEntityVolumeFromJson(
  Map<String, dynamic> json,
) => _SuperficieEntityVolume(
  volume: (json['volume'] as num).toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SuperficieEntityVolumeToJson(
  _SuperficieEntityVolume instance,
) => <String, dynamic>{
  'volume': instance.volume,
  'runtimeType': instance.$type,
};
