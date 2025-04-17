import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository_interface.dart';
import 'package:egote_services_v2/features/auth/domain/usecases/crudforuser/update_user_usecase.dart';

class UpdateUserCaseImpl implements UpdateUserCase {
  final UserRepositoryInterface _repositoryInterface;

  const UpdateUserCaseImpl(this._repositoryInterface);

  @override
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
  ) {
    return _repositoryInterface.updateUser(
      id,
      name,
      email,
      avatarUrl,
      role,
      externalId,
      phone,
      externalLink,
      isComplete,
      createdAt,
      updateAt,
      emailConfirmedAt,
      phoneConfirmedAt,
      lastSignInAt,
    );
  }
}
