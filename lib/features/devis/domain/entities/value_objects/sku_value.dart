import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class SKUValue {
  final String value;

  const SKUValue(this.value);

  static const SKUValue empty = SKUValue('');

  @override
  String toString() => value;
}
