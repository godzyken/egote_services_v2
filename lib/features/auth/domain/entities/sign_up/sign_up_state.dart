import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_properties/properties_extensions.dart';

part 'sign_up_state.freezed.dart';
part 'sign_up_state.g.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @JsonKey(
      defaultValue: 'NameFormz',
      includeToJson: false,
      includeFromJson: false,
    )
    NameFormz? nameFormz,
    @JsonKey(
      defaultValue: 'EmailFormz',
      includeFromJson: false,
      includeToJson: false,
    )
    EmailFormz? emailFormz,
    @JsonKey(
      defaultValue: 'PasswordFormz',
      includeFromJson: false,
      includeToJson: false,
    )
    PasswordFormz? passwordFormz,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus? status,
    String? errorMessage,
  }) = _SignUpStateData;

  factory SignUpState.fromJson(Map<String, dynamic> json) =>
      _$SignUpStateFromJson(json);
}
