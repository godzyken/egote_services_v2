import 'dart:async';
import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:egote_services_v2/features/auth/domain/service/user_service.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:egote_services_v2/features/auth/infrastructure/repositories/list_generate_link_type_provider.dart';
import 'package:egote_services_v2/features/auth/presentation/controller/user_notifier.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/providers/user_service_provider.dart';

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  AuthController(this._repository) : super(const AsyncValue.loading()) {
    _initialize();
  }

  final AuthRepository _repository;

  // Méthode pour mettre à jour l'état
  void _updateState(AsyncValue<UserModel?> newState) {
    state = newState;
    _updateAuthState();
  }

  // Centralisation de la gestion des erreurs
  void _logError(dynamic e, {StackTrace? stackTrace}) {
    String errorMessage = e is AuthException
        ? 'AuthException code: ${e.code}\nRuntime Type: ${e.runtimeType}\nStatus code: ${e.statusCode}\nError message: ${e.message}'
        : 'Error: $e';
    developer.log(errorMessage, stackTrace: stackTrace);
  }

  // Initialisation du contrôleur
  Future<void> _initialize() async {
    _updateState(const AsyncValue.loading());

    try {
      final res = await _repository.client.refreshSession();
      _updateState(AsyncValue.data(UserModel.fromJson(res.user!.toJson())));

      await _handleInitialDeepLink();

      _repository.authStateChange((userEntity) {
        _updateState(AsyncValue.data(userEntity));
      });
    } catch (e) {
      _handleError(e);
    }
  }

  // Gestion des erreurs lors de l'initialisation
  void _handleError(dynamic e) {
    if (e is AuthException) {
      _logError(e, stackTrace: StackTrace.fromString(e.message));
      _updateState(AsyncValue.error(e, StackTrace.fromString(e.message)));
    } else {
      _logError(e);
      _updateState(AsyncValue.error(e, StackTrace.fromString(e.toString())));
    }
  }

  // Mise à jour de l'état d'authentification
  void _updateAuthState() {
    authStateListenable.value = state.hasValue;
  }

  // Gestion du lien profond initial
  Future<void> _handleInitialDeepLink() async {
    try {
      _updateState(const AsyncValue.loading());

      final initialLink =
          await getInitialLink(state.requireValue?.userEntityModel.name);

      if (state.isRefreshing && initialLink!.contains('refresh_token')) {
        final refreshToken = _extractRefreshToken(initialLink);
        if (refreshToken == null) return;

        final res = await _repository.client.setSession(refreshToken);
        _updateState(AsyncValue.data(UserModel.fromJson(res.user!.toJson())));
      }
    } on PlatformException catch (e) {
      _logError(e, stackTrace: StackTrace.fromString(e.details));
      _updateState(AsyncValue.error(UserModel.fromJson(e.details),
          StackTrace.fromString(e.message.toString())));
    }
  }

  // Extraction du refresh token à partir du lien
  String? _extractRefreshToken(String? link) {
    if (link == null) return null;
    final refreshTokenQueryParams = link.split('&').firstWhere(
          (element) => element.contains('refresh_token'),
          orElse: () => '',
        );
    return refreshTokenQueryParams.isNotEmpty
        ? refreshTokenQueryParams
            .substring(refreshTokenQueryParams.indexOf('=') + 1)
        : null;
  }

  // Déconnexion
  Future<void> signOut() async {
    await _repository.signOut();
  }

  // Création d'un nouvel utilisateur
  Future<void> handle(UserName name) async {
    _updateState(const AsyncValue.loading());

    try {
      final res = await _repository.createUserEntityModel(name);
      state = res.fold(
        (l) => AsyncValue.error(l.error, StackTrace.fromString(l.toString())),
        (r) => AsyncValue.data(UserModel.fromJson(r.toJson())),
      );
    } catch (e) {
      _handleError(e);
    }
  }

  // Récupération du lien initial et gestion du token
  Future<String?> getInitialLink(String? refreshToken) async {
    final res = await _repository.client.setSession(refreshToken!);
    if (res.session!.isExpired) return res.session?.providerRefreshToken;

    if (state.isRefreshing || state.asData!.hasValue) {
      if (state.asData?.value?.userEntityModel.id.toString() ==
          res.session?.user.id) {
        return res.session?.accessToken;
      }
      return res.session?.refreshToken;
    }
    return res.session?.providerToken;
  }
}

class AutoAuthController extends StateNotifier<UserModel?> {
  AutoAuthController(this._ref) : super(null) {
    _initialize();
  }

  final Ref _ref;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _docSub;

  AuthRepository? get _repository => _ref.read(authRepositoryProvider);
  FirebaseFirestore get _firestore => _ref.watch(firebaseFirestoreProvider);

  late final CubeUser? _cubeUser;
  DocumentReference<Map<String, dynamic>> get _userDoc =>
      _firestore.doc('auth_users_table');

