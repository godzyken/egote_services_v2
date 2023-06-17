import 'package:egote_services_v2/features/auth/domain/entities/user/user_entity.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository.dart';

import '../../../../../config/providers.dart';
import 'create_user_usecase.dart';

class CreateUserCaseImpl implements CreateUserCase {
  final UserRepositoryInterface _repository;

  CreateUserCaseImpl(this._repository);

  final client = supabaseProvider;

  @override
  Future<UserEntityModel> execute(
      final String name,
      final String role,
      final bool isComplete,
      final DateTime createdAt,
      final DateTime updatedAt,
      final DateTime emailConfirmedAt,
      final DateTime phoneConfirmedAt,
      final DateTime lastSignInAt,
      ) async {

    return await _repository.createUser(
        name,
        role,
        isComplete,
        createdAt,
        updatedAt,
        emailConfirmedAt,
        phoneConfirmedAt,
        lastSignInAt,
    );
  }

}