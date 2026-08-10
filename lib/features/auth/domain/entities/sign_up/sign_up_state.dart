import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_properties/properties_extensions.dart';

part 'sign_up_state.freezed.dart';
part 'sign_up_state.g.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const SignUpState._();
  const factory SignUpState({
    @JsonKey(includeToJson: false, includeFromJson: false)
    NameFormz? nameFormz,
    @JsonKey(includeFromJson: false, includeToJson: false)
    EmailFormz? emailFormz,
    @JsonKey(includeFromJson: false, includeToJson: false)
    PasswordFormz? passwordFormz,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) = _SignUpState;

  factory SignUpState.fromJson(Map<String, dynamic> json) =>
      _$SignUpStateFromJson(json);
}
