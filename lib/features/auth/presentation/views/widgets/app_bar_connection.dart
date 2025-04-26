import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/home/domain/entities/notifier/application_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/providers/supabase/supabase_providers.dart';

class AppBarConnection extends ConsumerWidget {
  const AppBarConnection(
      {super.key, required this.child, required this.preload});

  final Widget child;
  final bool preload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateStreamProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr!.mfaConnect),
        actions: [
          PopupMenuButton(
            onSelected: (value) async {
              switch (value) {
                case 'unEnroll':
                  context.goNamed('mfaList');
                  break;
                case 'signOut':
                  await ref.read(supabaseClientProvider).auth.signOut();
                  if (context.mounted) context.goNamed('auth');
                  break;
                case 'user_home':
                  context.goNamed('user_home');
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'unEnroll',
                  child: Text(context.tr!.unEnroll),
                ),
                PopupMenuItem(
                  value: 'signOut',
                  child: Text(context.tr!.signOut),
                ),
              ];
            },
            child: const Icon(Icons.more_vert),
          )
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: child,
    );
  }
}
