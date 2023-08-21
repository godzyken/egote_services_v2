import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devis_entity_states.freezed.dart';
part 'devis_entity_states.g.dart';

@freezed
abstract class DevisEntityStates with _$DevisEntityStates {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory DevisEntityStates({
    required List<DevisModelEntity> devis,
  }) = _DevisEntityStates;

  factory DevisEntityStates.initial() =>
      const DevisEntityStates(
        devis: <DevisModelEntity>[],
      );

  factory DevisEntityStates.fromJson(Map<String, dynamic> json) =>
      _$DevisEntityStatesFromJson(json);
}


