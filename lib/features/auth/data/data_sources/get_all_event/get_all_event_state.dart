import 'package:connectycube_sdk/connectycube_calls.dart';

part 'get_all_event_error.dart';

sealed class GetAllAuthEventState {
  const GetAllAuthEventState();
}

class SuccessGetAllEventState extends GetAllAuthEventState {
  final List<CubeUser> userEntity;

  const SuccessGetAllEventState(this.userEntity);

  CubeUser? get cubeUser => userEntity.firstOrNull;
}
