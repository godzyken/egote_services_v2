import 'dart:convert';

import 'package:egote_services_v2/config/app_shared/images/assets_images_adapter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_local.dart';

part 'assets_images.freezed.dart';
part 'assets_images.g.dart';

@freezed
sealed class Images with _$Images {
  @FreezedUnionValue("web")
  const factory Images.web({
    required String name,
  }) = _ImagesWeb;

  @FreezedUnionValue("local")
  const factory Images.local({
    @AssetsImageConverter() required List<LocalImages> images,
  }) = _ImagesLocal;

  @FreezedUnionValue("error")
  const factory Images.error({required String error, required String message}) =
      _ImagesError;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@Freezed()
sealed class ImagesAssets with _$ImagesAssets {
  @FreezedUnionValue("loading")
  const factory ImagesAssets.loading(
      {required List<Images> images,
      required bool isLoading}) = _ImagesAssetsLoading;

  @FreezedUnionValue("failed")
  const factory ImagesAssets.failed({
    required bool isLoading,
    required String message,
  }) = _ImagesAssetsFailed;

  const ImagesAssets._();
}

final assetList =
    StateNotifierProvider<ImageAssetsNotifier, List<ImagesAssets>>(
        (ref) => ImageAssetsNotifier());

class ImageAssetsNotifier extends StateNotifier<List<ImagesAssets>> {
  ImageAssetsNotifier([List<ImagesAssets>? state])
      : super(state ?? <ImagesAssets>[]) {
    loadImages(true);
  }

  loadImages(bool isLoading) async {
    final List<Images> imageList = <Images>[];

    for (var img in imageList) {
      final assetsData = await rootBundle.loadString(
          img.when(
            web: (name) {
              final Images newImages = Images.web(name: name);
              return newImages.toString();
            },
            local: (images) {
              final Images newImages = Images.local(images: images);
              return newImages.toString();
            },
            error: (error, message) =>
                Images.error(error: error, message: message).toString(),
          ),
          cache: true);

      final assetsList = json.decode(assetsData) as List<dynamic>;

      final images = assetsList.map((e) => Images.fromJson(e)).toList();
      state = isLoading
          ? <ImagesAssets>[
              ImagesAssets.loading(images: images, isLoading: true)
            ].toList()
          : <ImagesAssets>[
              const ImagesAssets.failed(
                  isLoading: false, message: 'Failed to load images assets')
            ].toList();
    }
  }
}
