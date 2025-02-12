import '../../entities/user/user_entity.dart';

abstract class CreateUserCase {
  Future<UserEntityModel> execute(
    final String name,
    final String email,
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
  );
}
