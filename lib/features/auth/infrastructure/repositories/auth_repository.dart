import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../common/presentation/extensions/extensions.dart';


class  AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this.authTokenLocalDataSource, this.client);

  final AuthTokenLocalDataSource authTokenLocalDataSource;
  final supabase.GoTrueClient client;

  static const String _table = 'auth_users_table';

  final authClient = supabase.Supabase.instance.client;

  @override
  void authStateChange(void Function(UserModel? userEntity) callback) {
    authClient.auth.onAuthStateChange.listen((data) {
      final supabase.AuthChangeEvent event = data.event;
      final supabase.Session? session = data.session;

      switch (event) {
        case supabase.AuthChangeEvent.passwordRecovery:
          // TODO: Handle this case.
          break;
        case supabase.AuthChangeEvent.signedIn:
          callback(UserModel.fromJson(session!.user.toJson()));
          break;
        case supabase.AuthChangeEvent.signedOut:
          callback(null);
          break;
        case supabase.AuthChangeEvent.tokenRefreshed:
          var newSession = supabase.Session(
              accessToken: session!.accessToken,
              tokenType: session.tokenType,
              user: session.user);
          callback(UserModel.fromJson(newSession.user.toJson()));
          break;
        case supabase.AuthChangeEvent.userUpdated:
          callback(UserModel.fromJson(session!.user.toJson()));
          break;
        case supabase.AuthChangeEvent.userDeleted:
          callback(UserModel.fromJson(session!.user.toJson()));
          break;
        case supabase.AuthChangeEvent.mfaChallengeVerified:
          // TODO: Handle this case.
          break;
      }
    });
  }

  @override
  Future<Either<Failure, bool>> isOnLine() async {
    final myChannel = authClient.channel('base_de_test');

    if (myChannel.isClosed) return left(Failure.unauthorized());
    if (myChannel.isErrored) return left(Failure.unauthorized());
    if (myChannel.isLeaving) return left(Failure.unauthorized());

    if (myChannel.isJoining) {
      myChannel
          .on(
        supabase.RealtimeListenTypes.postgresChanges,
        supabase.ChannelFilter(
            event: '*',
            schema: 'public',
            table: 'chat'), (payload, [ref]) {
        developer.log('Change received: ${payload.toString()}');
      },)
          .on(supabase.RealtimeListenTypes.presence,
          supabase.ChannelFilter(event: 'sync'), (payload, [ref]) {
            final onlineUsers = myChannel.presenceState();
            developer.log('Change received: $onlineUsers && ${payload.toString()}');
          })
          .on(supabase.RealtimeListenTypes.presence,
          supabase.ChannelFilter(event: 'join'), (payload, [ref]) {
            developer.log('Change received: ${payload.toString()}');
          })
          .on(supabase.RealtimeListenTypes.presence,
          supabase.ChannelFilter(event: 'leave'), (payload, [ref]) {
            developer.log('Change received: ${payload.toString()}');
          })
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
  Future<Either<Failure, UserModel>> restoreSession() async  {
    final res = authTokenLocalDataSource.get();
    if (res.isLeft()) {
      return left(Failure.empty());
    }

    final response = await authClient.auth.recoverSession(res.getOrElse((_) => ''));
    final data = response.session;

    if (response.session != null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }
    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');
    return right(UserModel.fromJson(data!.user.toJson()));
  }

  @override
  Future<Either<Failure, UserModel>> setSession(String token) async {
    final response = await client.setSession(token);
    await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');

    final data = response.session;

    if (response.session != null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(UserModel.fromJson(data!.user.toJson()));
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    final res = await client.signInWithOAuth(
        supabase.Provider.google,
        redirectTo: 'io.supabase.flutter://reset-callback/'
    );
    if (!res) {
      developer.log('signInWithGoogle() error: $res');
      return left(Failure.badRequest());
    }
    developer.log('signInWithGoogle() success: $res');
    return right(true);
  }

  @override
  Future<Either<Failure, supabase.User>> signInWithPassword(
      String? email, String? password) async {
    developer.log('signInWithPassword()');

    final res = await client.signInWithPassword(
      email: email,
      password: password!,
    );

    await authTokenLocalDataSource
        .store(res.session?.persistSessionString ?? '');

    final supabase.Session? data = res.session;
    final supabase.User? user = res.user;

    if (data != null || user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(data!.user);
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    await authTokenLocalDataSource.remove();

    final res = await client
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
  Future<Either<Failure, UserModel>> signUp(
      String? email, String? name, String password) async {
    final response = await client.signUp(
      email: email,
      password: password,
      data: {'name': name},
      emailRedirectTo: kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
    );

    developer.log('reponse api signup: ${response.user}');

    if (response.user != null) {
      await authTokenLocalDataSource
        .store(response.session?.persistSessionString ?? '');
    }

    final supabase.Session? data = response.session;
    final supabase.User? user = response.user;
    final now = DateTimeX.current.toIso8601String();


    final UserEntityModel userEntityModel = UserEntityModel.create(
        name!,
        'role',
        false,
        DateTime.parse(user!.createdAt),
        DateTime.parse(user.updatedAt!),
        DateTime.parse(user.emailConfirmedAt!),
        DateTime.parse(user.phoneConfirmedAt!),
        DateTime.parse(user.lastSignInAt!)
    );

    await authClient
        .from('auth_users_table')
        .insert(userEntityModel);

    if (data != null) {
      await setSession(data.accessToken);
      await authTokenLocalDataSource.remove();
      await authClient
          .from('auth_users_table')
          .delete().match({'id': userEntityModel.id});

      return left(Failure.unauthorized());
    }

    return right(UserModel.fromJson(userEntityModel.toJson()));
  }

  @override
  Future<Either<Failure, supabase.AuthResponse>> verifyCode(String email, String code) async{
    final res = await client.verifyOTP(
        email: email,
        token: code,
        type: supabase.OtpType.signup
    );
    developer.log('reponse api verify code: $res');

    if (res.user != null) {
      await authTokenLocalDataSource.store(res.session?.tokenType ?? '');
    }

    final supabase.Session? session = res.session;
    final supabase.User? user = res.user;

    await client.signInWithOtp(
        email: res.user!.email,
        shouldCreateUser: true
    );

    if (session != null || user == null) {
      await authTokenLocalDataSource.remove();
      await authClient
          .from('auth_users_table')
          .delete().match({'id': user!.id});

      return left(Failure.unauthorized());
    }
    return right(supabase.AuthResponse(session: session, user: user));
  }

  @override
  Future<Either<Failure, UserEntityModel>> createUserEntityModel(UserName name) async {
    final now = DateTimeX.current.toIso8601String();
    
    final n = name.value.getOrElse((l) => '');
    
    final entity = UserEntityModel.create(
        n, 
        'role', 
        false, 
        DateTime.parse(now), 
        DateTime.parse(now), 
        DateTime.parse(now), 
        DateTime.parse(now), 
        DateTime.parse(now)
    );
    
    final res = await authClient
        .from(_table)
        .insert(entity.toJson());

    if (res.toEither) {
      return left(Failure.unauthorized());
    }

    return right(UserEntityModel.fromJson(res));
  }

}
