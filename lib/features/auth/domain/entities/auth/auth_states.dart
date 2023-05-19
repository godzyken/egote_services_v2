import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_states.freezed.dart';
part 'auth_states.g.dart';

@JsonEnum()
enum AuthStatus {
  @JsonValue("authenticated")
  authenticated,
  @JsonValue("unauthenticated")
  unauthenticated,
}

@freezed
class AuthStates with _$AuthStates {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory AuthStates.authenticated({
    @JsonKey(
      defaultValue: 'AuthStatus',
      includeFromJson: false,
      includeToJson: false,
    )
        AuthStatus? status,
    @JsonKey(
      defaultValue: 'AuthUser',
      includeToJson: false,
      includeFromJson: false,
    )
        AuthUser? user,
  }) = _AuthStatesAuthenticated;

  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory AuthStates.unauthenticated({
    @JsonKey(
      defaultValue: 'AuthStatus',
      includeFromJson: false,
      includeToJson: false,
    )
        AuthStatus? status,
  }) = _AuthStatesUnauthenticated;
}
