import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository.dart';

import 'create_user_usecase.dart';

class CreateUserCaseImpl implements CreateUserCase {
  final UserRepositoryInterface _repository;

  const CreateUserCaseImpl(this._repository);

  @override
  Future<UserEntityModel> execute(
      final String name,
      final DateTime createAt,
      final DateTime updateAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      final String role
      ) {
    return _repository.createUser(
        name,
        createAt,
        updateAt,
        emailConfirmedAt,
        phoneConfirmedAt,
        lastSignInAt,
        role
    );
  }

}