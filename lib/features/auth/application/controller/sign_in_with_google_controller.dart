import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/auth_repository_provider.dart';


class SignInWithGoogleController extends Notifier<bool> {
  @override
  bool build() {
    // Initialise l'état à false (loading/state par défaut)
    return false;
  }

  Future<void> signInWithGoogle() async {
    // ref est directement disponible dans la classe
    developer.log('Sign in with Google 2 : ${ref.container}');
    await ref.read(authRepositoryProvider).signInWithGoogle();
  }
}

// Provider associé
final signInWithGoogleControllerProvider =
NotifierProvider<SignInWithGoogleController, bool>(
  SignInWithGoogleController.new,
);
