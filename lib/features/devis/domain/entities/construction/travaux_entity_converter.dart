import 'package:egote_services_v2/features/devis/domain/entities/construction/travaux_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TravauxEntityConverter
    implements JsonConverter<TravauxEntity, Map<String, dynamic>> {
  const TravauxEntityConverter();

  @override
  TravauxEntity fromJson(Map<String, dynamic> json) {
    return TravauxEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TravauxEntity object) {
    return object.toJson();
  }
}
