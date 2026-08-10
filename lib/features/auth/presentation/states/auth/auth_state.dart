import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  initial,
}

@Freezed(unionKey: 'status', unionValueCase: FreezedUnionCase.snake)
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.authenticated({
    required UserModel userEntity,
  }) = _AuthStateAuthenticated;

  const factory AuthState.unauthenticated() = _AuthStateUnauthenticated;

  const factory AuthState.initial() = _AuthStateInitial;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  AuthStatus get status => when(
    authenticated: (_) => AuthStatus.authenticated,
    unauthenticated: () => AuthStatus.unauthenticated,
    initial: () => AuthStatus.initial,
  );
}
