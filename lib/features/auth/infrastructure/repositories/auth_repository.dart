import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this.authTokenLocalDataSource, this.authClient);

  final AuthTokenLocalDataSource authTokenLocalDataSource;
  final supabase.GoTrueClient authClient;

  UserEntityModel? get currentUser => authClient.currentUser == null
      ? null
      : UserEntityModel.fromJson(authClient.currentUser!.toJson());

  Stream<supabase.AuthUser?>? get user => null;

  @override
  void authStateChange(void Function(UserEntityModel? userEntity) callback) {
    authClient.onAuthStateChange.listen((data) {
      final supabase.AuthChangeEvent event = data.event;
      final supabase.Session? session = data.session;

      switch (event) {
        case supabase.AuthChangeEvent.passwordRecovery:
          // TODO: Handle this case.
          break;
        case supabase.AuthChangeEvent.signedIn:
          callback(UserEntityModel.fromJson(session!.user.toJson()));
          break;
        case supabase.AuthChangeEvent.signedOut:
          callback(null);
          break;
        case supabase.AuthChangeEvent.tokenRefreshed:
          var newSession = supabase.Session(
              accessToken: session!.accessToken,
              tokenType: session.tokenType,
              user: session.user);
          callback(UserEntityModel.fromJson(newSession.user.toJson()));
          break;
        case supabase.AuthChangeEvent.userUpdated:
          callback(UserEntityModel.fromJson(session!.user.toJson()));
          break;
        case supabase.AuthChangeEvent.userDeleted:
          callback(UserEntityModel.fromJson(session!.user.toJson()));
          break;
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          // TODO: Handle this case.
          break;
      }
    });
  }

  @override
  Future<Either<Failure, bool>> isOnLine() async {
    final myChannel = supabase.Supabase.instance.client.channel('base_de_test');

    if (myChannel.isClosed) return left(Failure.unauthorized());
    if (myChannel.isErrored) return left(Failure.unauthorized());
    if (myChannel.isLeaving) return left(Failure.unauthorized());

    if (myChannel.isJoining) {
      myChannel
          .on(supabase.RealtimeListenTypes.presence,
              supabase.ChannelFilter(event: 'sync'), (payload, [ref]) {
            final onlineUsers = myChannel.presenceState();
          })
          .on(supabase.RealtimeListenTypes.presence,
              supabase.ChannelFilter(event: 'join'), (payload, [ref]) {})
          .on(supabase.RealtimeListenTypes.presence,
              supabase.ChannelFilter(event: 'leave'), (payload, [ref]) {})
          .subscribe(((status, [_]) async {
            if (status == 'SUBSCRIBED') {
              final status = await myChannel
                  .track({'online_at': DateTime.now().toIso8601String()});
              switch (status) {
                case supabase.ChannelResponse.ok:
                  isOnLine();
                  break;
                case supabase.ChannelResponse.timedOut:
                  // TODO: Handle this case.
                  break;
                case supabase.ChannelResponse.rateLimited:
                // TODO: Handle this case.
              }
            }
          }));

      return right(true);
    }

    return left(Failure.empty());
  }

  @override
  Future<Either<Failure, UserEntityModel>> restoreSession() async {
    final res = authTokenLocalDataSource.get();
    if (res.isLeft()) {
      return left(Failure.empty());
    }

    final response = await authClient.recoverSession(res.getOrElse((_) => ''));
    final data = response.session;

    if (response.session != null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }
    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');
    return right(UserEntityModel.fromJson(data!.user.toJson()));
  }

  @override
  Future<Either<Failure, UserEntityModel>> setSession(String token) async {
    final response = await authClient.setSession(token);
    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');

    final data = response.session;

    if (response.session != null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(UserEntityModel.fromJson(data!.user.toJson()));
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    final res = await authClient.signInWithOAuth(
      supabase.Provider.google,
    );
    if (!res) {
      developer.log('signInWithGoogle() error: $res');
      return left(Failure.badRequest());
    }
    developer.log('signInWithGoogle() success: $res');
    return right(true);
  }

  @override
  Future<Either<Failure, UserEntityModel>> signInWithPassword(
      String? email, String? password) async {
    developer.log('signInWithPassword()');
    final res = await authClient.signInWithPassword(
      email: email,
      password: password!,
    );

    await authTokenLocalDataSource
        .store(res.session?.persistSessionString ?? '');

    final data = res.session;

    if (res.session != null || res.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(UserEntityModel.fromJson(data!.user.toJson()));
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    await authTokenLocalDataSource.remove();

    final res = await authClient
        .signOut()
        .then((value) => true, onError: left(Failure.badRequest()));
    if (!res) {
      return left(Failure.badRequest());
    }
    return right(true);
  }

  /// Type: Future<AuthResponse> Function({
  ///   String? [captchaToken],
  ///   Map<String, dynamic>? [data],
  ///   String? [email],
  ///   String? [emailRedirectTo],
  ///   required String [password],
  ///   String? [phone],
  @override
  Future<Either<Failure, UserEntityModel>> signUp(
      String? email, String? username, String? password) async {
    final response = await authClient.signUp(
      email: email,
      password: password!,
      data: {'username': username},
    );

    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');

    final data = response.session;

    if (response.session != null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(UserEntityModel.fromJson(data!.user.toJson()));
  }
}
