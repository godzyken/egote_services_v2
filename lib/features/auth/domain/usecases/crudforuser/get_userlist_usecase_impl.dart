import 'package:egote_services_v2/features/auth/domain/entities/user/user_list_entity.dart';
import 'package:egote_services_v2/features/auth/domain/repository/user_repository.dart';

import 'get_userlist_usecase.dart';

class GetUserListCaseImpl implements GetUserListCase {
  final UserRepositoryInterface _repositoryInterface;

  const GetUserListCaseImpl(this._repositoryInterface);

  @override
  Future<UserList> execute() => _repositoryInterface.getAllUsers();

}