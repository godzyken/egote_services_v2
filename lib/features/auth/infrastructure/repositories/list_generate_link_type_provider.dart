import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GenerateNotifier extends StateNotifier<List<GenerateLinkType>> {
  GenerateNotifier() : super([]);

  void addLinkType(GenerateLinkType type) => state = [...state, type];

  void removeLinkType(GenerateLinkType type) =>
      state = [...state..remove(type)];
}

final generateLinkTypeProvider =
    StateNotifierProvider.autoDispose<GenerateNotifier, List<GenerateLinkType>>(
        (ref) => GenerateNotifier());
