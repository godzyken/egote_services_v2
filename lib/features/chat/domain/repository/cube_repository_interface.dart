import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

abstract class CubeRepositoryInterface {
  Future<Either<Failure, CubeSession>> createPhoneAuthSession(Ref ref);
  Future<Either<Failure, CubeSession>> createFacebookAuthSession(Ref ref);
  Future<Either<Failure, CubeSession>> createGoogleAuthSession(Ref ref);
  Future<CubeFile?> getUploadingImageFuture(FilePickerResult result);

  Either<Failure, AuthResponse> logErrorSwitchException(Object e);
}
