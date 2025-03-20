import 'package:freezed_annotation/freezed_annotation.dart';

import 'mission_id.dart';

class MissionIdConverter implements JsonConverter<MissionId, String> {
  const MissionIdConverter();

  @override
  MissionId fromJson(String json) {
    return MissionId(value: json);
  }

  @override
  String toJson(MissionId object) {
    return object.value;
  }
}
