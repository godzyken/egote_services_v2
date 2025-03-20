import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_entity.dart';

class UserEntityModelConverter
    implements JsonConverter<UserEntityModel, Map<String, dynamic>> {
  const UserEntityModelConverter();

  @override
  UserEntityModel fromJson(Map<String, dynamic> json) {
    return UserEntityModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserEntityModel userEntityModel) {
    return userEntityModel.toJson();
  }
}
