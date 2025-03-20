import 'package:egote_services_v2/features/devis/domain/entities/construction/travau_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TravauIdConverter implements JsonConverter<TravauId, String> {
  const TravauIdConverter();

  @override
  TravauId fromJson(String json) {
    return TravauId(value: json);
  }

  @override
  String toJson(TravauId object) {
    return object.value;
  }
}
