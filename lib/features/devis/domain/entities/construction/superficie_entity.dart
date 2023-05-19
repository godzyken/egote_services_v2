import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'superficie_entity.freezed.dart';
part 'superficie_entity.g.dart';

@freezed
class SuperficieEntity with _$SuperficieEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const SuperficieEntity._();

  const factory SuperficieEntity.initialize({
    required int longueur,
    required int largeur,
    int? hauteur,
  }) = _SuperficieEntityInitialize;

  int air(int longueur, int largeur) {
    return longueur * largeur;
  }

  int? linear(int longueur, int? largeur) {
    return 2 * (longueur + largeur!);
  }

  int? quantity(air, int hauteur) {
    return air * hauteur;
  }

  const factory SuperficieEntity({
    required int longueur,
    required int largeur,
    int? hauteur,
    // Function()? air,
    // Function()? perimetre,
    // Function()? volume,
  }) = _SuperficieEntityData;

  const factory SuperficieEntity.surface({required int surface}) =
      _SuperficieEntityAir;

  const factory SuperficieEntity.perimetre({required int perimetre}) =
      _SuperficieEntityPerimetre;

  const factory SuperficieEntity.volume({required int volume}) =
      _SuperficieEntityVolume;

  factory SuperficieEntity.fromJson(Map<String, dynamic> json) =>
      _$SuperficieEntityFromJson(json);

  factory SuperficieEntity.fromFirestore(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;
    return SuperficieEntity(
      longueur: map['longueur'] ?? 0,
      largeur: map['largeur'] ?? 0,
      hauteur: map['hauteur'] ?? 0,
      // perimetre: map['perimetre'] ?? 0,
      // air: map['surface'] ?? 0,
      // volume: map['volume'] ?? 0,
    );
  }
}
