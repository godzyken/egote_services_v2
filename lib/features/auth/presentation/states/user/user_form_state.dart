import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_properties/properties_extensions.dart';

part 'user_form_state.freezed.dart';
part 'user_form_state.g.dart';

@freezed
class UserFormState with _$UserFormState {
  const factory UserFormState(
  UserEntityModel userEntityModel,{
        @JsonKey(
          defaultValue: 'UserName',
          includeToJson: false,
          includeFromJson: false,
        ) NameFormz? nameFormz,
        @JsonKey(
          defaultValue: 'UserRole',
          includeToJson: false,
          includeFromJson: false,
        ) RoleFormz? roleFormz
  }) = _UserFormState;



  factory UserFormState.fromJson(Map<String, dynamic> json) =>
      _$UserFormStateFromJson(json);
}