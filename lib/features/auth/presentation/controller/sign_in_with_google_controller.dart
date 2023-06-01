import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/providers/auth_repository_provider.dart';

class SignInWithGoogleController extends StateNotifier<bool> {
  SignInWithGoogleController(this._ref) : super(false);

  final Ref _ref;

  Future<void> signInWithGoogle() async {
    developer.log('Sign in with Google 2 : ${_ref.container}');
    await _ref.read(authRepositoryProvider).signInWithGoogle();
  }
}
