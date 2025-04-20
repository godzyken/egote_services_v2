import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/devis/domain/repository/devis_repository.dart';

final devisRepoProvider = Provider<DevisRepository>((ref) {
  final client = ref.read(supabaseClientProvider);
  return DevisRepository(client);
});
