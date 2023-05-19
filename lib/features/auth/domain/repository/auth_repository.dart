import 'package:fpdart/fpdart.dart';

import '../../../common/domain/failures/failure.dart';
import '../entities/user/user_entity.dart';

abstract class AuthRepositoryInterface {
  Future<Either<Failure, bool>> signInWithGoogle();
  Future<Either<Failure, bool>> signOut();

  void authStateChange(
    void Function(UserEntityModel? userEntity) callback,
  );

  Future<void> setSession(String token);

  Future<Either<Failure, UserEntityModel>> restoreSession();

  Future<Either<Failure, UserEntityModel>> signUp(
    String? email,
    String? username,
    String? password,
  );

  Future<Either<Failure, UserEntityModel>> signInWithPassword(
    String? email,
    String? password,
  );

  Future<Either<Failure, bool>> isOnLine();
}
