import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../infrastructure/supabase_graph_repository.dart';
import '../infrastructure/talker_graph_sink.dart';

final talkerGraphSinkProvider = Provider<TalkerGraphSink>((ref) {
  return TalkerGraphSink();
});

final graphRepositoryProvider = Provider<SupabaseGraphRepository>((ref) {
  return SupabaseGraphRepository();
});
