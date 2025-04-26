import 'dart:developer' as developer;
import 'dart:io';

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../../config/app_shared/extensions/platform_utils.dart';
import '../../../../firebase_options.dart';
import '../../../auth/domain/entities/auth_exeptions/error_handler.dart';
import '../../../auth/domain/providers/auth_repository_provider.dart';
import '../../domain/repository/cube_repository_interface.dart';

class CubeRepository implements CubeRepositoryInterface {
  CubeRepository(this.authRepository);

  final AuthRepository authRepository;

  refreshBadgeCount() {
    getUnreadMessagesCount().then((value) => updateBadgeCount(value['total']));
  }

  @override
  Future<Either<Failure, CubeSession>> createPhoneAuthSession(Ref ref) async {
    final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
    try {
      final auth = ref.watch(firebaseAuthProvider(firebaseApp));

      var phoneAuthIdToken = await auth.currentUser?.getIdToken();

      if (phoneAuthIdToken == null) {
        return right(await createSession());
      }

      await authRepository.setSession(phoneAuthIdToken);

      return right(await createSessionUsingSocialProvider(
              CubeProvider.FIREBASE_PHONE,
              DefaultFirebaseOptions.currentPlatform.projectId,
              phoneAuthIdToken)
          .then((cubeSession) => CubeSessionManager.instance.activeSession!));
    } catch (e) {
      logErrorSwitchException(e);
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, CubeSession>> createFacebookAuthSession(
      Ref ref) async {
    try {
      final accessToken = await FacebookAuth.instance.accessToken;

      if (accessToken == null) {
        return right(await createSession());
      }

      await authRepository.setSession(accessToken.tokenString);

      return right(await createSessionUsingSocialProvider(
        CubeProvider.FACEBOOK,
        accessToken.tokenString,
      ).then((cubeSession) => CubeSessionManager.instance.activeSession!));
    } catch (e) {
      logErrorSwitchException(e);
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, CubeSession>> createGoogleAuthSession(Ref ref) async {
    final firebaseApp = ref.watch(firebaseInitProvider).requireValue!;
    try {
      final auth = ref.watch(firebaseAuthProvider(firebaseApp));

      var googleAuthIdToken = await auth.currentUser?.getIdToken();

      if (googleAuthIdToken == null) {
        return right(await createSession());
      }

      await authRepository.setSession(googleAuthIdToken);

      return right(await createSessionUsingSocialProvider(
              CubeProvider.FIREBASE_EMAIL,
              DefaultFirebaseOptions.currentPlatform.projectId,
              googleAuthIdToken)
          .then((cubeSession) => CubeSessionManager.instance.activeSession!));
    } catch (e) {
      logErrorSwitchException(e);
      return left(Failure.badRequest());
    }
  }

  @override
  Future<CubeFile?> getUploadingImageFuture(FilePickerResult result) async {
    final file = result.files.single;
    return await eitherCubeFile(file);
  }

  Future<CubeFile?> eitherCubeFile(PlatformFile file) async {
    if (kIsWeb) {
      final uploadFile = await uploadImageWeb(file);

      return uploadFile.toNullable();
    } else {
      final uploadFile = await uploadImageMobile(file);
      return uploadFile.toNullable();
    }
  }

  Future<Either<Failure, CubeFile>> uploadImageWeb(PlatformFile file) async {
    try {
      return right(await uploadRawFile(file.bytes!, file.name,
          isPublic: true,
          onProgress: (p) => developer.log('upload image file progress= $p')));
    } catch (e) {
      logErrorSwitchException(e);
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  Future<Either<Failure, CubeFile>> uploadImageMobile(PlatformFile file) async {
    try {
      return right(await uploadFile(File(file.path!),
          isPublic: true,
          onProgress: (p) => developer.log('upload image file progress= $p')));
    } catch (e) {
      logErrorSwitchException(e);
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }

  @override
  Either<Failure, AuthResponse> logErrorSwitchException(Object e) =>
      AuthErrorHandler.handleError(e);
}

final cubeRepositoryProvider = Provider.autoDispose<CubeRepository>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);

    return CubeRepository(authRepository);
  },
);
