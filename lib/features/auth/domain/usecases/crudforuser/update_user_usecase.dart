import '../../entities/user/user_id.dart';

abstract class UpdateUserCase {
  Future<void> execute(
  final UserId id,
  final String name,
  final DateTime createdAt,
  final DateTime updateAt,
  final DateTime emailConfirmedAt,
  final DateTime phoneConfirmedAt,
  final DateTime lastSignInAt,
  final String role,
  );
}