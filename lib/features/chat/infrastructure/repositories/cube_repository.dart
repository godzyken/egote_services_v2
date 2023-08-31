import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/chat/data/data_sources/local/pref_util.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:egote_services_v2/firebase_options.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:universal_io/io.dart';

import '../../../../config/app_shared/extensions/extensions.dart';
import '../../../../config/cube_config/cube_config.dart';
import '../../../auth/domain/providers/auth_repository_provider.dart';
import '../../domain/repository/cube_repository_interface.dart';

class CubeRepository implements CubeRepositoryInterface {
  CubeRepository(this.authRepository, this.auth);

  final AuthRepository authRepository;
  final FirebaseAuth auth;

  @override
  Future<Either<Failure, CubeSession>> createGuestUserSession(
      bool isGuest, String fullName) {
    // TODO: implement createGuestUserSession
    throw UnimplementedError();
  }

  @override
  Future<CubeUser>? setSession(String token) async {
    var idToken = await authRepository.setSession(token);
    return createSession().then((cubeSession) {
      return signInUsingFirebaseEmail(
              DefaultFirebaseOptions.currentPlatform.projectId,
              idToken.toString())
          .then((cubeUser) {
        return SharedPrefs.instance.init().then((sharedPrefs) {
          sharedPrefs.saveNewUser(cubeUser, LoginType.login);
          return cubeUser
            ..password = CubeSessionManager.instance.activeSession?.token;
        });
      });
    });
  }

  @override
  Future<Either<Failure, CubeSession>> createUserSession(
      String login, String password) async {
    return createSession().then((value) {
      return signInByLogin(login, password).then((value) {
        return right(CubeSessionManager.instance.activeSession!);
      });
    }, onError: left(Failure.badRequest()));
  }

  @override
  Future<CubeSession> restoreSession() {
    // TODO: implement restoreSession
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signInWithSocialProviders(
      String socialProvider, String accessToken, String accessTokenSecret) {
    // TODO: implement signInWithSocialProviders
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CubeSession>> updateUserSession(
      String something, String password) {
    // TODO: implement updateUserSession
    throw UnimplementedError();
  }

  @override
  Future<CubeFile> getUploadingImageFuture(FilePickerResult result) async {
    // there possible to upload the file as an array of bytes,
    // but here showed two ways just as an example
    if (kIsWeb) {
      return uploadRawFile(result.files.single.bytes!, result.files.single.name,
          isPublic: true, onProgress: (progress) {
        log("uploadImageFile progress= $progress");
      });
    } else {
      return uploadFile(File(result.files.single.path!), isPublic: true,
          onProgress: (progress) {
        log("uploadImageFile progress= $progress");
      });
    }
  }

  refreshBadgeCount() {
    getUnreadMessagesCount().then((value) => updateBadgeCount(value['total']));
  }

  @override
  Future<CubeSession> createPhoneAuthSession() async {
    var phoneAuthIdToken = await auth.currentUser?.getIdToken();

    if (phoneAuthIdToken == null) {
      var accessToken = auth.currentUser!.refreshToken;
      return createSessionUsingFirebaseEmail(
              DefaultFirebaseOptions.currentPlatform.projectId,
              accessToken!)
          .then((cubeSession) {
        return CubeSessionManager.instance.activeSession!;
      });
    }

    return createSessionUsingFirebasePhone(
            DefaultFirebaseOptions.currentPlatform.projectId, phoneAuthIdToken)
        .then(
            (cubeSession) => CubeSessionManager.instance.activeSession!);
  }
}

final cubeRepositoryProvider = Provider.autoDispose<CubeRepository>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    final auth = ref.read(firebaseAuthProvider);

    return CubeRepository(authRepository, auth);
  },
);
