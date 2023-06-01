import 'dart:developer' as developer;

import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers/auth_providers.dart';

class SignInWithGoogleButton extends ConsumerWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          try {
            ref.read(signInWithGoogleProvider.notifier).signInWithGoogle();
          } catch (e) {
            developer.log(e.toString());
          }
        },
        child: Text(context.tr!.signInWithGoogle));
  }
}