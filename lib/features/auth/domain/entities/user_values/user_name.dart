import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:egote_services_v2/features/common/domain/values/value_abstract.dart';
import 'package:fpdart/src/either.dart' as either;

class UserName extends ValueAbstract<String> {
  factory UserName(String input) {
    return UserName._(
      _validate(input),
    );
  }

  const UserName._(this._value);

  @override
  either.Either<Failure, String> get value => _value;

  final either.Either<Failure, String> _value;
}

either.Either<Failure, String> _validate(String input) {
  if (input.length >= 2) {
    return either.right(input);
  }

  return either.left(
    Failure.unprocessableEntity(
        message: 'The name must be at least 2 characters in length'),
  );
}
