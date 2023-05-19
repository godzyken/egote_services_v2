import 'package:freezed_annotation/freezed_annotation.dart';

part 'elements.freezed.dart';
part 'elements.g.dart';

@freezed
class ElementsEntityModel with _$ElementsEntityModel {
  const factory ElementsEntityModel(
      {required int id,
      required String name,
      Figures? figures,
      Polygones? polygones,
      Volumes? volumes}) = _ElementsEntityModel;

  const factory ElementsEntityModel.figures(
      {required int id,
      required String name,
      @Default(Figures.cercle) Figures figures}) = _ElementsEntityModelFigures;

  const factory ElementsEntityModel.polygones(
          {required int id,
          required String name,
          @Default(Polygones.quadrilatere) Polygones polygones}) =
      _ElementsEntityModelPolygones;

  const factory ElementsEntityModel.volumes(
      {required int id,
      required String name,
      @Default(Volumes.cube) Volumes volumes}) = _ElementsEntityModelVolumes;

  factory ElementsEntityModel.fromJson(Map<String, dynamic> json) =>
      _$ElementsEntityModelFromJson(json);
}

enum Figures {
  cercle,
  disque,
  ovale,
  ellipse,
}

enum Polygones {
  triangle,
  losange,
  octogone,
  pentagone,
  hexagone,
  quadrilatere,
  trapeze,
}

enum Volumes {
  cube,
  boule,
  sphere,
  cylindre,
  pyramide,
  cone,
}
