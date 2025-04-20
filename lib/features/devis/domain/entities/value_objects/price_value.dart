class PriceValue {
  final double value;

  const PriceValue(this.value);

  static const PriceValue zero = PriceValue(0.0);

  @override
  String toString() => value.toStringAsFixed(2);
}
