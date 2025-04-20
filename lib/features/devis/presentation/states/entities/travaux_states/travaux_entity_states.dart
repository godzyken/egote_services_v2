import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/construction/travaux_entity.dart';
import '../../../../domain/entities/value_objects/converter/extention_valueof_converters.dart';

part 'travaux_entity_states.freezed.dart';
part 'travaux_entity_states.g.dart';

@freezed
sealed class TravauxEntityStates with _$TravauxEntityStates {
  @FreezedUnionValue("list")
  const factory TravauxEntityStates.list({
    @TravauxEntityConverter() required List<TravauxEntity> travaux,
  }) = _TravauxEntityStatesList;

  @FreezedUnionValue("initial")
  factory TravauxEntityStates.initial({required List<TravauxEntity> travaux}) =>
      TravauxEntityStates.initial(travaux: <TravauxEntity>[]);

  @FreezedUnionValue("done")
  factory TravauxEntityStates.done({required List<TravauxEntity> travaux}) =>
      TravauxEntityStates.done(travaux: <TravauxEntity>[]);

  factory TravauxEntityStates.fromJson(Map<String, dynamic> json) =>
      _$TravauxEntityStatesFromJson(json);
}
