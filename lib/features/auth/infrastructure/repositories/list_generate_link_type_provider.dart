import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// --- NOTIFIERS (Riverpod 3 Syntax) ---

/// Gestionnaire d'un type de lien individuel
class GenerateLinkNotifier extends Notifier<GenerateLinkType> {
  @override
  GenerateLinkType build() {
    // État initial
    return GenerateLinkType.invite;
  }

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

/// Gestionnaire d'une liste de types de liens (anciennement commenté, migré propre)
class GenerateListNotifier extends Notifier<List<GenerateLinkType>> {
  @override
  List<GenerateLinkType> build() {
    return const [];
  }

  void addLinkType(GenerateLinkType type) {
    state = [...state, type];
  }

  void removeLinkType(GenerateLinkType type) {
    state = state.where((element) => element != type).toList();
  }
}

// --- PROVIDERS ---

final generateLinkTypeNotifierProvider =
NotifierProvider<GenerateLinkNotifier, GenerateLinkType>(
  GenerateLinkNotifier.new,
  name: 'GenerateLinkNotifierProvider',
);

final generateLinkListNotifierProvider =
NotifierProvider<GenerateListNotifier, List<GenerateLinkType>>(
  GenerateListNotifier.new,
  name: 'GenerateLinkListNotifierProvider',
);