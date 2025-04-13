import 'dart:math' as math;

import 'package:egote_services_v2/config/app_shared/images/list_local.dart';
import 'package:egote_services_v2/config/providers/firebase/firebase_providers.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Godzylogo extends ConsumerWidget {
  const Godzylogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(appStateProvider);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Godzy Logo'),
        ),
        body: isLoggedIn.isSuccess
            ? _buildSizedBox
            : ElevatedButton(
                onPressed: () async {
                  await FirebaseUIAuth.signOut(
                      context: context, auth: ref.watch(firebaseAuthProvider));
                },
                child: Text('Log in')));
  }

  SizedBox get _buildSizedBox {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(LocalImages.godzyLogo),
                fit: BoxFit.fill)),
        child: Transform(
          transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0x0fe8581c).withAlpha(128),
            child: Text(
              'Trouver son utilité',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
