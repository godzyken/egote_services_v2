import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:gotrue/src/gotrue_client.dart';
import 'package:supabase/src/auth_user.dart';

import '../data_sources/database/source_base.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SourceBase database;

  AuthRepositoryImpl(this.database);

  @override
  // TODO: implement authClient
  GoTrueClient get authClient => throw UnimplementedError();

  @override
  void authStateChange(void Function(UserEntityModel? userEntity) callback) {
    // TODO: implement authStateChange
  }

  @override
  // TODO: implement authTokenLocalDataSource
  AuthTokenLocalDataSource get authTokenLocalDataSource =>
      throw UnimplementedError();

  @override
  // TODO: implement currentUser
  UserEntityModel? get currentUser => throw UnimplementedError();

  @override
  Future<Either<Failure, bool>> isOnLine() {
    // TODO: implement isOnLine
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntityModel>> restoreSession() {
    // TODO: implement restoreSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntityModel>> setSession(String token) {
    // TODO: implement setSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntityModel>> signInWithPassword(
      String? email, String? password) {
    // TODO: implement signInWithPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntityModel>> signUp(
      String? email, String? username, String? password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<AuthUser?>? get user => throw UnimplementedError();
}
