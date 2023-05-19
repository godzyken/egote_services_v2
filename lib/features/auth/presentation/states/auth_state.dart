import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@FreezedUnionValue('status')
@JsonEnum(fieldRename: FieldRename.snake, valueField: 'status')
enum AuthStatus {
  @JsonValue("authenticated")
  authenticated,
  @JsonValue("unauthenticated")
  unauthenticated,
}

@freezed
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class AuthState with _$AuthState {
  const factory AuthState.authenticated({
    @JsonKey(defaultValue: 'AuthStatus', includeFromJson: true, includeToJson: true, unknownEnumValue: AuthStatus.unauthenticated)
        required AuthStatus status,
    @JsonKey(
      defaultValue: 'UserEntity',
      includeToJson: true,
      includeFromJson: true,
    )
        required UserEntityModel userEntity,
  }) = _$AuthStateTrue;

  const factory AuthState.unauthenticated({
    @JsonKey(
      defaultValue: 'AuthStatus',
      includeFromJson: true,
      includeToJson: true,
    )
        required AuthStatus status,
  }) = _$AuthStateFalse;

  const factory AuthState() = _AuthState;
}
