import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission_entity.dart';

class MissionEntityConverter
    implements JsonConverter<MissionEntity, Map<String, dynamic>> {
  const MissionEntityConverter();

  @override
  MissionEntity fromJson(Map<String, dynamic> json) {
    return MissionEntity.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MissionEntity object) {
    return object.toJson();
  }
}
