import 'package:egote_services_v2/features/devis/domain/entities/value_objects/sku_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SKUValueConverter implements JsonConverter<SKUValue, String> {
  const SKUValueConverter();

  @override
  SKUValue fromJson(String json) => SKUValue(json);

  @override
  String toJson(SKUValue object) => object.value;
}
