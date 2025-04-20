import 'package:egote_services_v2/features/devis/domain/entities/value_objects/vat_rate_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class VatRateValueConverter implements JsonConverter<VatRateValue, double> {
  const VatRateValueConverter();

  @override
  VatRateValue fromJson(double json) => VatRateValue(json);

  @override
  double toJson(VatRateValue object) => object.rate;
}
