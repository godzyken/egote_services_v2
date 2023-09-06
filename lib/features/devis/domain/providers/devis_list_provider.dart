import 'package:egote_services_v2/features/devis/domain/datasources/get_all_event/get_all_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../datasources/get_all_event/get_all_event_state.dart';
import 'check_out_service_provider.dart';

part 'devis_list_provider.g.dart';

@riverpod
Future<GetAllEventState> eventList(EventListRef ref) async {
  final service = ref.watch(checkoutServiceProvider);

  return getAllEvent.run(service);
}
