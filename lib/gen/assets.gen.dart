// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/OFL.txt
  String get ofl => 'assets/fonts/OFL.txt';

  /// File path: assets/fonts/Pacifico-Regular.ttf
  String get pacificoRegular => 'assets/fonts/Pacifico-Regular.ttf';

  /// List of all assets
  List<String> get values => [ofl, pacificoRegular];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/development.config.json
  String get developmentConfig => 'assets/json/development.config.json';

  /// File path: assets/json/local.config.json
  String get localConfig => 'assets/json/local.config.json';

  /// File path: assets/json/production.config.json
  String get productionConfig => 'assets/json/production.config.json';

  /// List of all assets
  List<String> get values => [developmentConfig, localConfig, productionConfig];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// Directory path: assets/lottie/archive
  $AssetsLottieArchiveGen get archive => const $AssetsLottieArchiveGen();

  /// Directory path: assets/lottie/image
  $AssetsLottieImageGen get image => const $AssetsLottieImageGen();
}

class $AssetsLottieArchiveGen {
  const $AssetsLottieArchiveGen();

  /// Directory path: assets/lottie/archive/amenagement
  $AssetsLottieArchiveAmenagementGen get amenagement =>
      const $AssetsLottieArchiveAmenagementGen();
}

class $AssetsLottieImageGen {
  const $AssetsLottieImageGen();

  /// File path: assets/lottie/image/appartement.png
  AssetGenImage get appartement =>
      const AssetGenImage('assets/lottie/image/appartement.png');

  /// File path: assets/lottie/image/carrelage_background.jpg
  AssetGenImage get carrelageBackground =>
      const AssetGenImage('assets/lottie/image/carrelage_background.jpg');

  /// File path: assets/lottie/image/digital-transformation-teaser.jpg
  AssetGenImage get digitalTransformationTeaser => const AssetGenImage(
    'assets/lottie/image/digital-transformation-teaser.jpg',
  );

  /// File path: assets/lottie/image/digital_transf.jpg
  AssetGenImage get digitalTransf =>
      const AssetGenImage('assets/lottie/image/digital_transf.jpg');

  /// File path: assets/lottie/image/godzy_logo.png
  AssetGenImage get godzyLogo =>
      const AssetGenImage('assets/lottie/image/godzy_logo.png');

  /// File path: assets/lottie/image/logo_bat_services.png
  AssetGenImage get logoBatServices =>
      const AssetGenImage('assets/lottie/image/logo_bat_services.png');

  /// File path: assets/lottie/image/maison_indiv.png
  AssetGenImage get maisonIndiv =>
      const AssetGenImage('assets/lottie/image/maison_indiv.png');

  /// File path: assets/lottie/image/triangle.png
  AssetGenImage get triangle =>
      const AssetGenImage('assets/lottie/image/triangle.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appartement,
    carrelageBackground,
    digitalTransformationTeaser,
    digitalTransf,
    godzyLogo,
    logoBatServices,
    maisonIndiv,
    triangle,
  ];
}

class $AssetsLottieArchiveAmenagementGen {
  const $AssetsLottieArchiveAmenagementGen();

  /// Directory path: assets/lottie/archive/amenagement/exterieur
  $AssetsLottieArchiveAmenagementExterieurGen get exterieur =>
      const $AssetsLottieArchiveAmenagementExterieurGen();
}

class $AssetsLottieArchiveAmenagementExterieurGen {
  const $AssetsLottieArchiveAmenagementExterieurGen();

  /// Directory path: assets/lottie/archive/amenagement/exterieur/piscines
  $AssetsLottieArchiveAmenagementExterieurPiscinesGen get piscines =>
      const $AssetsLottieArchiveAmenagementExterieurPiscinesGen();
}

class $AssetsLottieArchiveAmenagementExterieurPiscinesGen {
  const $AssetsLottieArchiveAmenagementExterieurPiscinesGen();

  /// File path: assets/lottie/archive/amenagement/exterieur/piscines/piscine_sussargue_1.jpg
  AssetGenImage get piscineSussargue1 => const AssetGenImage(
    'assets/lottie/archive/amenagement/exterieur/piscines/piscine_sussargue_1.jpg',
  );

  /// List of all assets
  List<AssetGenImage> get values => [piscineSussargue1];
}

abstract final class Assets {
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
