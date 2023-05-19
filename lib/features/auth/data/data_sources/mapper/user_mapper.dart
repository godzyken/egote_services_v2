import '../../../domain/entities/user/user_entity.dart';
import '../../entities/users_entity.dart';

class UserMapper {
  static UserEntityModel transformToModel(final UserEntity entity) {
    return UserEntityModel(id: entity['id'], name: entity['name']);
  }

  static UserEntity transformToMap(final UserEntityModel model) {
    return {
      'id': model.id,
      'name': model.name,
    };
  }

  static UserEntity transformToNewEntityMap(final String name) {
    return {
      'id': null,
      'name': name,
    };
  }
}
