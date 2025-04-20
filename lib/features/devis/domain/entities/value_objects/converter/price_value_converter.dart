import 'package:egote_services_v2/features/devis/domain/entities/value_objects/price_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PriceValueConverter implements JsonConverter<PriceValue, double> {
  const PriceValueConverter();

  @override
  PriceValue fromJson(double json) => PriceValue(json);

  @override
  double toJson(PriceValue object) => object.value;
}
