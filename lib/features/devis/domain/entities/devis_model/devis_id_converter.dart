import 'package:freezed_annotation/freezed_annotation.dart';

import 'devi_id.dart';

class DevisIdConverter implements JsonConverter<DevisId, String> {
  const DevisIdConverter();

  @override
  DevisId fromJson(String json) {
    return DevisId(value: json);
  }

  @override
  String toJson(DevisId object) {
    return object.value;
  }
}
