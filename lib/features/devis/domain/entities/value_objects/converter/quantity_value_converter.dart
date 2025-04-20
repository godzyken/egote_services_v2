import 'package:egote_services_v2/features/devis/domain/entities/value_objects/quantity_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class QuantityValueConverter implements JsonConverter<QuantityValue, int> {
  const QuantityValueConverter();

  @override
  QuantityValue fromJson(int json) => QuantityValue(json);

  @override
  int toJson(QuantityValue object) => object.quantity;
}
