import 'package:json_annotation/json_annotation.dart';

import 'user_id.dart';

class UserIdConverter implements JsonConverter<UserId, int> {
  const UserIdConverter();

  @override
  UserId fromJson(int json) {
    return UserId(value: json);
  }

  @override
  int toJson(UserId userId) {
    return userId.value;
  }
}
