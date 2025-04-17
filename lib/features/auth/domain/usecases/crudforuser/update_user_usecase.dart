import '../../entities/user/user_id.dart';

abstract class UpdateUserCase {
  Future<void> execute(
    final UserId id,
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
  );
}
