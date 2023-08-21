import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'devi_id.freezed.dart';
part 'devi_id.g.dart';

@freezed
class DevisId with _$DevisId {
  const factory DevisId({
    required int id,
  }) = _DevisId;



  factory DevisId.fromJson(Map<String, dynamic> json) =>
      _$DevisIdFromJson(json);
}