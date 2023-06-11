import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';

abstract class DeleteUserCase {
  Future<void> execute(final UserId id);
}