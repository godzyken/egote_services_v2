import 'package:egote_services_v2/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var auth = ref.watch(authStateChangesProvider);
      return auth.when(
          data: (data) => Container(child: child),
          error: (error, stackTrace) => ErrorWidget(error),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              ));
    });
  }
}
