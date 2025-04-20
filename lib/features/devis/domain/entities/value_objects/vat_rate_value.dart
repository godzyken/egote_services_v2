class VatRateValue {
  final double rate;

  const VatRateValue._(this.rate);

  factory VatRateValue(double input) {
    if (input < 0 || input > 100) {
      throw ArgumentError('VAT rate must be between 0 and 100');
    }
    return VatRateValue._(input);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VatRateValue &&
          runtimeType == other.runtimeType &&
          rate == other.rate;

  @override
  int get hashCode => rate.hashCode;

  @override
  String toString() => '$rate%';
}
