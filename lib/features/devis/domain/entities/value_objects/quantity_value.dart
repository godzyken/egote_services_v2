class QuantityValue {
  final int quantity;

  const QuantityValue(this.quantity);

  static const zero = QuantityValue(0);

  @override
  String toString() => quantity.toString();
}
