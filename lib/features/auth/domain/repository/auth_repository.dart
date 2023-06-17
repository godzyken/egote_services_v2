import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../common/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  Future<Either<Failure, bool>> signInWithGoogle();
  Future<Either<Failure, bool>> signOut();

  void authStateChange(
    void Function(UserModel? userEntity) callback,
  );

  Future<void> setSession(String token);

  Future<Either<Failure, UserModel>> restoreSession();

  Future<Either<Failure, UserModel>> signUp(
    String? email,
    String? username,
    String? password,
  );

  Future<Either<Failure, supabase.User>> signInWithPassword(
    String? email,
    String? password,
  );

  Future<Either<Failure, bool>> isOnLine();

  Future<Either<Failure, supabase.AuthResponse>> verifyCode(
      String email,
      String code,
      );

  Future<Either<Failure, UserEntityModel>> createUserEntityModel(
      UserName name
      );

}
