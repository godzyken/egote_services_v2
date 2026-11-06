// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImagesWeb _$ImagesWebFromJson(Map<String, dynamic> json) => _ImagesWeb(
  name: json['name'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ImagesWebToJson(_ImagesWeb instance) =>
    <String, dynamic>{'name': instance.name, 'runtimeType': instance.$type};

_ImagesLocal _$ImagesLocalFromJson(Map<String, dynamic> json) => _ImagesLocal(
  images: (json['images'] as List<dynamic>)
      .map(
        (e) => const AssetsImageConverter().fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ImagesLocalToJson(
  _ImagesLocal instance,
) => <String, dynamic>{
  'images': instance.images.map(const AssetsImageConverter().toJson).toList(),
  'runtimeType': instance.$type,
};

_ImagesError _$ImagesErrorFromJson(Map<String, dynamic> json) => _ImagesError(
  error: json['error'] as String,
  message: json['message'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ImagesErrorToJson(_ImagesError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_ImagesAssetsLoading _$ImagesAssetsLoadingFromJson(Map<String, dynamic> json) =>
    _ImagesAssetsLoading(
      images: (json['images'] as List<dynamic>)
          .map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLoading: json['is_loading'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ImagesAssetsLoadingToJson(
  _ImagesAssetsLoading instance,
) => <String, dynamic>{
  'images': instance.images,
  'is_loading': instance.isLoading,
  'runtimeType': instance.$type,
};

_ImagesAssetsFailed _$ImagesAssetsFailedFromJson(Map<String, dynamic> json) =>
    _ImagesAssetsFailed(
      isLoading: json['is_loading'] as bool,
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ImagesAssetsFailedToJson(_ImagesAssetsFailed instance) =>
    <String, dynamic>{
      'is_loading': instance.isLoading,
      'message': instance.message,
      'runtimeType': instance.$type,
    };
