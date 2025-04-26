import 'package:egote_services_v2/features/home/presentation/widget/godzylogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controller/providers/lock_screen/lock_screen_provider.dart';

class LockScreen extends ConsumerWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLocked = ref.read(lockScreenProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-GoTE'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Processus de déverrouillage : ici tu pourrais ajouter un PIN ou authentification biométrique
              isLocked.state = false;

              GoRouter.of(context).pop();
            },
            child: Godzylogo()),
      ),
    );
  }
}
