import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract class ValueAbstract<T> {
  const ValueAbstract();

  Either<Failure, T> get value;

  @override
  String toString() => value.fold((l) => l.error, (r) => r.toString());

  String? get validate => value.fold((l) => l.error, (r) => null);
}
