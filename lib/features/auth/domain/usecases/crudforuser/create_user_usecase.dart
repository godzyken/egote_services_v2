import '../../entities/user/user_entity.dart';

abstract class CreateUserCase {
  Future<UserEntityModel> execute (
      final String name,
      final String role,
      final bool isComplete,
      final DateTime createdAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      );
}