import 'package:egote_services_v2/features/auth/domain/entities/user/user_id.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository.dart';

import 'delete_user_usecase.dart';

class DeleteUserCaseImpl implements DeleteUserCase {
  final UserRepositoryInterface _repositoryInterface;

  const DeleteUserCaseImpl(this._repositoryInterface);

  @override
  Future<void> execute(final UserId id) => _repositoryInterface.deleteUser(id);

}