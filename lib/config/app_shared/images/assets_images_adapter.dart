import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_local.dart';

class AssetsImageConverter
    implements JsonConverter<LocalImages, Map<String, dynamic>> {
  const AssetsImageConverter();

  @override
  Map<String, dynamic> toJson(LocalImages localImages) => {
        'carrelageBackground': LocalImages.carrelageBackground,
        'godzyLogo': LocalImages.godzyLogo,
        'logoBatServices': LocalImages.logoBatServices,
        'digitalTransformationTeaser': LocalImages.digitalTransformationTeaser,
        'maisonIndiv': LocalImages.maisonIndiv,
        'apartmentPng': LocalImages.apartmentPng,
        'trianglePng': LocalImages.trianglePng,
        'solPvcHolyWell': LocalImages.solPvcHolyWell,
        'swimmingPoolSussargue': LocalImages.swimmingPoolSussargue,
        'androidRobotGifOne': LocalImages.androidRobotGifOne,
        'androidRobotGifTwo': LocalImages.androidRobotGifTwo,
        'arcticFoxSitting': LocalImages.arcticFoxSitting,
        'arcticFoxGif': LocalImages.arcticFoxGif,
        'tocoToucanGifOne': LocalImages.tocoToucanGifOne,
        'tocoToucanGifOne2': LocalImages.tocoToucanGifOne2,
        'foxFaceMeshTexture': LocalImages.foxFaceMeshTexture,
        'provaTexture': LocalImages.provaTexture,
        'venomJpg': LocalImages.venomJpg,
        'venomWithEyes': LocalImages.venomWithEyes,
        'earthJpg': LocalImages.earthJpg,
        'earthTwo': LocalImages.earthTwo,
        'earthAugmentedImage': LocalImages.earthAugmentedImage,
        'copertinaJpg': LocalImages.copertinaJpg,
        'humanDigital': LocalImages.humanDigital,
        'myImagesImgDb': LocalImages.myImagesImgDb,
        'topoLinoJpg': LocalImages.topoLinoJpg,
        'santaMariaMadalena': LocalImages.santaMariaMadalena
      };

  @override
  LocalImages fromJson(Map<String, dynamic> json) => LocalImages();
}
