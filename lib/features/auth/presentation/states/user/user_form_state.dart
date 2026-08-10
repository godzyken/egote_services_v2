import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_properties/properties_extensions.dart';

part 'user_form_state.freezed.dart';
part 'user_form_state.g.dart';

@freezed
abstract class UserFormState with _$UserFormState {
  const UserFormState._();
  const factory UserFormState({
    required UserEntityModel userEntityModel,
    @JsonKey(includeToJson: false, includeFromJson: false) 
    NameFormz? nameFormz,
    @JsonKey(includeToJson: false, includeFromJson: false) 
    RoleFormz? roleFormz,
  }) = _UserFormState;

  factory UserFormState.fromJson(Map<String, dynamic> json) =>
      _$UserFormStateFromJson(json);
}
