import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'superficie_entity.freezed.dart';
part 'superficie_entity.g.dart';

@freezed
sealed class SuperficieEntity with _$SuperficieEntity {
  @FreezedUnionValue("circle")
  const factory SuperficieEntity.circle(double radius) = _Circle;
  @FreezedUnionValue("rectangle")
  const factory SuperficieEntity.rectangle(double width, double height) =
      _Rectangle;
  @FreezedUnionValue("cylinder")
  const factory SuperficieEntity.cylinder(double radius, double height) =
      _Cylinder;
  @FreezedUnionValue("square")
  const factory SuperficieEntity.square(double side) = _Square;

  const SuperficieEntity._();

  // Calculs de l'air, périmètre et volume

  double get area => when(
        circle: (radius) => pi * radius * radius,
        rectangle: (width, height) => width * height,
        cylinder: (radius, height) => pi * radius * radius * height,
        square: (side) => side * side,
      );

  double get perimeter => when(
        circle: (radius) => 2 * pi * radius,
        rectangle: (width, height) => 2 * (width + height),
        cylinder: (radius, height) => 2 * pi * radius * (radius + height),
        square: (side) => 4 * side,
      );

  double get volume => when(
        circle: (radius) => 0,
        rectangle: (width, height) => 0,
        cylinder: (radius, height) => pi * radius * radius * height,
        square: (side) => 0,
      );

  factory SuperficieEntity.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityFromJson(json);

  // Sauvegarder les données dans Firestore
  Map<String, dynamic> toFirestore() {
    return when(
      circle: (radius) => {'type': 'circle', 'radius': radius},
      rectangle: (width, height) =>
          {'type': 'rectangle', 'width': width, 'height': height},
      cylinder: (radius, height) =>
          {'type': 'cylinder', 'radius': radius, 'height': height},
      square: (side) => {'type': 'square', 'side': side},
    );
  }

  // Récupérer les données depuis Firestore
  factory SuperficieEntity.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    switch (data['type']) {
      case 'circle':
        return SuperficieEntity.circle(data['radius']);
      case 'rectangle':
        return SuperficieEntity.rectangle(data['width'], data['height']);
      case 'cylinder':
        return SuperficieEntity.cylinder(data['radius'], data['height']);
      case 'square':
        return SuperficieEntity.square(data['side']);
      default:
        throw Exception('Forme inconnue');
    }
  }
}
