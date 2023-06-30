import 'package:egote_services_v2/config/providers/supabase/supabase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppBarConnection extends ConsumerWidget {
  const AppBarConnection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('Mfa Connection'),
      actions: [
        PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: const Text('Unenroll MFA'),
                onTap: () {
                  context.push('mfaList');
                },),
                PopupMenuItem(child: const Text('Logout'),
                onTap: () {
                  ref.watch(supabaseClientProvider).auth.signOut();
                  context.push('auth');
                },),
              ];
            },
        )
      ],
    );
  }
}
