import 'dart:developer' as developer;

// import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:egote_services_v2/features/auth/data/data_sources/local/auth_token_local_data_source.dart';
import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';
import 'package:egote_services_v2/features/auth/domain/repository/auth_repository_interface.dart';
import 'package:egote_services_v2/features/common/domain/failures/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../chat/domain/models/entities/cube_user/cube_user_mig.dart';
import '../../../common/presentation/extensions/extensions.dart';

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this.authTokenLocalDataSource, this.client, this.type);

  final AuthTokenLocalDataSource authTokenLocalDataSource;
  final supabase.GoTrueClient client;

  static const String _table = 'auth_users_table';

  final authClient = supabase.Supabase.instance.client;

  final supabase.GenerateLinkType type;

  final cuberUserModel = const CubeUserMig();

  final realTimeChanelConfig =
      const supabase.RealtimeChannelConfig(key: '', self: true, ack: true);

  @override
  void authStateChange(void Function(UserModel? userEntity) callback) {
    // TODO: implement authStateChange
  }

  @override
  Future<Either<Failure, bool>> isOnLine() async {
    final myChannel = authClient
        .channel('base_de_test', opts: realTimeChanelConfig)
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'chat',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'room_id',
              value: 200,
            ),
            callback: (payload, [ref]) {
              developer.log('Change received: ${payload.toString()}');
            })
        .subscribe((status, [_]) async {
      switch (status) {
        case RealtimeSubscribeStatus.subscribed:
        // TODO: Handle this case.
        case RealtimeSubscribeStatus.channelError:
        // TODO: Handle this case.
        case RealtimeSubscribeStatus.closed:
        // TODO: Handle this case.
        case RealtimeSubscribeStatus.timedOut:
        // TODO: Handle this case.
      }
    });

    if (!myChannel.presence.inPendingSyncState()) {
      myChannel.onPostgresChanges(
          event: PostgresChangeEvent.delete,
          schema: 'public',
          callback: (payload) {
            developer.log('channel delete payload: ${payload.toString()}');
          });

      myChannel.onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          callback: (payload) {
            developer.log('channel insert payload: ${payload.toString()}');
          });

      developer.log('isOnline(): $myChannel');
      return await myChannel
          .track({'online_at': DateTime.now().toIso8601String()}).then(
              (res) async {
        switch (res) {
          case ChannelResponse.ok:
            return right(true);
          case ChannelResponse.timedOut:
            return left(Failure.unprocessableEntity(
                message: 'Channel connection! Time Out!:$res'));
          case ChannelResponse.rateLimited:
            return left(Failure.empty());
          case ChannelResponse.error:
            return left(Failure.badRequest());
        }
      }, onError: (error) => left(Failure.badRequest()));
    }

    return right(true);
  }

  @override
  Future<Either<Failure, UserModel>> restoreSession() async {
    final res = authTokenLocalDataSource.get();
    if (res.isLeft()) {
      return left(Failure.empty());
    }

    final response = await authClient.auth.refreshSession();
    final data = response.session;

    if (data != null || response.user == null) {
      await authTokenLocalDataSource.remove();

      return left(Failure.unauthorized());
    }
    await authTokenLocalDataSource.store(data!.providerRefreshToken ?? '');
    return right(UserModel.fromJson(data.user.toJson()));
  }

  @override
  Future<Either<Failure, UserModel>> setSession(String token) async {
    final response = await client.setSession(token);
    await authTokenLocalDataSource
        .store(response.session?.providerRefreshToken ?? '');

    final data = response.session;

    if (response.session != null || response.user == null) {
      await authTokenLocalDataSource.remove();
      return left(Failure.unauthorized());
    }

    return right(UserModel.fromJson(data!.user.toJson()));
  }

  @override
  Future<Either<Failure, bool>> signInWithGoogle() async {
    final res = await client.signInWithOAuth(supabase.OAuthProvider.google,
        redirectTo: 'io.supabase.flutter://reset-callback/');
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
    developer.log(
        'signInWithPassword response : ${res.session!.toJson()}\n ${res.user!.toJson()}');
    await authTokenLocalDataSource
        .store(res.session?.providerRefreshToken ?? '');

    final supabase.Session? session = res.session;
    final supabase.User? user = res.user;

    do {
      await authTokenLocalDataSource.remove();
      left(Failure.unauthorized());
    } while (session != null && user == null);

    return right(session!.user);
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    await authTokenLocalDataSource.remove();

    final res = await client
        .signOut()
        .then((value) => true, onError: left(Failure.badRequest()).call);
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
      //emailRedirectTo: kIsWeb ? https://qrco.de/be782E : 'https://www.godzy.egote-services-v2/signup/enroll',
      emailRedirectTo:
          kIsWeb ? null : 'com.godzy.egote-services-v2://callback/enroll',
    );

    developer.log('reponse api signup: ${response.user}');

    if (response.user != null) {
      await authTokenLocalDataSource
          .store(response.session?.providerRefreshToken ?? '');
    }

    final supabase.Session? data = response.session;
    final supabase.User? user = response.user;

    final createdAt = DateTime.parse(user!.createdAt);
    final updatedAt = DateTime.parse(user.updatedAt!);
    final emailConfirmedAt = DateTime.parse(user.emailConfirmedAt!);
    final phoneConfirmedAt = DateTime.parse(user.phoneConfirmedAt!);
    final lastSignInAt = DateTime.parse(user.lastSignInAt!);

    final UserEntityModel userEntityModel = UserEntityModel.create(
      name!,
      user.role!,
      false,
      createdAt,
      updatedAt,
      emailConfirmedAt,
      phoneConfirmedAt,
      lastSignInAt,
    );

    await authClient.from('auth_users_table').insert(userEntityModel);

    if (data != null) {
      await setSession(data.accessToken);
      await authTokenLocalDataSource.remove();
      await authClient
          .from('auth_users_table')
          .delete()
          .match({'id': userEntityModel.id});
    } else {
      return left(Failure.unauthorized());
    }

    return right(UserModel.fromJson(userEntityModel.toJson()));
  }

  @override
  Future<Either<Failure, supabase.AuthResponse>> verifyCode(
      String email, String code) async {
    final res = await client.verifyOTP(
        email: email, token: code, type: supabase.OtpType.signup);
    developer.log('response api verify code: $res');

    if (res.user != null) {
      await authTokenLocalDataSource.store(res.session?.tokenType ?? '');
    }

    final supabase.Session? session = res.session;
    final supabase.User? user = res.user;

    await client.signInWithOtp(email: res.user!.email, shouldCreateUser: true);

    if (session != null || user == null) {
      await authTokenLocalDataSource.remove();
      await authClient
          .from('auth_users_table')
          .delete()
          .match({'id': user!.id});

      return left(Failure.unauthorized());
    }
    return right(supabase.AuthResponse(session: session, user: user));
  }

  @override
  Future<Either<Failure, UserEntityModel>> createUserEntityModel(
      UserName name) async {
    try {
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
          DateTime.parse(now));

      final res =
          await authClient.from(_table).insert(entity.toJson()).select();

      return right(UserEntityModel.fromJson(convertChangeData(res, {})));
    } on supabase.AuthException catch (e) {
      int? statusCode = int.tryParse(e.statusCode!);

      developer.ServiceExtensionResponse.error(statusCode!, e.message);
      return left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, CubeUserMig>> cubeUserStateChange(
      void Function(CubeUserMig? cubeUser) cubeUserCallBack) async {
    try {
      switch (type) {
        case GenerateLinkType.signup:
          final res = await authClient.auth.admin.generateLink(
              type: type,
              email: cuberUserModel.email!,
              password: cuberUserModel.password);

          final actionLink = res.properties.actionLink;

          cubeUserCallBack(CubeUserMig(
              avatar: cuberUserModel.avatar ?? actionLink,
              customData: cuberUserModel.customData ?? actionLink,
              customDataClass: cuberUserModel.customDataClass ?? actionLink,
              email: cuberUserModel.email ?? actionLink,
              facebookId: cuberUserModel.facebookId ?? actionLink,
              id: int.tryParse(authClient.auth.currentUser!.id),
              fullName: cuberUserModel.fullName ?? actionLink,
              isGuest: cuberUserModel.isGuest,
              login: cuberUserModel.login ?? actionLink,
              oldPassword: cuberUserModel.oldPassword ?? actionLink,
              password: cuberUserModel.password ?? actionLink,
              phone: cuberUserModel.phone ?? actionLink,
              tags: cuberUserModel.tags,
              timeZone: cuberUserModel.timeZone,
              website: cuberUserModel.website ?? actionLink,
              twitterId: cuberUserModel.twitterId ?? actionLink,
              externalId: int.tryParse(authClient.auth.currentUser!.id)));
        case GenerateLinkType.invite:
        // TODO: Handle this case.
        case GenerateLinkType.magiclink:
        // TODO: Handle this case.
        case GenerateLinkType.recovery:
        // TODO: Handle this case.
        case GenerateLinkType.emailChangeCurrent:
          // TODO: Handle this case.
          final UserResponse res = await authClient.auth.admin.updateUserById(
              cuberUserModel.id.toString(),
              attributes: AdminUserAttributes(
                  email: cuberUserModel.email, emailConfirm: true));

          final user = authClient
              .from('auth_users_table')
              .stream(primaryKey: ['id']).listen((event) {
            final data = event;

            data.first.difference(Eq.eqString, res.user!.toJson());
          });

          while (user.isPaused) {
            await Future.delayed(
                const Duration(seconds: 30), () => {user.pause()});
          }

          user.resume();

          user.asFuture(res.user);

          cubeUserCallBack(cuberUserModel);

          return right(cuberUserModel);
        case GenerateLinkType.emailChangeNew:
        // TODO: Handle this case.
        case GenerateLinkType.unknown:
        // TODO: Handle this case.
      }

      return right(CubeUserMig(
        email: cuberUserModel.email,
      ));
    } catch (e) {
      developer.log(e.toString());
      return left(Failure.unprocessableEntity(message: e.toString()));
    }
  }
}
