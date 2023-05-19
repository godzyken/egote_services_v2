import 'package:egote_services_v2/config/providers.dart';
import 'package:egote_services_v2/features/common/presentation/views/screens/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key, required this.uid, required this.pid})
      : super(key: key);

  final String uid;
  final String pid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authStateChangesProvider);
    return authController.when(
        data: (data) => Scaffold(
                appBar: AppBar(
              title: uid.isNotEmpty && pid.isNotEmpty
                  ? Text(data!.displayName!)
                  : const Text('no data!'),
            )),
        error: (error, stackTrace) => ErrorScreen(error: error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
