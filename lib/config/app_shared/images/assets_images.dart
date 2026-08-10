import 'dart:convert';

import 'package:egote_services_v2/config/app_shared/images/assets_images_adapter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_local.dart';

part 'assets_images.freezed.dart';
part 'assets_images.g.dart';

@freezed
abstract class Images with _$Images {
  const factory Images.web({
    required String name,
  }) = _ImagesWeb;

  const factory Images.local({
    @AssetsImageConverter() required List<LocalImages> images,
  }) = _ImagesLocal;

  const factory Images.error({
    required String error,
    required String message,
  }) = _ImagesError;

  const Images._();

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
abstract class ImagesAssets with _$ImagesAssets {
  const factory ImagesAssets.loading({
    required List<Images> images,
    required bool isLoading,
  }) = _ImagesAssetsLoading;

  const factory ImagesAssets.failed({
    required bool isLoading,
    required String message,
  }) = _ImagesAssetsFailed;

  const ImagesAssets._();

  factory ImagesAssets.fromJson(Map<String, dynamic> json) =>
      _$ImagesAssetsFromJson(json);
}

// --- NOTIFIER (Riverpod 3 Syntax) ---

class ImageAssetsNotifier extends Notifier<List<ImagesAssets>> {
  @override
  List<ImagesAssets> build() {
    // Exécution de la charge initiale au montage du provider
    loadImages(true);
    return const [];
  }

  Future<void> loadImages(bool isLoading, {List<String>? assetPaths}) async {
    final pathsToLoad = assetPaths ?? [];

    if (pathsToLoad.isEmpty) {
      state = [
        const ImagesAssets.failed(
          isLoading: false,
          message: 'Aucun chemin d\'asset spécifié.',
        ),
      ];
      return;
    }

    final List<Images> loadedImages = [];

    try {
      for (final path in pathsToLoad) {
        final assetsData = await rootBundle.loadString(path, cache: true);
        final assetsList = json.decode(assetsData) as List<dynamic>;

        final images = assetsList
            .map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList();

        loadedImages.addAll(images);
      }

      state = [
        ImagesAssets.loading(
          images: loadedImages,
          isLoading: isLoading,
        ),
      ];
    } catch (e) {
      state = [
        ImagesAssets.failed(
          isLoading: false,
          message: 'Erreur lors du chargement des assets : ${e.toString()}',
        ),
      ];
    }
  }
}

// --- PROVIDER ---

final assetListProvider =
NotifierProvider<ImageAssetsNotifier, List<ImagesAssets>>(
  ImageAssetsNotifier.new,
  name: 'AssetListNotifierProvider',
);