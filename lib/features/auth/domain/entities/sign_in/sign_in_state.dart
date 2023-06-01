import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_properties/properties_extensions.dart';

part 'sign_in_state.freezed.dart';
part 'sign_in_state.g.dart';

@freezed
class SignInState with _$SignInState {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory SignInState({
    @JsonKey(
      defaultValue: 'EmailFormz.pure()',
      includeFromJson: false,
      includeToJson: false,
    )
    EmailFormz? emailFormz,
    @JsonKey(
      defaultValue: 'PasswordFormz.pure()',
      includeFromJson: false,
      includeToJson: false,
    )
    PasswordFormz? passwordFormz,
    @JsonKey(
      defaultValue: FormzSubmissionStatus.initial,
      includeFromJson: false,
      includeToJson: false,
    )
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) = _SignInState;

  factory SignInState.fromJson(Map<String, dynamic> json) =>
      _$SignInStateFromJson(json);
}