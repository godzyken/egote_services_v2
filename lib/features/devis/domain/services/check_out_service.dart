import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CheckoutService {
  // this will succeed or throw an error
  Future<Either<Failure, bool>> pay();
}
