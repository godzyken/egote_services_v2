import '../../entities/user/user_entity.dart';

abstract class CreateUserCase {
  Future<UserEntityModel> execute (
      final String name,
      final DateTime createAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      final String role,
      );
}