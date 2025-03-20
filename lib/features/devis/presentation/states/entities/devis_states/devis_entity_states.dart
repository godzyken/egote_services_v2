import 'package:egote_services_v2/features/devis/domain/entities/devis_model/devis_model_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devis_entity_states.freezed.dart';

@freezed
abstract class DevisEntityStates with _$DevisEntityStates {
  @FreezedUnionValue("propale")
  factory DevisEntityStates.propale({
    required List<DevisModelEntity> devis,
  }) = _Propale;

  @FreezedUnionValue("signed")
  factory DevisEntityStates.signed(
      {required List<DevisModelEntity> devis, required bool signed}) = _Signed;
}
