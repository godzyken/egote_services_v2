part of 'get_all_event_state.dart';

sealed class GetAllEventError extends GetAllAuthEventState {
  const GetAllEventError();
}

class QueryGetAllEventError extends GetAllEventError {
  final Object object;
  final StackTrace stackTrace;

  const QueryGetAllEventError(this.object, this.stackTrace);
}
