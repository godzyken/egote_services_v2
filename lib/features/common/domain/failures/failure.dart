import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure implements Exception {
  const Failure._();
  factory Failure.empty() = _EmptyFailure;

  factory Failure.unprocessableEntity({required String message}) =
      _UnprocessableEntityFailure;

  factory Failure.unauthorized() = _UnauthorizedFailure;

  factory Failure.badRequest() = _BadRequestFailure;

  String get error => this is _UnprocessableEntityFailure
      ? (this as _UnprocessableEntityFailure).message
      : '$this';
}
