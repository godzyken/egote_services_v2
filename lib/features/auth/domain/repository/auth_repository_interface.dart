// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../chat/domain/models/entities/cube_user/cube_user_mig.dart';
import '../../../common/domain/failures/failure.dart';

abstract class AuthRepositoryInterface {
  Future<Either<Failure, bool>> signInWithGoogle();

  Future<Either<Failure, bool>> signOut();

  void authStateChange(
    void Function(UserModel? userEntity) callback,
  );

  // TODO: Migration, en attendant la maj de connectycube
  // Mon model 'CubeUser' est une classes Mocks 'CubeUserMIg'
  Future<Either<Failure, CubeUserMig>> cubeUserStateChange(
      void Function(CubeUserMig? cubeUser) cubeUser);

  Future<void> setSession(String token);

  Future<Either<Failure, UserModel>> restoreSession();

  Future<Either<Failure, UserModel>> signUp(
    String? email,
    String? name,
    String password,
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

  Future<Either<Failure, UserEntityModel>> createUserEntityModel(UserName name);
}
