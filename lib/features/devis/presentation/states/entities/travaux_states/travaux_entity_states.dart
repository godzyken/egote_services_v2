import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/construction/travaux_entity.dart';

part 'travaux_entity_states.freezed.dart';
part 'travaux_entity_states.g.dart';

@freezed
abstract class TravauxEntityStates with _$TravauxEntityStates {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TravauxEntityStates({
    required List<TravauxEntity> travaux,
  }) = _TravauxEntityStates;

  factory TravauxEntityStates.initial() =>
      const TravauxEntityStates(travaux: <TravauxEntity>[]);

  factory TravauxEntityStates.done() =>
      const TravauxEntityStates(travaux: <TravauxEntity>[]);

  factory TravauxEntityStates.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityStatesFromJson(json);
}
