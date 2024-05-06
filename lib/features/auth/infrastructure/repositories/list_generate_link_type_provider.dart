import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*
class GenerateNotifier extends StateNotifier<List<GenerateLinkType>> {
  GenerateNotifier() : super([]);

  void addLinkType(GenerateLinkType type) => state = [...state, type];

  void removeLinkType(GenerateLinkType type) =>
      state = [...state..remove(type)];
}

final generateLinkTypeProvider =
    StateNotifierProvider.autoDispose<GenerateNotifier, List<GenerateLinkType>>(
        (ref) => GenerateNotifier());
*/

class GenerateLinkNotifier extends StateNotifier<GenerateLinkType> {
  GenerateLinkNotifier() : super(GenerateLinkType.invite);

  Future<void> fetchStatusInvite() async {
    state = GenerateLinkType.unknown;

    await Future.delayed(const Duration(seconds: 2));

    state = GenerateLinkType.invite;
  }

  Future<void> fetchStatusSignUp() async {
    state = GenerateLinkType.recovery;

    await Future.delayed(const Duration(seconds: 2));

    state = GenerateLinkType.signup;
  }
}

final generateLinkTypeNotifierProvider =
    StateNotifierProvider.autoDispose<GenerateLinkNotifier, GenerateLinkType>(
        (ref) => GenerateLinkNotifier(),
        name: 'generate link notifier provider');
