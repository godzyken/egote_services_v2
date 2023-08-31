import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';

abstract class CubeRepositoryInterface {
  Future<Either<Failure, bool>> signInWithSocialProviders(
      String socialProvider,
      String accessToken,
      String accessTokenSecret
      );

  Future<Either<Failure, bool>> signOut();

  Future<CubeUser>? setSession(String token);

  Future<Either<Failure, CubeSession>> createUserSession(
      String login,
      String password
      );

  Future<Either<Failure, CubeSession>> updateUserSession(
      String something,
      String password
      );

  Future<Either<Failure, CubeSession>> createGuestUserSession(
      bool isGuest,
      String fullName
      );

  Future<CubeSession> restoreSession();

  Future<CubeFile> getUploadingImageFuture(FilePickerResult result);

  Future<CubeSession> createPhoneAuthSession();
}