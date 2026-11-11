import 'dart:developer' as developer;
import 'dart:io';

import 'package:connectycube_sdk/connectycube_sdk.dart' as cc;
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../config/cube_config/cube_config.dart';
import '../../../../firebase_options.dart';
import '../../../auth/domain/providers/auth_repository_provider.dart';
import '../../data/data_sources/local/pref_util.dart';
import '../../domain/repository/cube_repository_interface.dart';

class CubeRepository implements CubeRepositoryInterface {
  CubeRepository(this.authRepository, this.auth);

  final AuthRepository authRepository;
  final FirebaseAuth auth;

  @override
  Future<Either<Failure, cc.CubeSession>> createGuestUserSession(
    bool isGuest,
    String fullName,
  ) async {
    try {
      final session = await cc.createSession();
      return right(session);
    } catch (e) {
      return left(Failure.serverError());
    }
  }

  @override
  Future<cc.CubeUser>? setSession(String token) async {
    var idToken = await authRepository.setSession(token);
    await cc.createSession();
    final session = await cc.createSessionUsingFirebaseEmail(
      DefaultFirebaseOptions.currentPlatform.projectId,
      idToken.toString(),
    );
    final cubeUser = session.user ?? cc.CubeUser();
    final sharedPrefs = await SharedPrefs.instance.init();
    sharedPrefs.saveNewUser(cubeUser, LoginType.login);
    return cubeUser;
  }

  @override
  Future<Either<Failure, cc.CubeSession>> createUserSession(
    String login,
    String password,
  ) async {
    try {
      final session = await cc.createSession(
        cc.CubeUser(login: login, password: password),
      );
      final activeSession =
          cc.CubeSessionManager.instance.activeSession ?? session;
      return right(activeSession);
    } catch (e) {
      return left(Failure.badRequest());
    }
  }

  @override
  Future<cc.CubeSession> restoreSession() async {
    final session = await cc.createSession();
    return session;
  }

  @override
  Future<Either<Failure, cc.CubeUser>> signUp(cc.CubeUser user) async {
    try {
      await cc.createSession(user);
      final newUser = await cc.signUp(user);
      return right(newUser);
    } catch (e) {
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, cc.CubeUser>> signIn(cc.CubeUser user) async {
    try {
      final session = await cc.createSession(user);
      return right(session.user ?? user);
    } catch (e) {
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithSocialProviders(
    String socialProvider,
    String accessToken,
    String accessTokenSecret,
  ) async {
    try {
      await cc.createSessionUsingSocialProvider(
        socialProvider,
        accessToken,
        accessTokenSecret,
      );
      return right(true);
    } catch (e) {
      return left(Failure.badRequest());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await cc.deleteSession();
      final sharedPrefs = await SharedPrefs.instance.init();
      await sharedPrefs.deleteUser();
      return right(true);
    } catch (e) {
      return left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, cc.CubeSession>> updateUserSession(
    String something,
    String password,
  ) async {
    try {
      final session = await cc.createSession(
        cc.CubeUser(login: something, password: password),
      );
      return right(session);
    } catch (e) {
      return left(Failure.badRequest());
    }
  }

  @override
  Future<cc.CubeFile> getUploadingImageFuture(FilePickerResult result) async {
    final file = result.files.single;
    if (kIsWeb) {
      final bytes = file.bytes;
      if (bytes == null) {
        throw StateError('Aucun octet de fichier disponible pour le web');
      }
      return cc.uploadRawFile(
        bytes,
        file.name,
        isPublic: true,
        onProgress: (progress) {
          developer.log("uploadImageFile progress= $progress");
        },
      );
    } else {
      final path = file.path;
      if (path == null) {
        throw StateError('Aucun chemin de fichier disponible');
      }
      return cc.uploadFile(
        File(path),
        isPublic: true,
        onProgress: (progress) {
          developer.log("uploadImageFile progress= $progress");
        },
      );
    }
  }

  void refreshBadgeCount() {
    cc.getUnreadMessagesCount().then((value) {
      developer.log("Unread messages count: ${value['total']}");
    });
  }

  @override
  Future<cc.CubeSession> createPhoneAuthSession() async {
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      throw StateError('Aucun utilisateur Firebase connecté');
    }

    final phoneAuthIdToken = await currentUser.getIdToken();

    if (phoneAuthIdToken == null || phoneAuthIdToken.isEmpty) {
      final accessToken = currentUser.refreshToken;
      if (accessToken == null || accessToken.isEmpty) {
        throw StateError('Aucun token d\'accès Firebase disponible pour Cube');
      }

      await cc.createSessionUsingFirebaseEmail(
        DefaultFirebaseOptions.currentPlatform.projectId,
        accessToken,
      );
    } else {
      await cc.createSessionUsingFirebasePhone(
        DefaultFirebaseOptions.currentPlatform.projectId,
        phoneAuthIdToken,
      );
    }

    final session = cc.CubeSessionManager.instance.activeSession;
    if (session == null) {
      throw StateError('Session Cube non créée');
    }
    return session;
  }
}

final cubeRepositoryProvider = Provider.autoDispose<CubeRepository>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  final auth = ref.read(firebaseAuthProvider);

  return CubeRepository(authRepository, auth);
});
