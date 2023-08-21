import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mission_id.freezed.dart';
part 'mission_id.g.dart';

@freezed
class MissionId with _$MissionId {
  const factory MissionId({
    required int id,
  }) = _MissionId;


  factory MissionId.fromJson(Map<String, dynamic> json) =>
      _$MissionIdFromJson(json);
}