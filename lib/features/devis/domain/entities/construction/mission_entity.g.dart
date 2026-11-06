// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MissionEntityDefault _$MissionEntityDefaultFromJson(
  Map<String, dynamic> json,
) => _MissionEntityDefault(
  id: MissionId.fromJson(json['id'] as Map<String, dynamic>),
  denomination: json['denomination'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MissionEntityDefaultToJson(
  _MissionEntityDefault instance,
) => <String, dynamic>{
  'id': instance.id,
  'denomination': instance.denomination,
  'runtimeType': instance.$type,
};

_MissionEntityInit _$MissionEntityInitFromJson(Map<String, dynamic> json) =>
    _MissionEntityInit(
      id: MissionId.fromJson(json['id'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MissionEntityInitToJson(_MissionEntityInit instance) =>
    <String, dynamic>{'id': instance.id, 'runtimeType': instance.$type};

_MissionEntityDone _$MissionEntityDoneFromJson(Map<String, dynamic> json) =>
    _MissionEntityDone(
      id: MissionId.fromJson(json['id'] as Map<String, dynamic>),
      denomination: json['denomination'] as String,
      startedAt: DateTime.parse(json['started_at'] as String),
      finishedAt: DateTime.parse(json['finished_at'] as String),
      doneOk: json['done_ok'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$MissionEntityDoneToJson(_MissionEntityDone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'denomination': instance.denomination,
      'started_at': instance.startedAt.toIso8601String(),
      'finished_at': instance.finishedAt.toIso8601String(),
      'done_ok': instance.doneOk,
      'runtimeType': instance.$type,
    };

_MissionEntityProgress _$MissionEntityProgressFromJson(
  Map<String, dynamic> json,
) => _MissionEntityProgress(
  id: MissionId.fromJson(json['id'] as Map<String, dynamic>),
  denomination: json['denomination'] as String,
  startedAt: DateTime.parse(json['started_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MissionEntityProgressToJson(
  _MissionEntityProgress instance,
) => <String, dynamic>{
  'id': instance.id,
  'denomination': instance.denomination,
  'started_at': instance.startedAt.toIso8601String(),
  'runtimeType': instance.$type,
};

_MissionEntityAbandon _$MissionEntityAbandonFromJson(
  Map<String, dynamic> json,
) => _MissionEntityAbandon(
  id: MissionId.fromJson(json['id'] as Map<String, dynamic>),
  denomination: json['denomination'] as String,
  reason: json['reason'] as String,
  left: DateTime.parse(json['left'] as String),
  isLeft: json['is_left'] as bool,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$MissionEntityAbandonToJson(
  _MissionEntityAbandon instance,
) => <String, dynamic>{
  'id': instance.id,
  'denomination': instance.denomination,
  'reason': instance.reason,
  'left': instance.left.toIso8601String(),
  'is_left': instance.isLeft,
  'runtimeType': instance.$type,
};
