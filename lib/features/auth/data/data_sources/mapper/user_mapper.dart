import 'package:egote_services_v2/features/auth/domain/entities/entities_extension.dart';

import '../../entities/users_entity.dart';

class UserMapper {
  static UserEntityModel transformToModel(final UserEntity entity) {
    return UserEntityModel(
      id: UserId(value: entity['id']),
      name: entity['name'],
      email: entity['email'],
      avatarUrl: entity['avatar_url'],
      role: entity['role'],
      externalId: entity['externalId'],
      phone: entity['phone'],
      externalLink: entity['externalLink'],
      isComplete: entity['is_complete'] == 1,
      createdAt: DateTime.parse(entity['created_at']),
      updatedAt: DateTime.parse(entity['updated_at']),
      emailConfirmedAt: DateTime.parse(entity['email_confirmed_at']),
      phoneConfirmedAt: DateTime.parse(entity['phone_confirmed_at']),
      lastSignInAt: DateTime.parse(entity['last_sign_in_at']),
    );
  }

  static UserEntity transformToMap(final UserEntityModel model) {
    return {
      'id': model.id.value,
      'name': model.name,
      'email': model.email,
      'avatar_url': model.avatarUrl,
      'role': model.role,
      'externalId': model.externalId,
      'phone': model.phone,
      'externalLink': model.externalLink,
      'is_complete': model.isComplete ? 1 : 0,
      'created_at': model.createdAt.toIso8601String(),
      'updated_at': model.updatedAt.toIso8601String(),
      'email_confirmed_at': model.emailConfirmedAt.toIso8601String(),
      'phone_confirmed_at': model.phoneConfirmedAt.toIso8601String(),
      'last_sign_in_at': model.lastSignInAt.toIso8601String(),
    };
  }

  static UserEntity transformToNewEntityMap(
    final String name,
    final String email,
    final String avatarUrl,
    final String role,
    final String externalId,
    final String phone,
    final String externalLink,
    final bool isComplete,
    final DateTime createdAt,
    final DateTime updateAt,
    final DateTime emailConfirmedAt,
    final DateTime phoneConfirmedAt,
    final DateTime lastSignInAt,
  ) {
    return {
      'id': null,
      'name': name,
      'email': email,
      'avatar_url': avatarUrl,
      'role': role,
      'externalId': externalId,
      'phone': phone,
      'externalLink': externalLink,
      'is_complete': isComplete ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updateAt.toIso8601String(),
      'email_confirmed_at': emailConfirmedAt.toIso8601String(),
      'phone_confirmed_at': phoneConfirmedAt.toIso8601String(),
      'last_sign_in_at': lastSignInAt.toIso8601String(),
    };
  }
}
