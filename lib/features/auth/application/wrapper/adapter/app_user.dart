import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String email,
    String? displayName,
    required UserLevel level,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

enum UserLevel {
  @JsonValue('admin')
  admin,
  @JsonValue('support')
  support,
  @JsonValue('user')
  user,
  @JsonValue('guest')
  guest,
}
