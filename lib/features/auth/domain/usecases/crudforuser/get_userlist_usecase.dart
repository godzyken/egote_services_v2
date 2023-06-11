import '../../entities/user/user_list_entity.dart';

abstract class GetUserListCase{
  Future<UserList> execute();
}