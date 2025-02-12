import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository_interface.dart';

import 'create_user_usecase.dart';

class CreateUserCaseImpl implements CreateUserCase {
  final UserRepositoryInterface _repository;

  CreateUserCaseImpl(this._repository);

  @override
  Future<UserEntityModel> execute(
    final String name,
    final String email,
    final String role,
    final String externalId,
    final String phone,
    final String externalLink,
    final bool isComplete,
    final DateTime createdAt,
    final DateTime updatedAt,
    final DateTime emailConfirmedAt,
    final DateTime phoneConfirmedAt,
    final DateTime lastSignInAt,
  ) async {
    return await _repository.createUser(
      name,
      email,
      role,
      externalId,
      phone,
      externalLink,
      isComplete,
      createdAt,
      updatedAt,
      emailConfirmedAt,
      phoneConfirmedAt,
      lastSignInAt,
    );
  }
}