  // Méthode pour initialiser et gérer l'authentification
  Future<void> _initialize() async {
    final res = await _repository!.restoreSession();
    _subscribeToUserDoc(res);

    if (state == null) {
      await Future.delayed(const Duration(seconds: 3));
      await _handleInitialDeepLink();
    }
    await createCubeUser;
    updateStateUser();
  }

  void performAction() {
    final action = FirebaseAuthService();

    // Use ProviderFactory to execute the action
    userServiceProvider
        .overrideWithValue(action); // Replacing the deprecated approach
  }

  void updateStateUser() {
    _repository?.authStateChange(_updateState);
    _repository?.cubeUserStateChange(
        _ref.watch(generateLinkTypeNotifierProvider),
        _cubeUser!,
        _updateCubeUserState);
  }

  Future<void> get createCubeUser async {
    _cubeUser =
        await _ref.watch(userServiceProvider).createCubeUserFromFirebase();
  }

  // Abonnement aux changements de données utilisateur dans Firestore
  void _subscribeToUserDoc(Either<Failure, UserModel?>? res) {
    _docSub = _userDoc.snapshots().listen((snapshot) {
      if (res != null) {
        res.fold(
          (l) {
            _logUserDataError(l);
            state = null;
          },
          (userModel) {
            _handleUserDataUpdate(userModel!);
          },
        );
      }
      _updateAuthState();
    });
  }

  // Gestion des erreurs lors de la mise à jour des données utilisateur
  void _logUserDataError(dynamic error) {
    developer.log("User Data register error: $error");
  }

  // Mise à jour des données utilisateur dans Firestore
  void _handleUserDataUpdate(UserModel userModel) {
    try {
      _userDoc.set(userModel.toJson(), SetOptions(merge: true));
      developer.log(
          "User Data register successfully: ${userModel.id} in ${_userDoc.path}");
    } on FirebaseException catch (e) {
      _logError(e, stackTrace: e.stackTrace);
    }
    state = userModel;
  }

  // Met à jour l'état de l'utilisateur
  void _updateState(UserModel? newState) {
    state = newState;
    _updateAuthState();
  }

  // Met à jour l'état de l'utilisateur Cube
  void _updateCubeUserState(CubeUser? cubeUser) {
    state = UserModel.complete(
      id: UserId(value: cubeUser!.id!),
      userEntityModel: _ref.watch(userNotifierProvider),
    );
  }

  // Gestion des erreurs Firebase
  void _logError(FirebaseException e, {StackTrace? stackTrace}) {
    developer.log(
        'AuthException Plugin: ${e.plugin}\nRuntime Type: ${e.runtimeType}\nCode: ${e.code}\nAutoAuthController error message: ${e.message}',
        stackTrace: StackTrace.fromString('${e.stackTrace}'));
  }

  // Gestion des erreurs PlatformException
  void _logPlatformError(PlatformException e, {StackTrace? stackTrace}) {
    developer.log(
        'PlatformException AuthException code: ${e.code}\nRuntime Type: ${e.runtimeType}\nDetails: ${e.details}\nAutoAuthController error message: ${e.message}',
        stackTrace: stackTrace);
  }

  // Gestion du lien profond pour récupérer un token de rafraîchissement
  Future<void> _handleInitialDeepLink() async {
    if (state == null) return _updateState(null);

    _updateState(UserModel.unComplete(
        id: const UserId(value: 0), userEntityModel: UserEntityModel.empty()));

    try {
      final initialLink = await getInitialLink(state?.userEntityModel.name);
      if (initialLink?.contains('refresh_token') != true) return;

      final refreshToken = _getRefreshTokenFromLink(initialLink);
      if (refreshToken == null) return;

      final res = await _repository?.client.setSession(refreshToken);
      _updateState(UserModel.fromJson(res!.user!.toJson()));
    } on PlatformException catch (e) {
      _logPlatformError(e, stackTrace: StackTrace.fromString(e.details));
      _updateState(UserModel.fromJson(e.details));
    }
  }

  // Extraction du token de rafraîchissement à partir du lien
  String? _getRefreshTokenFromLink(String? initialLink) {
    final refreshTokenQueryParams = initialLink
        ?.split('&')
        .firstWhere((element) => element.contains('refresh_token'));
    return refreshTokenQueryParams
        ?.substring(refreshTokenQueryParams.indexOf('=') + 1);
  }

  // Connexion de l'utilisateur
  Future<void> signOut() async {
    await _repository?.signOut();
  }

  // Fonction pour obtenir le lien initial
  Future<String?> getInitialLink(String? refreshToken) async {
    final res = await _repository?.client.setSession(refreshToken!);
    return res?.session?.refreshToken;
  }

  // Mise à jour de l'état d'authentification
  void _updateAuthState() {
    authStateListenable.value = state != null;
  }

  // Annulation de l'abonnement à Firestore lors de la destruction
  @override
  void dispose() {
    _docSub?.cancel();
    super.dispose();
  }
}
